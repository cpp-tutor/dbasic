import std.stdio : writeln;
import SymbolTable : SymbolTable, Edition;
import Expr : Expr, StringExpr;
import Parser : Parser, TokenKind;

class Node {
    protected Node left, right;
    static protected SymbolTable symtab;
    this() {
        left = right = null;
    }
    this(Node l, Node r) {
        left = l;
        right = r;
    }
    this(SymbolTable s) {
        symtab = s;
        left = right = null;
    }
    final ref Node link(Node n) { // must return ref
        if (right) {
            throw new Exception("CANNOT LINK NODE");
        }
        right = n;
        return right;
    }
    final void linkLast(Node n) {
        auto last = this;
        while (last.right !is null) {
            last = last.right;
        }
        last.right = n;
    }
    final void prelude() const {
        writeln("\t.section .mixed, \"awx\"");
        writeln("\t.global basic_run");
        writeln("\t.arch armv2");
        writeln("\t.syntax unified");
        writeln("\t.arm");
        writeln("\t.fpu vfp");
        writeln("\t.type    basic_run, %function");
        writeln("basic_run:");
        writeln("\tpush\t{ lr }");
        writeln("\tmvn\tr0, #0");
        writeln("\tpush\t{ r0 }");
    }
    final void interlude() const {
        writeln(".basic_end:");
        writeln("\tpop\t{ r0 }");
        writeln("\tcmn\tr0, #1");
        writeln("\tmovne\tr0, #2"); // error: end within GOSUB/FN
        writeln("\tmovne\tr1, #", symtab.line & 0xff00);
        writeln("\torrne\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblne\truntime_error(PLT)");
        writeln("\tmov\tr0, #0");
        writeln("\tpop\t{ pc }");
        writeln("\t.balign 8");
    }
    void codegen() {
        if (right) {
            right.codegen();
        }
    }
}

class Branch : Node {
    this(Node l) {
        left = l;
        right = null;
    }
    override void codegen() {
        if (left is null) {
            throw new Exception("BAD BRANCH NODE");
        }
        left.codegen();
        super.codegen();
    }
}

class Line : Node {
    private ushort line;
    this(ushort l) {
        line = l;
    }
    override void codegen() {
        symtab.setLine(line, false);
        if (symtab.referencedLine(line)) {
            writeln(".", line, ":");
        }
        super.codegen();
    }
}

class Stop : Node {
    override void codegen() {
        writeln("\tb\t.basic_end");
        super.codegen();
    }
}

class Goto : Node {
    private ushort line;
    this(ushort l) {
        line = l;
        symtab.registerFlow(line);
    }
    override void codegen() {
        if (!symtab.referencedLine(line)) {
            throw new Exception("BAD LINE");
        }
        writeln("\tb\t.", line);
        super.codegen();
    }
}

class GoSub : Node {
    private ushort line;
    this(ushort l) {
        line = l;
        symtab.registerFlow(line);
    }
    override void codegen() {
        if (!symtab.referencedLine(line)) {
            throw new Exception("BAD LINE");
        }
        writeln("\tadd\tr14, pc, #4");
        writeln("\tpush\t{ r14 }");
        writeln("\tb\t.", line);
        writeln("\tnop"); // for some armv3
        super.codegen();
    }
}

class Return : Node {
    override void codegen() {
        writeln("\tpop\t{ r14 }");
        writeln("\tcmn\tr14, #1");
        writeln("\tmoveq\tr0, #3"); // error: not within GOSUB/FN
        writeln("\tmoveq\tr1, #", symtab.line & 0xff00);
        writeln("\torreq\tr1, r1, #", symtab.line & 0xff);
        writeln("\tbleq\truntime_error(PLT)");
        writeln("\tmov\tpc, r14");
        super.codegen();
    }
}

class Let : Node {
    private int ident;
    this(int i, Expr e) {
        ident = i;
        symtab.initializeId(ident);
        left = e;
    }
    override void codegen() {
        Expr.clearRegs();
        left.codegen();
        writeln("\tadrl\tr0, .", symtab.getId(ident));
        writeln("\tvstr.f64\td", (cast(Expr)left).result, ", [r0]");
        super.codegen();
    }
}

class LetDim : Node {
    private int ident;
    this(int i, Expr idx, Expr e) {
        ident = i;
        symtab.initializeDim(ident);
        left = new Node(idx, e);
    }
    override void codegen() {
        Expr.clearRegs();
        left.left.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", (cast(Expr)(left.left)).result);
        writeln("\tvmov\tr0, s0");
        writeln("\tadrl\tr1, ._size", symtab.getId(ident));
        writeln("\tldr\tr1, [r1]");
        writeln("\tcmp\tr0, r1");
        writeln("\tmovgt\tr0, #4"); // error: index out of bounds
        writeln("\tmovgt\tr1, #", symtab.line & 0xff00);
        writeln("\torrgt\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblgt\truntime_error(PLT)");
        writeln("\tpush\t{ r0 }");
        Expr.clearRegs();
        left.right.codegen();
        writeln("\tpop\t{ r0 }");
        writeln("\tadrl\tr1, ._data", symtab.getId(ident));
        writeln("\tadd\tr0, r1, r0, LSL #3");
        writeln("\tvstr.f64\td", (cast(Expr)(left.right)).result, ", [r0]");
        super.codegen();
    }
}

class LetDim2 : Node {
    private int ident;
    this(int i, Expr idx1, Expr idx2, Expr e) {
        ident = i;
        symtab.initializeDim2(ident);
        left = new Node(new Node(idx1, idx2), e);
    }
    override void codegen() {
        Expr.clearRegs();
        left.left.left.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", (cast(Expr)(left.left.left)).result);
        writeln("\tvmov\tr1, s0");
        writeln("\tpush\t{ r1 }");
        Expr.clearRegs();
        left.left.right.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", (cast(Expr)(left.left.right)).result);
        writeln("\tvmov\tr2, s0");
        writeln("\tpop\t{ r1 }");
        writeln("\tadrl\tr0, ._size2", symtab.getId(ident));
        writeln("\tldr\tr3, [r0, #0]");
        writeln("\tcmp\tr1, r3");
        writeln("\tldrle\tr3, [r0, #4]");
        writeln("\tcmple\tr2, r3");
        writeln("\tmovgt\tr0, #4"); // error: index out of bounds
        writeln("\tmovgt\tr1, #", symtab.line & 0xff00);
        writeln("\torrgt\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblgt\truntime_error(PLT)");
        writeln("\tadd\tr3, r3, #1");
        writeln("\tmla\tr0, r1, r3, r2"); // offset = idx1 * (sz2 + 1) + idx2
        writeln("\tpush\t{ r0 }");
        Expr.clearRegs();
        left.right.codegen();
        writeln("\tpop\t{ r0 }");
        writeln("\tadrl\tr1, ._data2", symtab.getId(ident));
        writeln("\tadd\tr0, r1, r0, LSL #3");
        writeln("\tvstr.f64\td", (cast(Expr)(left.right)).result, ", [r0]");
        super.codegen();
    }
}

class Read : Node {
    private int ident;
    this(int i) {
        ident = i;
        symtab.initializeId(ident);
        symtab.useData(true);
    }
    override void codegen() {
        writeln("\tadrl\tr0, ._data_ptr");
        writeln("\tadrl\tr1, ._data_max");
        writeln("\tldr\tr2, [r0]");
        writeln("\tldr\tr3, [r1]");
        writeln("\tcmp\tr2, r3");
        writeln("\tmovge\tr0, #1"); // error: out of data
        writeln("\tmovge\tr1, #", symtab.line & 0xff00);
        writeln("\torrge\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblge\truntime_error(PLT)");
        writeln("\tadrl\tr3, ._data");
        writeln("\tadd\tr3, r3, r2, LSL #3");
        writeln("\tvldr.f64\td0, [r3]");
        writeln("\tadd\tr2, r2, #1");
        writeln("\tstr\tr2, [r0]");
        writeln("\tadrl\tr0, .", symtab.getId(ident));
        writeln("\tvstr.f64\td0, [r0]");
        super.codegen();
    }
}

class ReadDim : Node {
    private int ident;
    this(int i, Expr e) {
        ident = i;
        left = e;
        symtab.initializeDim(ident);
        symtab.useData(true);
    }
    override void codegen() {
        Expr.clearRegs();
        left.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", (cast(Expr)(left)).result);
        writeln("\tvmov\tr0, s0");
        writeln("\tadrl\tr1, ._size", symtab.getId(ident));
        writeln("\tldr\tr1, [r1]");
        writeln("\tcmp\tr0, r1");
        writeln("\tmovgt\tr0, #4"); // error: index out of bounds
        writeln("\tmovgt\tr1, #", symtab.line & 0xff00);
        writeln("\torrgt\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblgt\truntime_error(PLT)");
        writeln("\tadrl\tr1, ._data", symtab.getId(ident));
        writeln("\tadd\tr0, r1, r0, LSL #3");
        writeln("\tpush\t{ r0 }");
        writeln("\tadrl\tr0, ._data_ptr");
        writeln("\tadrl\tr1, ._data_max");
        writeln("\tldr\tr2, [r0]");
        writeln("\tldr\tr3, [r1]");
        writeln("\tcmp\tr2, r3");
        writeln("\tmovge\tr0, #1"); // error: out of data
        writeln("\tmovge\tr1, #", symtab.line & 0xff00);
        writeln("\torrge\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblge\truntime_error(PLT)");
        writeln("\tadrl\tr3, ._data");
        writeln("\tadd\tr3, r3, r2, LSL #3");
        writeln("\tvldr.f64\td0, [r3]");
        writeln("\tadd\tr2, r2, #1");
        writeln("\tstr\tr2, [r0]");
        writeln("\tpop\t{ r0 }");
        writeln("\tvstr.f64\td0, [r0]");
        super.codegen();
    }
}

class ReadDim2 : Node {
    private int ident;
    this(int i, Expr idx1, Expr idx2) {
        ident = i;
        left = new Node(idx1, idx2);
        symtab.initializeDim2(ident);
        symtab.useData(true);
    }
    override void codegen() {
        Expr.clearRegs();
        left.left.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", (cast(Expr)(left.left)).result);
        writeln("\tvmov\tr1, s0");
        writeln("\tpush\t{ r1 }");
        Expr.clearRegs();
        left.right.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", (cast(Expr)(left.right)).result);
        writeln("\tvmov\tr2, s0");
        writeln("\tpop\t{ r1 }");
        writeln("\tadrl\tr0, ._size2", symtab.getId(ident));
        writeln("\tldr\tr3, [r0, #0]");
        writeln("\tcmp\tr1, r3");
        writeln("\tldrle\tr3, [r0, #4]");
        writeln("\tcmple\tr2, r3");
        writeln("\tmovgt\tr0, #4"); // error: index out of bounds
        writeln("\tmovgt\tr1, #", symtab.line & 0xff00);
        writeln("\torrgt\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblgt\truntime_error(PLT)");
        writeln("\tadd\tr3, r3, #1");
        writeln("\tmla\tr0, r1, r3, r2"); // offset = idx1 * (sz2 + 1) + idx2
        writeln("\tpush\t{ r0 }");
        writeln("\tadrl\tr0, ._data_ptr");
        writeln("\tadrl\tr1, ._data_max");
        writeln("\tldr\tr2, [r0]");
        writeln("\tldr\tr3, [r1]");
        writeln("\tcmp\tr2, r3");
        writeln("\tmovge\tr0, #1"); // error: out of data
        writeln("\tmovge\tr1, #", symtab.line & 0xff00);
        writeln("\torrge\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblge\truntime_error(PLT)");
        writeln("\tadrl\tr3, ._data");
        writeln("\tadd\tr3, r3, r2, LSL #3");
        writeln("\tvldr.f64\td0, [r3]");
        writeln("\tadd\tr2, r2, #1");
        writeln("\tstr\tr2, [r0]");
        writeln("\tpop\t{ r0 }");
        writeln("\tadrl\tr1, ._data2", symtab.getId(ident));
        writeln("\tadd\tr0, r1, r0, LSL #3");
        writeln("\tvstr.f64\td0, [r0]");
        super.codegen();
    }
}

class Input : Node {
    private int ident;
    this(int i) {
        ident = i;
        symtab.initializeId(ident);
    }
    override void codegen() {
        writeln("\tadrl\tr0, .", symtab.getId(ident));
        writeln("\tbl\tinput_number(PLT)");
        super.codegen();
    }
}

class InputDim : Node {
    private int ident;
    this(int i, Expr e) {
        ident = i;
        symtab.initializeDim(ident);
        left = e;
    }
    override void codegen() {
        Expr.clearRegs();
        left.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", (cast(Expr)(left)).result);
        writeln("\tvmov\tr0, s0");
        writeln("\tadrl\tr1, ._size", symtab.getId(ident));
        writeln("\tldr\tr1, [r1]");
        writeln("\tcmp\tr0, r1");
        writeln("\tmovgt\tr0, #4"); // error: index out of bounds
        writeln("\tmovgt\tr1, #", symtab.line & 0xff00);
        writeln("\torrgt\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblgt\truntime_error(PLT)");
        writeln("\tadrl\tr1, ._data", symtab.getId(ident));
        writeln("\tadd\tr0, r1, r0, LSL #3");
        writeln("\tbl\tinput_number(PLT)");
        super.codegen();
    }
}

class InputDim2 : Node {
    private int ident;
    this(int i, Expr idx1, Expr idx2) {
        ident = i;
        symtab.initializeDim2(ident);
        left = new Node(idx1, idx2);
    }
    override void codegen() {
        Expr.clearRegs();
        left.left.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", (cast(Expr)(left.left)).result);
        writeln("\tvmov\tr1, s0");
        writeln("\tpush\t{ r1 }");
        Expr.clearRegs();
        left.right.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", (cast(Expr)(left.right)).result);
        writeln("\tvmov\tr2, s0");
        writeln("\tpop\t{ r1 }");
        writeln("\tadrl\tr0, ._size2", symtab.getId(ident));
        writeln("\tldr\tr3, [r0, #0]");
        writeln("\tcmp\tr1, r3");
        writeln("\tldrle\tr3, [r0, #4]");
        writeln("\tcmple\tr2, r3");
        writeln("\tmovgt\tr0, #4"); // error: index out of bounds
        writeln("\tmovgt\tr1, #", symtab.line & 0xff00);
        writeln("\torrgt\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblgt\truntime_error(PLT)");
        writeln("\tadd\tr3, r3, #1");
        writeln("\tmla\tr0, r1, r3, r2"); // offset = idx1 * (sz2 + 1) + idx2
        writeln("\tadrl\tr1, ._data2", symtab.getId(ident));
        writeln("\tadd\tr0, r1, r0, LSL #3");
        writeln("\tbl\tinput_number(PLT)");
        super.codegen();
    }
}

class If : Node {
    private ushort line;
    private int relop, lhs, rhs;
    this(Expr l, int op, Expr r, ushort n) {
        left = new Node(l, r);
        relop = op;
        line = n;
        symtab.registerFlow(line);
    }
    override void codegen() {
        if (!symtab.referencedLine(line)) {
            throw new Exception("BAD LINE");
        }
        Expr.clearRegs();
        left.left.codegen();
        left.right.codegen();
        writeln("\tvcmp.f64\td", (cast(Expr)left.left).result, ", d", (cast(Expr)left.right).result);
        writeln("\tvmrs\tAPSR_nzcv, FPSCR");
        switch (relop) {
            case TokenKind.EQ:
                writeln("\tbeq\t.", line);
                break;
            case TokenKind.NE:
                writeln("\tbne\t.", line);
                break;
            case TokenKind.LT:
                writeln("\tblt\t.", line);
                break;
            case TokenKind.LE:
                writeln("\tble\t.", line);
                break;
            case TokenKind.GE:
                writeln("\tbge\t.", line);
                break;
            case TokenKind.GT:
                writeln("\tbgt\t.", line);
                break;
            default:
                throw new Exception("BAD RELOP");
        }
        super.codegen();
    }
}

class For : Node {
    private int ident, id;
    private static int[] stack, ident_stack;
    private static int for_id = -1;
    static int pop() {
        if (stack.length == 0) {
            return -1;
        }
        int popped = stack[$ - 1];
        stack = stack[0 .. $ - 1];
        return popped;
    }
    static int popID() {
        if (ident_stack.length == 0) {
            return -1;
        }
        int popped_id = ident_stack[$ - 1];
        ident_stack = ident_stack[0 .. $ - 1];
        return popped_id;
    }
    this(int i, Expr b, Expr e, Expr s) {
        left = new Node(new Node(b, e), s);
        ident = i;
        symtab.initializeId(ident);
        id = ++for_id;
        stack ~= for_id;
        ident_stack ~= ident;
    }
    override void codegen() {
        Expr.clearRegs();
        left.left.left.codegen();
        writeln("\tadrl\tr0, .", symtab.getId(ident));
        writeln("\tvstr.f64\td", (cast(Expr)(left.left.left)).result, ", [r0]");
        if (symtab.edition >= Edition.Fourth) { // check for empty for
            writeln("\tvpush\t{ d", (cast(Expr)(left.left.left)).result, " }");
            Expr.clearRegs();
            left.right.codegen();
            writeln("\tvpush\t{ d", (cast(Expr)(left.right)).result, " }");
            Expr.clearRegs();
            left.left.right.codegen();
            writeln("\tvpop\t{ d1 }");
            writeln("\tvpop\t{ d0 }");
            writeln("\tvcmp.f64\td1, #0.0");
            writeln("\tvmrs\tAPSR_nzcv, FPSCR");
            writeln("\tvcmpgt.f64\td0, d", (cast(Expr)(left.left.right)).result);
            writeln("\tvcmplt.f64\td", (cast(Expr)(left.left.right)).result, ", d0");
            writeln("\tvmrs\tAPSR_nzcv, FPSCR");
            writeln("\tbgt\t._for_end", id);
        }
        writeln("\tb\t._for_loop", id);
        writeln("._for_incr", id, ":");
        Expr.clearRegs();
        left.right.codegen();
        writeln("\tvmov.f64\td1, d", (cast(Expr)(left.right)).result);
        writeln("\tadrl\tr0, .", symtab.getId(ident));
        writeln("\tvldr.f64\td0, [r0]");
        writeln("\tvadd.f64\td0, d0, d1");
        writeln("\tvpush\t{ d0, d1 }");
        Expr.clearRegs();
        left.left.right.codegen();
        writeln("\tvpop\t{ d0, d1 }");
        writeln("\tvcmp.f64\td1, #0.0");
        writeln("\tvmrs\tAPSR_nzcv, FPSCR");
        writeln("\tvcmpgt.f64\td0, d", (cast(Expr)(left.left.right)).result);
        writeln("\tvcmplt.f64\td", (cast(Expr)(left.left.right)).result, ", d0");
        writeln("\tvmrs\tAPSR_nzcv, FPSCR");
        writeln("\tbgt\t._for_end", id);
        writeln("\tadrl\tr0, .", symtab.getId(ident));
        writeln("\tvstr.f64\td0, [r0]");
        writeln("._for_loop", id, ":");
        super.codegen();
    }
}

class Next : Node {
    private int for_id;
    this(int id) {
        for_id = For.pop();
        if (for_id == -1) {
            symtab.error("NEXT WITHOUT FOR");
        }
        if (id != For.popID()) {
            symtab.error("WRONG VARIABLE WITH NEXT");
        }
    }
    override void codegen() {
        writeln("\tb\t._for_incr", for_id);
        writeln("._for_end", for_id, ":");
        super.codegen();
    }
}

class Restore : Node {
    bool restore, restore_str;
    this (bool n = true, bool s = true) {
        restore = n;
        restore_str = s;
    }
    override void codegen() {
        if (restore) {
            writeln("\tadrl\tr0, ._data_ptr");
            writeln("\tmov\tr1, #0");
            writeln("\tstr\tr1, [r0]");
        }
        if (restore_str) {
            writeln("\tadrl\tr0, ._data_str_ptr");
            writeln("\tmov\tr1, #0");
            writeln("\tstr\tr1, [r0]");
        }
        super.codegen();
    }
}

class LetString : Node {
    private int ident;
    this(int id, StringExpr str) {
        ident = id;
        left = str;
        symtab.initializeString(ident, true);
    }
    override void codegen() {
        writeln("\tadrl\tr0, .", symtab.getId(ident), "_");
        writeln("\tldr\tr0, [r0]");
        writeln("\tteq\tr0, #0");
        writeln("\tblne\tfree(PLT)");
        left.codegen();
        writeln("\tbl\tstrdup(PLT)");
        writeln("\tadrl\tr1, .", symtab.getId(ident), "_");
        writeln("\tstr\tr0, [r1]");
        super.codegen();
    }
}

class InputString : Node {
    private int ident;
    this(int id) {
        ident = id;
        symtab.initializeString(ident, true);
    }
    override void codegen() {
        writeln("\tadrl\tr0, .", symtab.getId(ident), "_");
        writeln("\tldr\tr0, [r0]");
        writeln("\tteq\tr0, #0");
        writeln("\tblne\tfree(PLT)");
        writeln("\tbl\tinput_string(PLT)");
        writeln("\tadrl\tr1, .", symtab.getId(ident), "_");
        writeln("\tstr\tr0, [r1]");
        super.codegen();
    }
}

class ReadString : Node {
    private int ident;
    this(int id) {
        ident = id;
        symtab.initializeString(ident, true);
        symtab.useData(false, true);
    }
    override void codegen() {
        writeln("\tadrl\tr0, .", symtab.getId(ident), "_");
        writeln("\tldr\tr0, [r0]");
        writeln("\tteq\tr0, #0");
        writeln("\tblne\tfree(PLT)");
        writeln("\tadrl\tr0, ._data_str_ptr");
        writeln("\tadrl\tr1, ._data_str_max");
        writeln("\tldr\tr2, [r0]");
        writeln("\tldr\tr3, [r1]");
        writeln("\tcmp\tr2, r3");
        writeln("\tmovge\tr0, #1"); // error: out of data
        writeln("\tmovge\tr1, #", symtab.line & 0xff00);
        writeln("\torrge\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblge\truntime_error(PLT)");
        writeln("\tadrl\tr1, ._str");
        writeln("\tadd\tr3, r1, r2, LSL #2");
        writeln("\tadd\tr2, r2, #1");
        writeln("\tstr\tr2, [r0]");
        writeln("\tldr\tr0, [r3]");
        writeln("\tbl\tstrdup(PLT)");
        writeln("\tadrl\tr1, .", symtab.getId(ident), "_");
        writeln("\tstr\tr0, [r1]");
        super.codegen();
    }
}

class ReadDimString : Node {
    private int ident;
    this(int id, Expr idx) {
        ident = id;
        left = idx;
        symtab.initializeDimString(ident);
        symtab.useData(false, true);
    }
    override void codegen() {
        Expr.clearRegs();
        left.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", (cast(Expr)left).result);
        writeln("\tvmov\tr0, s0");
        writeln("\tadrl\tr1, ._sizeS", symtab.getId(ident));
        writeln("\tldr\tr1, [r1]");
        writeln("\tcmp\tr0, r1");
        writeln("\tmovgt\tr0, #4"); // error: index out of bounds
        writeln("\tmovgt\tr1, #", symtab.line & 0xff00);
        writeln("\torrgt\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblgt\truntime_error(PLT)");
        writeln("\tadrl\tr1, ._dataS", symtab.getId(ident));
        writeln("\tadd\tr1, r1, r0, LSL #2");
        writeln("\tpush\t{ r1 }");
        writeln("\tldr\tr0, [r1]");
        writeln("\tteq\tr0, #0");
        writeln("\tblne\tfree(PLT)");
        writeln("\tadrl\tr0, ._data_str_ptr");
        writeln("\tadrl\tr1, ._data_str_max");
        writeln("\tldr\tr2, [r0]");
        writeln("\tldr\tr3, [r1]");
        writeln("\tcmp\tr2, r3");
        writeln("\tmovge\tr0, #1"); // error: out of data
        writeln("\tmovge\tr1, #", symtab.line & 0xff00);
        writeln("\torrge\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblge\truntime_error(PLT)");
        writeln("\tadrl\tr1, ._str");
        writeln("\tadd\tr3, r1, r2, LSL #2");
        writeln("\tadd\tr2, r2, #1");
        writeln("\tstr\tr2, [r0]");
        writeln("\tldr\tr0, [r3]");
        writeln("\tbl\tstrdup(PLT)");
        writeln("\tpop\t{ r1 }");
        writeln("\tstr\tr0, [r1]");
        super.codegen();
    }
}

class LetDimString : Node {
    private int ident;
    this(int id, Expr idx, StringExpr str) {
        ident = id;
        left = new Node(idx, str);
        symtab.initializeDimString(ident);
    }
    override void codegen() {
        Expr.clearRegs();
        left.left.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", (cast(Expr)(left.left)).result);
        writeln("\tvmov\tr0, s0");
        writeln("\tadrl\tr1, ._sizeS", symtab.getId(ident));
        writeln("\tldr\tr1, [r1]");
        writeln("\tcmp\tr0, r1");
        writeln("\tmovgt\tr0, #4"); // error: index out of bounds
        writeln("\tmovgt\tr1, #", symtab.line & 0xff00);
        writeln("\torrgt\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblgt\truntime_error(PLT)");
        writeln("\tadrl\tr1, ._dataS", symtab.getId(ident));
        writeln("\tadd\tr1, r1, r0, LSL #2");
        writeln("\tpush\t{ r1 }");
        writeln("\tldr\tr0, [r1]");
        writeln("\tteq\tr0, #0");
        writeln("\tblne\tfree(PLT)");
        left.right.codegen();
        writeln("\tbl\tstrdup(PLT)");
        writeln("\tpop\t{ r1 }");
        writeln("\tstr\tr0, [r1]");
        super.codegen();
    }
}

class ChangeFromString : Node {
    private int dim_id, str_id;
    this(int str, int dim) {
        dim_id = dim;
        str_id = str;
        symtab.initializeString(str_id);
        symtab.initializeDim(dim_id);
    }
    override void codegen() {
        writeln("\tadrl\tr0, .", symtab.getId(str_id), "_");
        writeln("\tadrl\tr1, ._data", symtab.getId(dim_id));
        writeln("\tadrl\tr2, ._size", symtab.getId(dim_id));
        writeln("\tldr\tr2, [r2]");
        writeln("\tmov\tr3, #", symtab.line & 0xff00);
        writeln("\torr\tr3, r3, #", symtab.line & 0xff);
        writeln("\tbl\tchange_from_string(PLT)");
        super.codegen();
    }
}

class ChangeToString : Node {
    private int dim_id, str_id;
    this(int dim, int str) {
        dim_id = dim;
        str_id = str;
        symtab.initializeString(str_id, true);
        symtab.initializeDim(dim_id);
    }
    override void codegen() {
        writeln("\tadrl\tr0, .", symtab.getId(str_id), "_");
        writeln("\tadrl\tr1, ._data", symtab.getId(dim_id));
        writeln("\tadrl\tr2, ._size", symtab.getId(dim_id));
        writeln("\tldr\tr2, [r2]");
        writeln("\tmov\tr3, #", symtab.line & 0xff00);
        writeln("\torr\tr3, r3, #", symtab.line & 0xff);
        writeln("\tbl\tchange_to_string(PLT)");
        super.codegen();
    }
}

class OnGoto : Node {
    private int id;
    private int[] lines;
    private static int ongoto_id = -1;
    this(Expr e, int[] l) {
        left = e;
        lines = l;
        id = ++ongoto_id;
    }
    override void codegen() {
        Expr.clearRegs();
        left.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", (cast(Expr)(left)).result);
        writeln("\tvmov\tr1, s0");
        writeln("\tadrl\tr0, ._ongoto_jmp", id);
        writeln("\tcmp\tr1, #", lines.length);
        writeln("\tmovhi\tr1, #0");
        writeln("\tadd\tpc, r0, r1, LSL#2");
        writeln("._ongoto_jmp", id, ":");
        writeln("\tb\t._ongoto_range", id);
        foreach(l; lines) {
            ushort line = cast(ushort)l;
            if (!symtab.referencedLine(line)) {
                throw new Exception("BAD LINE");
            }
            writeln("\tb\t.", line);
        }
        writeln("._ongoto_range", id, ":");
        writeln("\tmov\tr0, #11"); // error: out of range
        writeln("\tmov\tr1, #", symtab.line & 0xff00);
        writeln("\torr\tr1, r1, #", symtab.line & 0xff);
        writeln("\tbl\truntime_error(PLT)");
        super.codegen();
    }
}

class IfString : Node {
    private ushort line;
    private int relop, lhs, rhs;
    this(StringExpr l, int op, StringExpr r, ushort n) {
        left = new Node(l, r);
        relop = op;
        line = n;
        symtab.registerFlow(line);
    }
    override void codegen() {
        if (!symtab.referencedLine(line)) {
            throw new Exception("BAD LINE");
        }
        left.left.codegen();
        writeln("\tpush\t{ r0 }");
        left.right.codegen();
        writeln("\tmov\tr1, r0");
        writeln("\tpop\t{ r0 }");
        writeln("\tbl\tstrcmp(PLT)");
        writeln("\tcmp\tr0, #0");
        switch (relop) {
            case TokenKind.EQ:
                writeln("\tbeq\t.", line);
                break;
            case TokenKind.NE:
                writeln("\tbne\t.", line);
                break;
            case TokenKind.LT:
                writeln("\tblt\t.", line);
                break;
            case TokenKind.LE:
                writeln("\tble\t.", line);
                break;
            case TokenKind.GE:
                writeln("\tbge\t.", line);
                break;
            case TokenKind.GT:
                writeln("\tbgt\t.", line);
                break;
            default:
                throw new Exception("BAD RELOP");
        }
        super.codegen();
    }
}

class Randomize : Node {
    this() {
        // empty
    }
    override void codegen() {
        writeln("\tbl\tclock(PLT)");
        writeln("\tbl\trandom_lcg(PLT)");
        super.codegen();
    }
}

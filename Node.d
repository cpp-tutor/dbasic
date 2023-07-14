import std.stdio : writeln, write, stderr;
import std.format : format;
import std.conv : to;
import SymbolTable : SymbolTable, Edition;
import Expr : Expr, StringExpr;
import Parser : Parser, TokenKind;
import Target : ll_header, ll_footer, gepDim, gepDim2, readData, gepStringDim, readStringData;

class Node {
    protected Node left, right;
    enum Control { Unset, Reachable, Unreachable }
    static protected Control status = Control.Unset; // hack for Line() dummy blocks bumping register count
    static private SymbolTable symbols;
    static private int ll_register = 0, temp_label = 0;
    @property int reg() {
        return ll_register++;
    }
    @property string label() {
        return "t" ~ to!string(temp_label++);
    }
    @property SymbolTable symtab() {
        return symbols;
    }
    this() {
        left = right = null;
    }
    this(Node l, Node r) {
        left = l;
        right = r;
    }
    this(SymbolTable s) {
        symbols = s;
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
    final void prolog() const {
        write(ll_header);
    }
    final void epilog() {
        if (status != Control.Unreachable) {
            writeln("    br label %exit");
        }
        auto next = symtab.gosub;
        if (next > 1) { // also handles function call returns
            writeln("  return:");
            auto ptr = reg;
            writeln(format("    %%%d = load i32, i32* %%_RETURN_P", ptr));
            auto dec = reg;
            writeln(format("    %%%d = sub i32 %%%d, 1", dec, ptr));
            writeln(format("    store i32 %%%d, i32* %%_RETURN_P", dec));
            auto gep = reg;
            writeln(format("    %%%d = getelementptr [%d x i32], [%d x i32]* %%_RETURN, i32 0, i32 %%%d",
                gep, symtab.max_depth, symtab.max_depth, dec));
            auto jmp = reg;
            writeln(format("    %%%d = load i32, i32* %%%d", jmp, gep));
            auto label1 = label;
            writeln(format("    switch i32 %%%d, label %%%s [", jmp, label1));
            for (int i = 1; i != next; ++i) {
                if (symtab.getReturns()[i] == true) {
                    writeln(format("      i32 %d, label %%return%d", i, i));
                }
            }
            writeln("    ]");
            writeln("  ", label1, ":");
            writeln(format("    call void @runtime_error(i32 3, i16 %u)", symtab.line)); // error: not in GoSub
            writeln("    unreachable");
        }
        write(ll_footer);
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
            if (status != Control.Unreachable) {
                writeln("    br label %.", line);
            }
            else {
                status = Control.Reachable;
            }
            writeln("  .", line, ":");
        }
        else {
            if (status == Control.Unreachable) {
                Node next = this;
                while (next !is null && cast(Line)next !is null && !symtab.isReferenced((cast(Line)next).line)) {
                    next = next.right;
                }
                if (next !is null && (cast(Line)next is null || !symtab.isReferenced((cast(Line)next).line))) {
                    throw new Exception("UNREACHABLE CODE");
                }
            }
        }
        super.codegen();
    }
}

class Stop : Node {
    override void codegen() {
        writeln("    br label %exit");
        status = Control.Unreachable;
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
        writeln("    br label %.", line);
        status = Control.Unreachable;
        super.codegen();
    }
}

class GoSub : Node {
    private ushort line;
    private int ret;
    this(ushort l) {
        line = l;
        symtab.registerFlow(line);
        ret = symtab.gosub;
    }
    override void codegen() {
        if (!symtab.referencedLine(line)) {
            throw new Exception("BAD LINE");
        }
        auto ptr = reg;
        writeln(format("    %%%d = load i32, i32* %%_RETURN_P", ptr));
        auto inc = reg;
        writeln(format("    %%%d = add i32 %%%d, 1", inc, ptr));
        auto cmp = reg;
        writeln(format("    %%%d = icmp ne i32 %%%d, %d", cmp, inc, symtab.max_depth));
        auto fct = reg;
        writeln(format("    %%%d = select i1 %%%d, void (i32, i16)* @dummy_fct, void (i32, i16)* @runtime_error", fct, cmp));
        writeln(format("    call void %%%d(i32 2, i16 %d)", fct, symtab.line)); // error: too many nested calls
        writeln(format("    store i32 %%%d, i32* %%_RETURN_P", inc));
        auto gep = reg;
        writeln(format("    %%%d = getelementptr [%d x i32], [%d x i32]* %%_RETURN, i32 0, i32 %%%d",
            gep, symtab.max_depth, symtab.max_depth, ptr));
        writeln(format("    store i32 %d, i32* %%%d", ret, gep));
        writeln("    br label %.", line);
        writeln("  return", ret, ":");
        super.codegen();
    }
    static void table() {
    }
}

class Return : Node {
    override void codegen() {
        writeln("    br label %return");
        status = Control.Unreachable;
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
        left.codegen();
        writeln(format("    store double %%%d, double* %%%s", (cast(Expr)left).result, symtab.getId(ident)));
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
        left.left.codegen();
        auto idx = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx, (cast(Expr)(left.left)).result));
        auto gep = gepDim(this, ident, idx);
        left.right.codegen();
        writeln(format("    store double %%%d, double* %%%d", (cast(Expr)(left.right)).result, gep));
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
        left.left.left.codegen();
        auto idx1 = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx1, (cast(Expr)(left.left.left)).result));
        left.left.right.codegen();
        auto idx2 = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx2, (cast(Expr)(left.left.right)).result));
        auto gep = gepDim2(this, ident, idx1, idx2);
        left.right.codegen();
        writeln(format("    store double %%%d, double* %%%d", (cast(Expr)(left.right)).result, gep));
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
        auto data = readData(this);
        writeln(format("    store double %%%d, double* %%%s", data, symtab.getId(ident)));
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
        left.codegen();
        auto idx = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx, (cast(Expr)left).result));
        auto gep = gepDim(this, ident, idx);
        auto data = readData(this);
        writeln(format("    store double %%%d, double* %%%d", data, gep));
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
        left.left.codegen();
        auto idx1 = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx1, (cast(Expr)(left.left)).result));
        left.right.codegen();
        auto idx2 = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx2, (cast(Expr)(left.right)).result));
        auto gep = gepDim2(this, ident, idx1, idx2);
        auto data = readData(this);
        writeln(format("    store double %%%d, double* %%%d", data, gep));
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
        writeln(format("    call void @read_number(double* %%%s)", symtab.getId(ident)));
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
        left.codegen();
        auto idx = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx, (cast(Expr)left).result));
        auto gep = gepDim(this, ident, idx);
        writeln(format("    call void @read_number(double* %%%d)", gep));
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
        left.left.codegen();
        auto idx1 = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx1, (cast(Expr)(left.left)).result));
        left.right.codegen();
        auto idx2 = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx2, (cast(Expr)(left.right)).result));
        auto gep = gepDim2(this, ident, idx1, idx2);
        writeln(format("    call void @read_number(double* %%%d)", gep));
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
        left.left.codegen();
        left.right.codegen();
        auto cmp = reg;
        auto lhs = (cast(Expr)(left.left)).result, rhs = (cast(Expr)(left.right)).result;
        auto label1 = label;
        switch (relop) {
            case TokenKind.EQ:
                writeln(format("    %%%d = fcmp oeq double %%%d, %%%d", cmp, lhs, rhs));
                break;
            case TokenKind.NE:
                writeln(format("    %%%d = fcmp one double %%%d, %%%d", cmp, lhs, rhs));
                break;
            case TokenKind.LT:
                writeln(format("    %%%d = fcmp olt double %%%d, %%%d", cmp, lhs, rhs));
               break;
            case TokenKind.LE:
                writeln(format("    %%%d = fcmp ole double %%%d, %%%d", cmp, lhs, rhs));
                break;
            case TokenKind.GE:
                writeln(format("    %%%d = fcmp oge double %%%d, %%%d", cmp, lhs, rhs));
                break;
            case TokenKind.GT:
                writeln(format("    %%%d = fcmp ogt double %%%d, %%%d", cmp, lhs, rhs));
                break;
            default:
                throw new Exception("BAD RELOP");
        }
        writeln(format("    br i1 %%%d, label %%.%u, label %%%s", cmp, line, label1));
        writeln("  ", label1, ":");
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
        left.left.left.codegen();
        left.left.right.codegen();
        left.right.codegen();
        auto begin = (cast(Expr)(left.left.left)).result, 
            end = (cast(Expr)(left.left.right)).result, 
            step = (cast(Expr)(left.right)).result;
        writeln(format("    store double %%%d, double* %%%s", begin, symtab.getId(ident)));
        if (symtab.edition >= Edition.Fourth) { // check for empty for
            auto cmp_pos = reg;
            writeln(format("    %%%d = fcmp ogt double %%%d, %%%d", cmp_pos, begin, end));
            auto cmp_neg = reg;
            writeln(format("    %%%d = fcmp olt double %%%d, %%%d", cmp_neg, begin, end));
            auto cmp_step = reg;
            writeln(format("    %%%d = fcmp ogt double %%%d, 0.0", cmp_step, step));
            auto cmp_sel = reg;
            writeln(format("    %%%d = select i1 %%%d, i1 %%%d, i1 %%%d", cmp_sel, cmp_step, cmp_pos, cmp_neg));
            writeln(format("    br i1 %%%d, label %%for_exit%d, label %%for_loop%d", cmp_sel, id, id));
        }
        else {
            writeln(format("    br label %%for_loop%d", id));
        }
        writeln(format("  for_incr%d:",id));
        auto loop_var2 = reg;
        writeln(format("    %%%d = load double, double* %%%s", loop_var2, symtab.getId(ident)));
        auto loop_incr = reg;
        writeln(format("    %%%d = fadd double %%%d, %%%d", loop_incr, loop_var2, step));
        writeln(format("    store double %%%d, double* %%%s", loop_incr, symtab.getId(ident)));
        auto cmp_pos = reg;
        writeln(format("    %%%d = fcmp ogt double %%%d, %%%d", cmp_pos, loop_incr, end));
        auto cmp_neg = reg;
        writeln(format("    %%%d = fcmp olt double %%%d, %%%d", cmp_neg, loop_incr, end));
        auto cmp_step = reg;
        writeln(format("    %%%d = fcmp ogt double %%%d, 0.0", cmp_step, step));
        auto cmp_sel = reg;
        writeln(format("    %%%d = select i1 %%%d, i1 %%%d, i1 %%%d", cmp_sel, cmp_step, cmp_pos, cmp_neg));
        writeln(format("    br i1 %%%d, label %%for_exit%d, label %%for_loop%d", cmp_sel, id, id));
        writeln(format("  for_loop%d:", id));
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
        writeln(format("    br label %%for_incr%d", for_id));
        writeln(format("  for_exit%d:", for_id));
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
            writeln("    store i32 0, i32* %_DATA_NUM_P");
        }
        if (restore_str) {
            writeln("    store i32 0, i32* %_DATA_STR_P");
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
        auto r = reg;
        writeln(format("    %%%d = load i8*, i8** %%%s_", r, symtab.getId(ident)));
        writeln(format("    call void @free(i8* %%%d)", r));
        left.codegen();
        r = reg;
        writeln(format("    %%%d = call i8* @str_dup(i8* %%%d)", r, (cast(Expr)left).result));
        writeln(format("    store i8* %%%d, i8** %%%s_", r, symtab.getId(ident)));
        super.codegen();
    }
}

class InputString : Node {
    private int ident;
    public immutable uint STRING_MAX = 256;
    this(int id) {
        ident = id;
        symtab.initializeString(ident, true);
    }
    override void codegen() {
        auto r = reg;
        writeln(format("    %%%d = load i8*, i8** %%%s_", r, symtab.getId(ident)));
        writeln(format("    call void @free(i8* %%%d)", r));
        auto str = reg;
        writeln(format("    %%%d = call i8* @malloc(i32 %u)", str, STRING_MAX));
        writeln(format("    call void @read_string(i8* %%%d, i32 %u)", str, STRING_MAX));
        writeln(format("    store i8* %%%d, i8** %%%s_", str, symtab.getId(ident)));
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
        auto r = reg;
        writeln(format("    %%%d = load i8*, i8** %%%s_", r, symtab.getId(ident)));
        writeln(format("    call void @free(i8* %%%d)", r));
        writeln(format("    store i8* %%%d, i8** %%%s_", readStringData(this), symtab.getId(ident)));
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
        left.codegen();
        auto idx = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx, (cast(Expr)left).result));
        auto gep = gepStringDim(this, ident, idx);
        auto str = reg;
        writeln(format("    %%%d = load i8*, i8** %%%d", str, gep));
        writeln(format("    call void @free(i8* %%%d)", str));
        auto data = readStringData(this);
        writeln(format("    store i8* %%%d, i8** %%%d", data, gep));
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
        left.left.codegen();
        auto idx = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx, (cast(Expr)(left.left)).result));
        auto gep = gepStringDim(this, ident, idx);
        auto str = reg;
        writeln(format("    %%%d = load i8*, i8** %%%d", str, gep));
        writeln(format("    call void @free(i8* %%%d)", str));
        left.right.codegen();
        writeln(format("    store i8* %%%d, i8** %%%d", (cast(Expr)(left.right)).result, gep));
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
        auto gep = reg;
        writeln(format("    %%%d = getelementptr i8*, i8** %%%s_, i32 0 ", gep, symtab.getId(str_id)));
        auto data = reg;
        writeln(format("    %%%d = bitcast [ %d x double ]* %%_DATA1_%s to double*",
            data, symtab.DimSize(dim_id) + 1, symtab.getId(dim_id)));
        writeln(format("    call void @change_from_string(i8** %%%d, double* %%%d, i32 %d, i16 %d)",
            gep, data, symtab.DimSize(dim_id), symtab.line));
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
        auto gep = reg;
        writeln(format("    %%%d = getelementptr i8*, i8** %%%s_, i32 0 ", gep, symtab.getId(str_id)));
        auto data = reg;
        writeln(format("    %%%d = bitcast [ %d x double ]* %%_DATA1_%s to double*",
            data, symtab.DimSize(dim_id) + 1, symtab.getId(dim_id)));
        writeln(format("    call void @change_to_string(i8** %%%d, double* %%%d, i32 %d, i16 %d)",
            gep, data, symtab.DimSize(dim_id), symtab.line));
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
        left.codegen();
        auto jmp = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", jmp, (cast(Expr)left).result));
        auto label1 = label;
        writeln(format("    switch i32 %%%d, label %%%s [", jmp, label1));
        foreach(i, l; lines) {
            ushort line = cast(ushort)l;
            if (!symtab.referencedLine(line)) {
                throw new Exception("BAD LINE");
            }
            writeln(format("      i32 %d, label %%.%u", i + 1, line));
        }
        writeln("    ]");
        writeln("  ", label1, ":");
        writeln(format("    call void @runtime_error(i32 9, i16 %u)", symtab.line));
        writeln("    unreachable");
        status = Control.Unreachable;
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
        left.right.codegen();
        auto cmp1 = reg;
        writeln(format("    %%%d = call i32 @strcmp(i8* %%%d, i8* %%%d)",
            cmp1, (cast(Expr)(left.left)).result, (cast(Expr)(left.right)).result));
        auto cmp2 = reg;
        switch (relop) {
            case TokenKind.EQ:
                writeln(format("    %%%d = icmp eq i32 %%%d, 0", cmp2, cmp1));
                break;
            case TokenKind.NE:
                writeln(format("    %%%d = icmp ne i32 %%%d, 0", cmp2, cmp1));
                break;
            case TokenKind.LT:
                writeln(format("    %%%d = icmp slt i32 %%%d, 0", cmp2, cmp1));
                break;
            case TokenKind.LE:
                writeln(format("    %%%d = icmp sle i32 %%%d, 0", cmp2, cmp1));
                break;
            case TokenKind.GE:
                writeln(format("    %%%d = icmp sge i32 %%%d, 0", cmp2, cmp1));
                break;
            case TokenKind.GT:
                writeln(format("    %%%d = icmp sgt i32 %%%d, 0", cmp2, cmp1));
                break;
            default:
                throw new Exception("BAD RELOP");
        }
        auto label1 = label;
        writeln(format("    br i1 %%%d, label %%.%u, label %%%s", cmp2, line, label1));
        writeln("  ", label1, ":");
        super.codegen();
    }
}

class Randomize : Node {
    this() {
        // empty
    }
    override void codegen() {
        auto r = reg;
        writeln(format("    %%%d = call i32 @time(i8* null)", r));
        auto dummy = reg;
        writeln(format("    %%%d = call double @random_lcg(i32 %%%d)", dummy, r));
        super.codegen();
    }
}

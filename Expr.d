import std.stdio;
import Node;

public enum Op { Add, Sub, Mul, Div, Exp, Neg };
public immutable int number_fp_regs = 8;

class Expr : Node {
    protected enum Register { Available, InUse, Reserved };
    static private Register[number_fp_regs] regs;
    static void clearRegs() {
        regs[0] = regs[1] = Register.Reserved; // d0, d1, s0, s1, s2, s3
        foreach(ref r; regs) {
            if (r == Register.InUse) {
                r = Register.Available;
            }
        }
    }
    static int allocateReg() {
        for (int r = regs.length - 1; r >= 0; --r) {
            if (regs[r] == Register.Available) {
                regs[r] = Register.InUse;
                return r;
            }
        }
        throw new Exception("expression too complex");
    }
    static void deallocateReg(int r) {
        if (regs[r] == Register.InUse) {
            regs[r] = Register.Available;
            return;
        }
        throw new Exception("bad deallocateReg()");
    }
    static void push_fp_regs() {
        for (int r = regs.length - 1; r >= 0; --r) {
            if (regs[r] == Register.InUse) {
                writeln("\tvpush\t{d", r, "}");
            }
        }
    }
    static void pop_fp_regs() {
        for (int r = 0; r < regs.length; ++r) {
            if (regs[r] == Register.InUse) {
                writeln("\tvpop\t{d", r, "}");
            }
        }
    }
    private int result_reg;
    protected void setResultReg(int r) {
        result_reg = r;
    }
    @property int result() {
        return result_reg;
    }
    override void codegen() {
        throw new Exception("cannot call Expr.codegen()");
    }
}

class Constant : Expr {
    private int constant;
    this(int n) {
        constant = n;
    }
    override void codegen() {
        setResultReg(allocateReg());
        writeln("\tadrl\tr0, ._c", constant);
        writeln("\tvldr.f64\td", result, ", [r0]");
    }
}

class Identifier : Expr {
    private int ident;
    this(int i) {
        ident = i;
    }
    override void codegen() {
        setResultReg(allocateReg());
        writeln("\tadrl\tr0, .", symtab.getID(ident));
        writeln("\tvldr.f64\td", result, ", [r0]");
    }
}

class Array : Expr {
    private int ident;
    this(int i, Expr idx) {
        ident = i;
        left = idx;
    }
    override void codegen() {
        left.codegen();
        setResultReg((cast(Expr)left).result);
        writeln("\tvcvt.s32.f64\ts0, d", result);
        writeln("\tvmov\tr0, s0");
        writeln("\tadrl\tr1, ._size", symtab.getID(ident));
        writeln("\tldr\tr1, [r1]");
        writeln("\tcmp\tr0, r1");
        writeln("\tmovgt\tr0, #4"); // error: index out of bounds
        writeln("\tmovgt\tr1, #", symtab.line & 0xff00);
        writeln("\torrgt\tr1, r1, #", symtab.line & 0xff);
        writeln("\tbgt\truntime_error(PLT)");
        writeln("\tadrl\tr1, ._data", symtab.getID(ident));
        writeln("\tadd\tr0, r1, r0, LSL #3"); // r0 is index
        writeln("\tvldr.f64\td", result, ", [r0]");
    }
}

class Operation : Expr {
    private Op op;
    this(Expr op1, Op o, Expr op2 = null) {
        left = op1;
        right = op2;
        op = o;
    }
    override void codegen() {
        assert(left !is null);
        left.codegen();
        setResultReg((cast(Expr)left).result); // no need for allocateReg()
        if (right) {
            right.codegen();
            deallocateReg((cast(Expr)right).result);
        }
        switch (op) {
            case Op.Add:
                writeln("\tvadd.f64\td", result, ", d", (cast(Expr)left).result, ", d", (cast(Expr)right).result);
                break;
            case Op.Sub:
                writeln("\tvsub.f64\td", result, ", d", (cast(Expr)left).result, ", d", (cast(Expr)right).result);
                break;
            case Op.Mul:
                writeln("\tvmul.f64\td", result, ", d", (cast(Expr)left).result, ", d", (cast(Expr)right).result);
                break;
            case Op.Div:
                writeln("\tvdiv.f64\td", result, ", d", (cast(Expr)left).result, ", d", (cast(Expr)right).result);
                break;
            case Op.Exp:
                writeln("\tvmov.f64\td0, d", (cast(Expr)left).result);
                writeln("\tvmov.f64\td1, d", (cast(Expr)right).result);
                push_fp_regs();
                writeln("\tbl\tpow(PLT)");
                pop_fp_regs();
                writeln("\tvmov.f64\td", result, ", d0");
                break;
            case Op.Neg:
                writeln("\tvneg.f64\td", result, ", d", (cast(Expr)left).result);
                break;
            default:
                throw new Exception("bad Op");
        }
    }
}

class MathFn : Expr {
    string fn_ident;
    this(string fn_id, Expr e) {
        fn_ident = fn_id;
        left = e;
    }
    override void codegen() {
        if (fn_ident != "RND") {
            left.codegen();
            setResultReg((cast(Expr)left).result); // no need for allocateReg()
            writeln("\tvmov.f64\td0, d", result);
        }
        else {
            setResultReg(allocateReg());
        }
        push_fp_regs(); // is this necessary?
        switch (fn_ident) {
            case "SQR":
                writeln("\tbl\tsqrt(PLT)");
                break;
            case "SIN":
                writeln("\tbl\tsin(PLT)");
                break;
            case "COS":
                writeln("\tbl\tcos(PLT)");
                break;
            case "TAN":
                writeln("\tbl\ttan(PLT)");
                break;
            case "ASN":
                writeln("\tbl\tasin(PLT)");
                break;
            case "ACS":
                writeln("\tbl\tacos(PLT)");
                break;
            case "ATN":
                writeln("\tbl\tatan(PLT)");
                break;
            case "INT":
                writeln("\tbl\tfloor(PLT)");
                break;
            case "LOG":
                writeln("\tbl\tlog(PLT)");
                break;
            case "EXP":
                writeln("\tbl\texp(PLT)");
                break;
            case "RND":
                writeln("\tbl\trandom_lcg(PLT)");
                break;
            default:
                throw new Exception("bad MathFn");
        }
        pop_fp_regs();
        writeln("\tvmov.f64\td", result, ", d0");
    }
}

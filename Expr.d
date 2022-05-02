import std.stdio : writeln, write;
import Node : Node;
import SymbolTable : SymbolTable, Edition;

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
        throw new Exception("ILLEGAL FORMULA");
    }
    static void deallocateReg(int r) {
        if (regs[r] == Register.InUse) {
            regs[r] = Register.Available;
            return;
        }
        throw new Exception("BAD CALL TO Expr.deallocateReg()");
    }
    static void push_fp_regs() {
        auto sep = " ";
        write("\tvpush\t{");
        for (int r = 0; r < regs.length; ++r) {
            if (regs[r] == Register.InUse) {
                write(sep, "d", r);
                sep = ", ";
            }
        }
        writeln(" }");
    }
    static void pop_fp_regs() {
        auto sep = " ";
        write("\tvpop\t{");
        for (int r = 0; r < regs.length; ++r) {
            if (regs[r] == Register.InUse) {
                write(sep, "d", r);
                sep = ", ";
            }
        }
        writeln(" }");
    }
    private int result_reg;
    protected void setResult(int r) {
        result_reg = r;
    }
    @property int result() {
        return result_reg;
    }
    override void codegen() {
        throw new Exception("CANNOT CALL Expr.codegen()");
    }
}

class Constant : Expr {
    private int constant;
    this(int n) {
        constant = n;
    }
    override void codegen() {
        setResult(allocateReg());
        writeln("\tadrl\tr0, ._c", constant);
        writeln("\tvldr.f64\td", result, ", [r0]");
    }
}

class Identifier : Expr {
    private int ident;
    this(int i) {
        ident = i;
        symtab.initializeId(ident);
    }
    override void codegen() {
        setResult(allocateReg());
        writeln("\tadrl\tr0, .", symtab.getId(ident));
        writeln("\tvldr.f64\td", result, ", [r0]");
    }
}

class Dim : Expr {
    private int ident;
    this(int i, Expr idx) {
        ident = i;
        left = idx;
    }
    override void codegen() {
        left.codegen();
        setResult((cast(Expr)left).result);
        writeln("\tvcvt.s32.f64\ts0, d", result);
        writeln("\tvmov\tr0, s0");
        writeln("\tadrl\tr1, ._size", symtab.getId(ident));
        writeln("\tldr\tr1, [r1]");
        writeln("\tcmp\tr0, r1");
        writeln("\tmovgt\tr0, #4"); // error: index out of bounds
        writeln("\tmovgt\tr1, #", symtab.line & 0xff00);
        writeln("\torrgt\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblgt\truntime_error(PLT)");
        writeln("\tadrl\tr1, ._data", symtab.getId(ident));
        writeln("\tadd\tr0, r1, r0, LSL #3"); // r0 is index
        writeln("\tvldr.f64\td", result, ", [r0]");
    }
}

class Dim2 : Expr {
    private int ident;
    private Expr row, col;
    this(int i, Expr idx1, Expr idx2) {
        ident = i;
        row = idx1;
        col = idx2;
    }
    override void codegen() {
        row.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", row.result);
        writeln("\tvmov\tr0, s0");
        deallocateReg(row.result);
        writeln("\tpush\t{ r0 }");
        col.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", col.result);
        writeln("\tvmov\tr2, s0");
        setResult(col.result);
        writeln("\tpop\t{ r1 }");
        writeln("\tadrl\tr0, ._size2", symtab.getId(ident));
        writeln("\tldr\tr3, [r0, #4]"); // sz2
        writeln("\tadd\tr3, r3, #1");
        writeln("\tmla\tr3, r1, r3, r2"); // idx1 * (sz2 + 1) + idx2
        writeln("\tadrl\tr0, ._data2", symtab.getId(ident));
        writeln("\tadd\tr0, r0, r3, LSL#3");
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
        if (left is null) {
            throw new Exception("NULL EXPRESSION");
        }
        left.codegen();
        setResult((cast(Expr)left).result); // no need for allocateReg()
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
                throw new Exception("BAD Op");
        }
    }
}

class MathFn : Expr {
    private string fn_ident;
    this(string fn_id, Expr e) {
        fn_ident = fn_id;
        left = e;
    }
    override void codegen() {
        if (fn_ident != "RND") {
            left.codegen();
            setResult((cast(Expr)left).result); // no need for allocateReg()
            writeln("\tvmov.f64\td0, d", result);
        }
        else {
            setResult(allocateReg());
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
            case "COT":
                writeln("\tbl\tcot(PLT)"); // user function
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
                if (symtab.edition >= Edition.Third) {
                    writeln("\tbl\tfloor(PLT)");
                }
                else {
                    writeln("\tvcmp.f64\td0, #0");
                    writeln("\tvmrs\tAPSR_nzcv, FPSCR");
                    writeln("\tblgt\tfloor(PLT)");
                    writeln("\tbllt\tceil(PLT)");
                }
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
            case "ABS":
                writeln("\tbl\tfabs(PLT)");
                break;
            case "SGN":
                if (symtab.edition >= Edition.Third) {
                    writeln("\tbl\tsgn(PLT)"); // user function
                }
                else {
                    goto default;
                }
                break;
            default:
                throw new Exception("BAD MathFn");
        }
        pop_fp_regs();
        writeln("\tvmov.f64\td", result, ", d0");
    }
}

class FnCall : Expr {
    private int fn_ident;
    private Expr arg;
    this(int i, Expr e) {
        fn_ident = i;
        arg = e;
    }
    override void codegen() {
        auto func = symtab.getFunction(fn_ident);
        arg.codegen();
        writeln("\tadrl\tr0, .", symtab.getId(func.param_ident));
        writeln("\tvstr.f64\td", arg.result, ", [r0]");
        func.fn_expr.codegen();
        setResult(func.fn_expr.result);
    }
}

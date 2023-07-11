import std.stdio : writeln, write;
import std.format : format;
import Node : Node;
import SymbolTable : SymbolTable, Edition;
import Target : gepDim, gepDim2, gepStringDim;

public enum Op { Add, Sub, Mul, Div, Exp, Neg }
public immutable int number_fp_regs = 8;

class Expr : Node {
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
        setResult(reg);
        writeln(format("    %%%d = load double, double* @_C%d", result, constant));
    }
}

class Identifier : Expr {
    private int ident;
    this(int i) {
        ident = i;
        symtab.initializeId(ident);
    }
    override void codegen() {
        setResult(reg);
        writeln(format("    %%%d = load double, double* %%%s", result, symtab.getId(ident)));
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
        auto idx = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx, (cast(Expr)left).result));
        auto gep = gepDim(this, ident, idx);
        setResult(reg);
        writeln(format("    %%%d = load double, double* %%%d", result, gep));
    }
}

class Dim2 : Expr {
    private int ident;
    this(int i, Expr idx1, Expr idx2) {
        ident = i;
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
        setResult(reg);
        writeln(format("    %%%d = load double, double* %%%d", result, gep));
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
        if (right) {
            right.codegen();
        }
        setResult(reg);
        switch (op) {
            case Op.Add:
                writeln(format("    %%%d = fadd double %%%d, %%%d",
                    result, (cast(Expr)left).result, (cast(Expr)right).result));
                break;
            case Op.Sub:
                writeln(format("    %%%d = fsub double %%%d, %%%d",
                    result, (cast(Expr)left).result, (cast(Expr)right).result));
                break;
            case Op.Mul:
                writeln(format("    %%%d = fmul double %%%d, %%%d",
                    result, (cast(Expr)left).result, (cast(Expr)right).result));
                break;
            case Op.Div:
                writeln(format("    %%%d = fdiv double %%%d, %%%d",
                    result, (cast(Expr)left).result, (cast(Expr)right).result));
                break;
            case Op.Exp:
                if (symtab.edition < Edition.Third) { // recreate bug in early editions
                    auto pos = result;
                    writeln(format("    %%%d = call double @fabs(double %%%d)",
                        pos, (cast(Expr)left).result));
                    setResult(reg);
                    writeln(format("    %%%d = call double @pow(double %%%d, double %%%d)",
                        result, pos, (cast(Expr)right).result));
                }
                else {
                    writeln(format("    %%%d = call double @pow(double %%%d, double %%%d)",
                        result, (cast(Expr)left).result, (cast(Expr)right).result));
                }
                break;
            case Op.Neg:
                writeln(format("    %%%d = fneg double %%%d", result, (cast(Expr)left).result));
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
        if (symtab.edition < Edition.Third && fn_ident == "SGN") {
            symtab.error("INVALID FUNCTION FOR THIS EDITION");
        }
    }
    override void codegen() {
        if (fn_ident != "RND") {
            left.codegen();
        }
        setResult(reg);
        switch (fn_ident) {
            case "SQR":
                writeln(format("    %%%d = call double @sqrt(double %%%d)",
                    result, (cast(Expr)left).result));
                break;
            case "SIN":
                writeln(format("    %%%d = call double @sin(double %%%d)",
                    result, (cast(Expr)left).result));
                break;
            case "COS":
                writeln(format("    %%%d = call double @cos(double %%%d)",
                    result, (cast(Expr)left).result));
                break;
            case "TAN":
                writeln(format("    %%%d = call double @tan(double %%%d)",
                    result, (cast(Expr)left).result));
                break;
            case "COT": // user function
                writeln(format("    %%%d = call double @cot(double %%%d)",
                    result, (cast(Expr)left).result));
                break;
            case "ASN":
                writeln(format("    %%%d = call double @asin(double %%%d)",
                    result, (cast(Expr)left).result));
                break;
            case "ACS":
                writeln(format("    %%%d = call double @acos(double %%%d)",
                    result, (cast(Expr)left).result));
                break;
            case "ATN":
                writeln(format("    %%%d = call double @atan(double %%%d)",
                    result, (cast(Expr)left).result));
                break;
            case "INT":
                if (symtab.edition >= Edition.Third) {
                    writeln(format("    %%%d = call double @floor(double %%%d)",
                        result, (cast(Expr)left).result));
                }
                else {
                    int compare_result = result;
                    writeln(format("    %%%d = fcmp oge double %%%d, 0.0",
                        compare_result, (cast(Expr)left).result));
                    auto floor_result = reg;
                    writeln(format("    %%%d = call double @floor(double %%%d)",
                        floor_result, (cast(Expr)left).result));
                    auto ceil_result = reg;
                    writeln(format("    %%%d = call double @ceil(double %%%d)",
                        ceil_result, (cast(Expr)left).result));
                    setResult(reg);
                    writeln(format("    %%%d = select i1 %%%d, double %%%d, double %%%d",
                        result, compare_result, floor_result, ceil_result));
                }
                break;
            case "LOG":
                writeln(format("    %%%d = call double @log(double %%%d)",
                    result, (cast(Expr)left).result));
                break;
            case "EXP":
                writeln(format("    %%%d = call double @exp(double %%%d)",
                    result, (cast(Expr)left).result));
                break;
            case "RND":
                writeln(format("    %%%d = call double @random_lcg(i32 0)", result));
                break;
            case "ABS":
                writeln(format("    %%%d = call double @fabs(double %%%d)",
                    result, (cast(Expr)left).result));
                break;
            case "SGN": // user function
                writeln(format("    %%%d = call double @sgn(double %%%d)",
                    result, (cast(Expr)left).result));
                break;
            default:
                throw new Exception("BAD MathFn");
        }
    }
}

class FnCall : Expr {
    private int fn_id, ret;
    private Expr[] args;
    this(int n, Expr[] e) {
        fn_id = n;
        args = e;
        symtab.addFunction(n, symtab.Function(new int[0], null, -1, e.length));
        symtab.installId("FN" ~ symtab.getId(fn_id));
        ret = symtab.gosub; // note: only used my multi-line functions
    }
    override void codegen() {
        auto func = symtab.getFunction(fn_id);
        foreach(i, arg; args) {
            arg.codegen();
            writeln(format("    store double %%%d, double* %%%s",
                (cast(Expr)arg).result, symtab.getId(func.param_idents[i])));
        }
        if (func.fn_expr !is null) {
            func.fn_expr.codegen();
            setResult(func.fn_expr.result);
            symtab.simpleFunction(ret);
        }
        else {
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
            writeln("    br label %.", func.fn_line);
            writeln("  return", ret, ":");
            setResult(reg);
            writeln(format("    %%%d = load double, double* %%FN%s",
                result, symtab.getId(fn_id)));
        }
    }
}

class StringExpr : Expr {
    this() {
        // empty
    }
    override void codegen() {
        auto cmp = reg;
        writeln(format("    %%%d = icmp ne i8* %%%d, null", cmp, result));
        auto fct = reg;
        writeln(format("    %%%d = select i1 %%%d, void (i32, i16)* @dummy_fct, void (i32, i16)* @runtime_error", fct, cmp));
        writeln(format("    call void %%%d(i32 8, i16 %d)", fct, symtab.line)); // error: uninitialized string
    }
}

class StringVariable : StringExpr {
    private int ident;
    this(int id) {
        ident = id;
        symtab.initializeString(ident);
    }
    override void codegen() {
        setResult(reg);
        writeln(format("    %%%d = load i8*, i8** %%%s_", result, symtab.getId(ident)));
        super.codegen();
    }
}

class StringConstant : StringExpr {
    private int ident;
    this(int id) {
        ident = id;
    }
    override void codegen() {
        setResult(reg);
        writeln(format("    %%%d = bitcast [ %d x i8 ]* @_S%d to i8*", result, symtab.getStrLen(ident) + 1, ident));
        super.codegen();
    }
}

class StringIndexed : StringExpr {
    private int ident;
    this(int id, Expr idx) {
        ident = id;
        left = idx;
    }
    override void codegen() {
        left.codegen();
        auto idx = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx, (cast(Expr)left).result));
        auto gep = gepStringDim(this, ident, idx);
        setResult(reg);
        writeln(format("    %%%d = load i8*, i8** %%%d", result, gep));
        super.codegen();
    }
}

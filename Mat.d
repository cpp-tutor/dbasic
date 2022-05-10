import std.stdio : writeln;
import Node : Node;
import Expr : Expr;
import SymbolTable : Edition;

private void adrMat(int reg, string param, string id) {
    if (reg >= 3) {
        throw new Exception("BAD REGISTER FOR Mat.adrMat()");
    }
    writeln("\tadrl\tr", reg, ", ._mat_", param);
    writeln("\tadrl\tr3, ._size2", id);
    writeln("\tstr\tr3, [r", reg, ", #0]");
    writeln("\tadrl\tr3, ._mat", id);
    writeln("\tstr\tr3, [r", reg, ", #4]");
    writeln("\tadrl\tr3, ._data2", id);
    writeln("\tstr\tr3, [r", reg, ", #8]");
}

class MatRead : Node {
    private int ident;
    private Expr cols, rows;
    this(int id, Expr idx1, Expr idx2) {
        ident = id;
        rows = idx1;
        cols = idx2;
    }
    override void codegen() {
        Expr.clearRegs();
        cols.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", cols.result);
        writeln("\tvmov\tr1, s0");
        writeln("\tpush\t{ r1 }");
        Expr.clearRegs();
        rows.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", rows.result);
        writeln("\tvmov\tr2, s0");
        writeln("\tpop\t{ r1 }");
        writeln("\tadrl\tr0, ._mat", symtab.getId(ident));
        writeln("\tstr\tr2, [r0, #0]");
        writeln("\tstr\tr1, [r0, #4]");
        adrMat(0, "par1", symtab.getId(ident));
        writeln("\tadrl\tr1, ._data_ptr");
        writeln("\tmov\tr2, #", symtab.line & 0xff00);
        writeln("\torr\tr2, r2, #", symtab.line & 0xff);
        writeln("\tbl\tmat_read(PLT)");
        super.codegen();
    }
}

class MatPrint : Node {
    this(Node mpt) {
        left = mpt;
    }
    override void codegen() {
        if (left) {
            left.codegen();
        }
        super.codegen();
    }
}

class MatFullPrint : Node {
    private int ident;
    private bool packed;
    this(int id, bool p = false) {
        ident = id;
        packed = p;
    }
    override void codegen() {
        adrMat(0, "par1", symtab.getId(ident));
        writeln("\tmov\tr1, #", packed ? "1" : "0");
        writeln("\tbl\tmat_print(PLT)");
        super.codegen();
    }
}

class MatAdd : Node {
    private int dest, src1, src2;
    this(int d, int s1, int s2) {
        if (d == s1 || d == s2) {
            symtab.error("BAD RESULT MATRIX");
        }
        dest = d;
        src1 = s1;
        src2 = s2;
    }
    override void codegen() {
        adrMat(0, "res", symtab.getId(dest));
        adrMat(1, "par1", symtab.getId(src1));
        adrMat(2, "par2", symtab.getId(src2));
        writeln("\tmov\tr3, #", symtab.line & 0xff00);
        writeln("\torr\tr3, r3, #", symtab.line & 0xff);
        writeln("\tbl\tmat_add(PLT)");
        super.codegen();
    }
}

class MatSub : Node {
    private int dest, src1, src2;
    this(int d, int s1, int s2) {
        if (d == s1 || d == s2) {
            symtab.error("BAD RESULT MATRIX");
        }
        dest = d;
        src1 = s1;
        src2 = s2;
    }
    override void codegen() {
        adrMat(0, "res", symtab.getId(dest));
        adrMat(1, "par1", symtab.getId(src1));
        adrMat(2, "par2", symtab.getId(src2));
        writeln("\tmov\tr3, #", symtab.line & 0xff00);
        writeln("\torr\tr3, r3, #", symtab.line & 0xff);
        writeln("\tbl\tmat_sub(PLT)");
        super.codegen();
    }
}

class MatMul : Node {
    private int dest, src1, src2;
    this(int d, int s1, int s2) {
        if (d == s1 || d == s2) {
            symtab.error("BAD RESULT MATRIX");
        }
        dest = d;
        src1 = s1;
        src2 = s2;
    }
    override void codegen() {
        adrMat(0, "res", symtab.getId(dest));
        adrMat(1, "par1", symtab.getId(src1));
        adrMat(2, "par2", symtab.getId(src2));
        writeln("\tmov\tr3, #", symtab.line & 0xff00);
        writeln("\torr\tr3, r3, #", symtab.line & 0xff);
        writeln("\tbl\tmat_mul(PLT)");
        super.codegen();
    }
}

class MatZerCon : Node {
    private int ident;
    private Expr cols, rows;
    private bool con;
    this(int id, Expr idx1, Expr idx2, bool c = false) {
        ident = id;
        rows = idx1;
        cols = idx2;
        con = c;
    }
    override void codegen() {
        Expr.clearRegs();
        cols.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", cols.result);
        writeln("\tvmov\tr1, s0");
        writeln("\tpush\t{ r1 }");
        Expr.clearRegs();
        rows.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", rows.result);
        writeln("\tvmov\tr2, s0");
        writeln("\tpop\t{ r1 }");
        writeln("\tadrl\tr0, ._mat", symtab.getId(ident));
        writeln("\tstr\tr2, [r0, #0]");
        writeln("\tstr\tr1, [r0, #4]");
        adrMat(0, "par1", symtab.getId(ident));
        writeln("\tmov\tr1, #", con ? "1" : "0");
        writeln("\tmov\tr2, #", symtab.line & 0xff00);
        writeln("\torr\tr2, r2, #", symtab.line & 0xff);
        writeln("\tbl\tmat_zer_con(PLT)");
        super.codegen();
    }
}

class MatIdn : Node {
    private int ident;
    private Expr size;
    this(int id, Expr sz) {
        ident = id;
        size = sz;
    }
    override void codegen() {
        Expr.clearRegs();
        size.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", size.result);
        writeln("\tvmov\tr1, s0");
        writeln("\tadrl\tr0, ._mat", symtab.getId(ident));
        writeln("\tstr\tr1, [r0, #0]");
        writeln("\tstr\tr1, [r0, #4]");
        adrMat(0, "par1", symtab.getId(ident));
        writeln("\tmov\tr1, #", symtab.line & 0xff00);
        writeln("\torr\tr1, r1, #", symtab.line & 0xff);
        writeln("\tbl\tmat_idn(PLT)");
        super.codegen();
    }
}

class MatTrn : Node {
    private int dest, src;
    this(int d, int s) {
        if (d == s) {
            symtab.error("BAD RESULT MATRIX");
        }
        dest = d;
        src = s;
    }
    override void codegen() {
        adrMat(0, "res", symtab.getId(dest));
        adrMat(1, "par1", symtab.getId(src));
        writeln("\tmov\tr2, #", symtab.line & 0xff00);
        writeln("\torr\tr2, r2, #", symtab.line & 0xff);
        writeln("\tbl\tmat_trn(PLT)");
        super.codegen();
    }
}

class MatInv : Node {
    private int dest, src;
    this(int d, int s) {
        if (d == s) {
            symtab.error("BAD RESULT MATRIX");
        }
        dest = d;
        src = s;
    }
    override void codegen() {
        adrMat(0, "res", symtab.getId(dest));
        adrMat(1, "par1", symtab.getId(src));
        if (symtab.edition >= Edition.Fourth) {
            writeln("\tadrl\tr2, .DET");
        }
        else {
            writeln("\tmov\tr2, #0");
        }
        writeln("\tmov\tr3, #", symtab.line & 0xff00);
        writeln("\torr\tr3, r3, #", symtab.line & 0xff);
        writeln("\tbl\tmat_inv(PLT)");
        super.codegen();
    }
}

class MatScalar : Node {
    private int dest, src;
    this(int d, int s, Expr e) {
        if (d == s) {
            symtab.error("BAD RESULT MATRIX");
        }
        dest = d;
        src = s;
        left = e;
    }
    override void codegen() {
        Expr.clearRegs();
        left.codegen();
        writeln("\tvmov.f64\td0, d", (cast(Expr)left).result);
        adrMat(0, "res", symtab.getId(dest));
        adrMat(1, "par1", symtab.getId(src));
        writeln("\tmov\tr2, #", symtab.line & 0xff00);
        writeln("\torr\tr2, r2, #", symtab.line & 0xff);
        writeln("\tbl\tmat_scalar(PLT)");
        super.codegen();
    }
}

class MatZerConIdnDim : Node {
    private int ident, type;
    this(int id, int ty) {
        ident = id;
        type = ty;
    }
    override void codegen() {
        adrMat(0, "res", symtab.getId(ident));
        writeln("\tmov\tr1, #", type);
        writeln("\tmov\tr2, #", symtab.line & 0xff00);
        writeln("\torr\tr2, r2, #", symtab.line & 0xff);
        writeln("\tbl\tmat_zer_con_idn_dim(PLT)");
        super.codegen();
    }
}

class MatInput : Node {
    private int ident;
    this(int id) {
        ident = id;
    }
    override void codegen() {
        writeln("\tadrl\tr0, ._data", symtab.getId(ident));
        writeln("\tadrl\tr1, ._size", symtab.getId(ident));
        writeln("\tadrl\tr2, .NUM");
        writeln("\tmov\tr3, #", symtab.line & 0xff00);
        writeln("\torr\tr3, r3, #", symtab.line & 0xff);
        writeln("\tbl\tmat_input(PLT)");
        super.codegen();
    }
}

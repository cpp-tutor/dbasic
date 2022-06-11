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
    private Expr elems;
    this(int id, Expr idx) {
        ident = id;
        elems = idx;
        symtab.initializeDim(ident); // note: not Dim2
        symtab.useData(true);
    }
    override void codegen() {
        Expr.clearRegs();
        elems.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", elems.result);
        writeln("\tvmov\tr1, s0");
        writeln("\tadrl\tr0, ._size", symtab.getId(ident));
        writeln("\tldr\tr2, [r0]");
        writeln("\tcmp\tr1, r2");
        writeln("\tmovgt\tr0, #", 6); // error: DIM too small
        writeln("\tmovgt\tr1, #", symtab.line & 0xff00);
        writeln("\torrgt\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblgt\truntime_error(PLT)");
        writeln("\tadrl\tr0, ._data", symtab.getId(ident));
        writeln("\tadrl\tr2, ._data_ptr");
        writeln("\tmov\tr3, #", symtab.line & 0xff00);
        writeln("\torr\tr3, r3, #", symtab.line & 0xff);
        writeln("\tbl\tmat_read(PLT)");
        super.codegen();
    }
}

class MatRead2 : Node {
    private int ident;
    private Expr cols, rows;
    this(int id, Expr idx1, Expr idx2) {
        ident = id;
        rows = idx1;
        cols = idx2;
        symtab.initializeDim2(ident);
        symtab.initializeMat(ident, true);
        symtab.useData(true);
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
        adrMat(0, "param1", symtab.getId(ident));
        writeln("\tadrl\tr1, ._data_ptr");
        writeln("\tmov\tr2, #", symtab.line & 0xff00);
        writeln("\torr\tr2, r2, #", symtab.line & 0xff);
        writeln("\tbl\tmat_read2(PLT)");
        super.codegen();
    }
}

class MatPrint : Node {
    private int ident, type;
    private bool packed;
    this(int id, bool p = false) {
        ident = id;
        packed = p;
        //symtab.initializeMat(ident);
        type = symtab.getMatType(ident);
        if (type == 0) {
            symtab.error("NOT A MATRIX");
        }
    }
    override void codegen() {
        if (type == 1) {
            writeln("\tadrl\tr0, ._data", symtab.getId(ident));
            writeln("\tadrl\tr1, ._size", symtab.getId(ident));
            writeln("\tldr\tr1, [r1]");
            writeln("\tmov\tr2, #", packed ? "1" : "0");
            writeln("\tmov\tr3, #", symtab.line & 0xff00);
            writeln("\torr\tr3, r3, #", symtab.line & 0xff);
            writeln("\tbl\tmat_print(PLT)");
        }
        if (type == 2) {
            adrMat(0, "param1", symtab.getId(ident));
            writeln("\tmov\tr1, #", packed ? "1" : "0");
            writeln("\tbl\tmat_print2(PLT)");
        }
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
        symtab.initializeMat(dest, true);
        symtab.initializeMat(src1);
        symtab.initializeMat(src2);
    }
    override void codegen() {
        adrMat(0, "result", symtab.getId(dest));
        adrMat(1, "param1", symtab.getId(src1));
        adrMat(2, "param2", symtab.getId(src2));
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
        symtab.initializeMat(dest, true);
        symtab.initializeMat(src1);
        symtab.initializeMat(src2);
    }
    override void codegen() {
        adrMat(0, "result", symtab.getId(dest));
        adrMat(1, "param1", symtab.getId(src1));
        adrMat(2, "param2", symtab.getId(src2));
        writeln("\tmov\tr3, #", symtab.line & 0xff00);
        writeln("\torr\tr3, r3, #", symtab.line & 0xff);
        writeln("\tbl\tmat_sub(PLT)");
        super.codegen();
    }
}

class MatMul : Node {
    private int dest, src1, src2;
    this(int d, int s1, int s2) {
        if (d == s1 || d == s2 || s1 == s2) {
            symtab.error("BAD RESULT MATRIX");
        }
        dest = d;
        src1 = s1;
        src2 = s2;
        symtab.initializeMat(dest, true);
        symtab.initializeMat(src1);
        symtab.initializeMat(src2);
    }
    override void codegen() {
        adrMat(0, "result", symtab.getId(dest));
        adrMat(1, "param1", symtab.getId(src1));
        adrMat(2, "param2", symtab.getId(src2));
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
        symtab.initializeMat(ident, true);
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
        adrMat(0, "param1", symtab.getId(ident));
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
        symtab.initializeMat(ident, true);
    }
    override void codegen() {
        Expr.clearRegs();
        size.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", size.result);
        writeln("\tvmov\tr1, s0");
        writeln("\tadrl\tr0, ._mat", symtab.getId(ident));
        writeln("\tstr\tr1, [r0, #0]");
        writeln("\tstr\tr1, [r0, #4]");
        adrMat(0, "param1", symtab.getId(ident));
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
        symtab.initializeMat(dest, true);
        symtab.initializeMat(src);
    }
    override void codegen() {
        adrMat(0, "result", symtab.getId(dest));
        adrMat(1, "param1", symtab.getId(src));
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
        symtab.initializeMat(dest, true);
        symtab.initializeMat(src);
        if (symtab.edition >= Edition.Fourth) {
            symtab.initializeId(symtab.installId("DET"));
        }
    }
    override void codegen() {
        adrMat(0, "result", symtab.getId(dest));
        adrMat(1, "param1", symtab.getId(src));
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
        symtab.initializeMat(dest, true);
        symtab.initializeMat(src);
    }
    override void codegen() {
        Expr.clearRegs();
        left.codegen();
        writeln("\tvmov.f64\td0, d", (cast(Expr)left).result);
        adrMat(0, "result", symtab.getId(dest));
        adrMat(1, "param1", symtab.getId(src));
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
        symtab.initializeMat(ident, true);
    }
    override void codegen() {
        adrMat(0, "result", symtab.getId(ident));
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
        symtab.initializeDim(ident);
        symtab.initializeId(symtab.installId("NUM"));
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

class MatReadString : Node {
    private int ident;
    private Expr elems;
    this(int id, Expr idx) {
        ident = id;
        elems = idx;
        symtab.initializeDimString(ident); // note: not Dim2
        symtab.useData(false, true);
    }
    override void codegen() {
        Expr.clearRegs();
        elems.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", elems.result);
        writeln("\tvmov\tr1, s0");
        writeln("\tadrl\tr0, ._sizeS", symtab.getId(ident));
        writeln("\tldr\tr2, [r0]");
        writeln("\tcmp\tr1, r2");
        writeln("\tmovgt\tr0, #", 6); // error: DIM too small
        writeln("\tmovgt\tr1, #", symtab.line & 0xff00);
        writeln("\torrgt\tr1, r1, #", symtab.line & 0xff);
        writeln("\tblgt\truntime_error(PLT)");
        writeln("\tadrl\tr0, ._dataS", symtab.getId(ident));
        writeln("\tadrl\tr2, ._data_ptr");
        writeln("\tmov\tr3, #", symtab.line & 0xff00);
        writeln("\torr\tr3, r3, #", symtab.line & 0xff);
        writeln("\tbl\tmat_read_str(PLT)");
        super.codegen();
    }
}

class MatPrintString : Node {
    private int ident;
    private bool packed;
    this(int id, bool p = false) {
        ident = id;
        packed = p;
        symtab.initializeDimString(ident);
    }
    override void codegen() {
        writeln("\tadrl\tr0, ._dataS", symtab.getId(ident));
        writeln("\tmov\tr1, #", packed ? 1 : 0);
        writeln("\tbl\tmat_print_str(PLT)");
        super.codegen();
    }
}

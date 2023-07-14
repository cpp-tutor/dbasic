import std.stdio : writeln;
import std.format : format;
import Node : Node;
import Expr : Expr;
import SymbolTable : Edition;
import Target : matrix;

void adrMat(int a, string b, string c) {}

class MatRead : Node {
    private int ident;
    this(int id, Expr idx) {
        ident = id;
        left = idx;
        symtab.initializeDim(ident); // note: not Dim2
        symtab.useData(true);
    }
    override void codegen() {
        left.codegen();
        auto sz = symtab.DimSize(ident) + 1;
        auto idx = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx, (cast(Expr)(left)).result));
        auto cmp = reg;
        writeln(format("    %%%d = icmp ult i32 %%%d, %d", cmp, idx, sz));
        auto fct = reg;
        writeln(format("    %%%d = select i1 %%%d, void (i32, i16)* @dummy_fct, void (i32, i16)* @runtime_error", fct, cmp));
        writeln(format("    call void %%%d(i32 4, i16 %d)", fct, symtab.line)); // error: index out of bounds
        auto dim = reg;
        writeln(format("    %%%d = bitcast [ %d x double ]* %%_DATA1_%s to double*", dim, sz, symtab.getId(ident)));
        auto gep = reg;
        writeln(format("    %%%d = getelementptr i32, i32* %%_DATA_NUM_P, i32 0", gep));
        auto data = reg;
        writeln(format("    %%%d = bitcast [ %d x double ]* @_DATA to double*", data, symtab.dataN));
        writeln(format("    call void @mat_read(double* %%%d, i32 %%%d, double* %%%d, i32 %d, i32* %%%d, i16 %u)",
            dim, idx, data, symtab.dataN, gep, symtab.line));
        super.codegen();
    }
}

class MatRead2 : Node {
    private int ident;
    private Expr cols, rows;
    this(int id, Expr idx1, Expr idx2) {
        ident = id;
        left = new Node(idx1, idx2);
        symtab.initializeDim2(ident);
        symtab.initializeMat(ident, true);
        symtab.useData(true);
    }
    override void codegen() {
        left.left.codegen();
        auto idx1 = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx1, (cast(Expr)(left.left)).result));
        auto gep1 = reg;
        writeln(format("    %%%d = getelementptr %%struct.Dims, %%struct.Dims* %%_MAT_%s, i32 0, i32 0", gep1, symtab.getId(ident)));
        writeln(format("    store i32 %%%d, i32* %%%d", idx1, gep1));
        left.right.codegen();
        auto idx2 = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx2, (cast(Expr)(left.right)).result));
        auto gep2 = reg;
        writeln(format("    %%%d = getelementptr %%struct.Dims, %%struct.Dims* %%_MAT_%s, i32 0, i32 1", gep2, symtab.getId(ident)));
        writeln(format("    store i32 %%%d, i32* %%%d", idx2, gep2));
        auto gep3 = reg;
        writeln(format("    %%%d = getelementptr i32, i32* %%_DATA_NUM_P, i32 0", gep3));
        auto data = reg;
        writeln(format("    %%%d = bitcast [ %d x double ]* @_DATA to double*", data, symtab.dataN));
        writeln(format("    call void @mat_read2(%%struct.Mat* %%%d, double* %%%d, i32 %d, i32* %%%d, i16 %d)",
            matrix(this, ident), data, symtab.dataN, gep3, symtab.line));
        super.codegen();
    }
}

class MatPrint : Node {
    private int ident, type;
    private bool packed;
    this(int id, bool p = false) {
        ident = id;
        packed = p;
        type = symtab.getMatType(ident);
        if (type == 0) {
            symtab.error("NOT A MATRIX");
        }
    }
    override void codegen() {
        if (type == 1) {
            auto ptr = reg;
            writeln(format("    %%%d = bitcast [ %d x double ]* %%_DATA1_%s to double*",
                ptr, symtab.DimSize(ident) + 1, symtab.getId(ident)));
            writeln(format("    call void @mat_print(double* %%%d, i32 %d, i1 %s, i16 %d)",
                ptr, symtab.DimSize(ident), packed ? "true" : "false", symtab.line));
        }
        if (type == 2) {
            writeln(format("    call void @mat_print2(%%struct.Mat* %%%d, i1 %s)",
                matrix(this, ident), packed ? "true" : "false"));
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
        writeln(format("    call void @mat_add(%%struct.Mat* %%%d, %%struct.Mat* %%%d, %%struct.Mat* %%%d, i16 %d)",
            matrix(this, dest), matrix(this, src1), matrix(this, src2), symtab.line));        
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
        writeln(format("    call void @mat_sub(%%struct.Mat* %%%d, %%struct.Mat* %%%d, %%struct.Mat* %%%d, i16 %d)",
            matrix(this, dest), matrix(this, src1), matrix(this, src2), symtab.line));        
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
        writeln(format("    call void @mat_mul(%%struct.Mat* %%%d, %%struct.Mat* %%%d, %%struct.Mat* %%%d, i16 %d)",
            matrix(this, dest), matrix(this, src1), matrix(this, src2), symtab.line));        
        super.codegen();
    }
}

class MatZerCon : Node {
    private int ident;
    private bool con;
    this(int id, Expr idx1, Expr idx2, bool c = false) {
        ident = id;
        left = new Node(idx1, idx2);
        con = c;
        symtab.initializeMat(ident, true);
    }
    override void codegen() {
        left.left.codegen();
        auto idx1 = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx1, (cast(Expr)(left.left)).result));
        auto gep1 = reg;
        writeln(format("    %%%d = getelementptr %%struct.Dims, %%struct.Dims* %%_MAT_%s, i32 0, i32 0", gep1, symtab.getId(ident)));
        writeln(format("    store i32 %%%d, i32* %%%d", idx1, gep1));
        left.right.codegen();
        auto idx2 = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx2, (cast(Expr)(left.right)).result));
        auto gep2 = reg;
        writeln(format("    %%%d = getelementptr %%struct.Dims, %%struct.Dims* %%_MAT_%s, i32 0, i32 1", gep2, symtab.getId(ident)));
        writeln(format("    store i32 %%%d, i32* %%%d", idx2, gep2));
        writeln(format("    call void @mat_zer_con(%%struct.Mat* %%%d, i1 %s, i16 %d)",
            matrix(this, ident), con ? "true" : "false", symtab.line));
        super.codegen();
    }
}

class MatIdn : Node {
    private int ident;
    this(int id, Expr sz) {
        ident = id;
        left = sz;
        symtab.initializeMat(ident, true);
    }
    override void codegen() {
        left.codegen();
        auto idx = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx, (cast(Expr)left).result));
        auto gep1 = reg;
        writeln(format("    %%%d = getelementptr %%struct.Dims, %%struct.Dims* %%_MAT_%s, i32 0, i32 0", gep1, symtab.getId(ident)));
        writeln(format("    store i32 %%%d, i32* %%%d", idx, gep1));
        auto gep2 = reg;
        writeln(format("    %%%d = getelementptr %%struct.Dims, %%struct.Dims* %%_MAT_%s, i32 0, i32 1", gep2, symtab.getId(ident)));
        writeln(format("    store i32 %%%d, i32* %%%d", idx, gep2));
        writeln(format("    call void @mat_idn(%%struct.Mat* %%%d, i16 %d)",
            matrix(this, ident), symtab.line));
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
        writeln(format("    call void @mat_trn(%%struct.Mat* %%%d, %%struct.Mat* %%%d, i16 %d)",
            matrix(this, dest), matrix(this, src), symtab.line));
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
        auto det = reg;
        if (symtab.edition >= Edition.Fourth) {
            writeln(format("    %%%d = bitcast double* %%DET to double*", det));
        }
        else {
            writeln(format("    %%%d = bitcast double* null to double*", det));
        }
        writeln(format("    call void @mat_inv(%%struct.Mat* %%%d, %%struct.Mat* %%%d, double* %%%d, i16 %d)",
            matrix(this, dest), matrix(this, src), det, symtab.line));
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
        left.codegen();
        writeln(format("    call void @mat_scalar(%%struct.Mat* %%%d, %%struct.Mat* %%%d, double %%%d, i16 %d)",
            matrix(this, dest), matrix(this, src), (cast(Expr)left).result, symtab.line));
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
        writeln(format("    call void @mat_zer_con_idn_dim(%%struct.Mat* %%%d, i32 %d, i16 %d)",
            matrix(this, ident), type, symtab.line));
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
        auto r = reg;
        writeln(format("    %%%d = bitcast [ %d x double ]* %%_DATA1_%s to double*",
            r, symtab.DimSize(ident) + 1, symtab.getId(ident)));
        writeln(format("    call void @mat_input(double* %%%d, i32 %d, double* %%NUM, i16 %d)",
            r, symtab.DimSize(ident), symtab.line));
        super.codegen();
    }
}

class MatReadString : Node {
    private int ident;
    private Expr elems;
    this(int id, Expr idx) {
        ident = id;
        left = idx;
        symtab.initializeDimString(ident); // note: not Dim2
        symtab.useData(false, true);
    }
    override void codegen() {
        left.codegen();
        auto sz = symtab.strDimSize(ident) + 1;
        auto idx = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", idx, (cast(Expr)(left)).result));
        auto cmp = reg;
        writeln(format("    %%%d = icmp ult i32 %%%d, %d", cmp, idx, sz));
        auto fct = reg;
        writeln(format("    %%%d = select i1 %%%d, void (i32, i16)* @dummy_fct, void (i32, i16)* @runtime_error", fct, cmp));
        writeln(format("    call void %%%d(i32 4, i16 %d)", fct, symtab.line)); // error: index out of bounds
        auto dim = reg;
        writeln(format("    %%%d = bitcast [ %d x i8* ]* %%_DATAS_%s to i8**", dim, sz, symtab.getId(ident)));
        auto gep = reg;
        writeln(format("    %%%d = getelementptr i32, i32* %%_DATA_STR_P, i32 0", gep));
        auto data = reg;
        writeln(format("    %%%d = bitcast [ %d x i8* ]* @_DATA_STR to i8**", data, symtab.dataStrN));
        writeln(format("    call void @mat_read_str(i8** %%%d, i32 %%%d, i8** %%%d, i32 %d, i32* %%%d, i16 %u)",
            dim, idx, data, symtab.dataStrN, gep, symtab.line));
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
        auto dim = reg;
        writeln(format("    %%%d = bitcast [ %d x i8* ]* %%_DATAS_%s to i8**",
            dim, symtab.strDimSize(ident) + 1, symtab.getId(ident)));
        writeln(format("    call void @mat_print_str(i8** %%%d, i1 %s)",
            dim, packed ? "true" : "false"));
        super.codegen();
    }
}

import Node: Node;
import std.stdio : writeln;
import std.format : format;

public immutable string ll_header = q"___
%struct.Dims = type { i32, i32 }
%struct.Mat = type { %struct.Dims*, %struct.Dims*, double* }

declare void @print_string(i8* noundef %0) nounwind
declare void @print_number(double noundef %0) nounwind
declare void @print_integer(i32 noundef %0) nounwind
declare void @print_newline() nounwind
declare void @print_comma() nounwind
declare void @print_semicolon() nounwind
declare void @print_tab(i32 noundef %0) nounwind
declare void @runtime_error(i32 noundef %0, i16 noundef %1) nounwind
declare void @mat_print(double* noundef %0, i32 noundef %1, i1 noundef zeroext %2, i16 noundef %3) nounwind
declare void @mat_print2(%struct.Mat* noundef %0, i1 noundef zeroext %1) nounwind
declare void @mat_print_str(i8** noundef %0, i1 noundef zeroext %1) nounwind
declare void @mat_read(double* noundef %0, i32 noundef %1, double* noundef %2, i32 noundef %3, i32* noundef %4, i16 noundef %5) nounwind
declare void @mat_read2(%struct.Mat* noundef %0, double* noundef %1, i32 noundef %2, i32* noundef %3, i16 noundef %4) nounwind
declare void @mat_read_str(i8** noundef %0, i32 noundef %1, i8** noundef %2, i32 noundef %3, i32* noundef %4, i16 noundef %5) nounwind
declare void @mat_add(%struct.Mat* noundef %0, %struct.Mat* noundef %1, %struct.Mat* noundef %2, i16 noundef %3) nounwind
declare void @mat_sub(%struct.Mat* noundef %0, %struct.Mat* noundef %1, %struct.Mat* noundef %2, i16 noundef %3) nounwind
declare void @mat_mul(%struct.Mat* noundef %0, %struct.Mat* noundef %1, %struct.Mat* noundef %2, i16 noundef %3) nounwind
declare void @mat_zer_con(%struct.Mat* noundef %0, i1 noundef zeroext %1, i16 noundef %2) nounwind
declare void @mat_idn(%struct.Mat* noundef %0, i16 noundef %1) nounwind
declare void @mat_trn(%struct.Mat* noundef %0, %struct.Mat* noundef %1, i16 noundef %2) nounwind
declare double* @mat_minor(double* noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) nounwind
declare double @mat_det(double* noundef %0, i32 noundef %1) nounwind
declare void @mat_inv(%struct.Mat* noundef %0, %struct.Mat* noundef %1, double* noundef %2, i16 noundef %3) nounwind
declare void @mat_scalar(%struct.Mat* noundef %0, %struct.Mat* noundef %1, double noundef %2, i16 noundef %3) nounwind
declare void @mat_zer_con_idn_dim(%struct.Mat* noundef %0, i32 %1, i16 noundef %2) nounwind
declare void @mat_input(double* noundef %0, i32 noundef %1, double* noundef %2, i16 noundef %3) nounwind
declare void @change_from_string(i8** noundef %0, double* noundef %1, i32 noundef %2, i16 noundef %3) nounwind
declare void @change_to_string(i8** noundef %0, double* noundef %1, i32 noundef %2, i16 noundef %3) nounwind
declare void @read_number(double* noundef %0) nounwind
declare void @read_string(i8* noundef %0, i32 noundef %1) nounwind
declare double @random_lcg(i32 noundef %0) nounwind
declare double @cot(double noundef %0) nounwind
declare double @sgn(double noundef %0) nounwind
declare i8* @str_dup(i8* noundef %0) nounwind

declare double @pow(double noundef %0, double noundef %1) nounwind
declare double @fabs(double noundef %0) nounwind
declare double @floor(double noundef %0) nounwind
declare double @ceil(double noundef %0) nounwind
declare double @sqrt(double noundef %0) nounwind
declare double @sin(double noundef %0) nounwind
declare double @cos(double noundef %0) nounwind
declare double @tan(double noundef %0) nounwind
declare double @asin(double noundef %0) nounwind
declare double @acos(double noundef %0) nounwind
declare double @atan(double noundef %0) nounwind
declare double @log(double noundef %0) nounwind
declare double @exp(double noundef %0) nounwind
declare i8* @malloc(i64 noundef %0) nounwind
declare void @free(i8* noundef %0) nounwind
declare i32 @strcmp(i8* noundef %0, i8* noundef %1) nounwind
declare i32 @time(i8* noundef %0) nounwind

define void @dummy_fct(i32 noundef %0, i16 noundef %1) nounwind {
    ret void
}

___";

public immutable string ll_footer = q"___
  exit:
    ret i32 0
}
___";

public int gepDim(Node n, int ident, int idx) {
    auto sz = n.symtab.DimSize(ident) + 1;
    auto cmp = n.reg;
    writeln(format("    %%%d = icmp ult i32 %%%d, %d", cmp, idx, sz));
    auto fct = n.reg;
    writeln(format("    %%%d = select i1 %%%d, void (i32, i16)* @dummy_fct, void (i32, i16)* @runtime_error", fct, cmp));
    writeln(format("    call void %%%d(i32 4, i16 %d)", fct, n.symtab.line)); // error: index out of bounds
    auto gep = n.reg;
    writeln(format("    %%%d = getelementptr [ %u x double ], [ %u x double ]* %%_DATA1_%s, i32 0, i32 %%%d",
        gep, sz, sz, n.symtab.getId(ident), idx));
    return gep;
}

public int gepDim2(Node n, int ident, int idx1, int idx2) {
    auto sz1 = n.symtab.Dim2Size(ident)[0] + 1, sz2 = n.symtab.Dim2Size(ident)[1] + 1;
    auto cmp1 = n.reg;
    writeln(format("    %%%d = icmp ult i32 %%%d, %d", cmp1, idx1, sz1));
    auto cmp2 = n.reg;
    writeln(format("    %%%d = icmp ult i32 %%%d, %d", cmp2, idx2, sz2));
    auto cmp = n.reg;
    writeln(format("    %%%d = and i1 %%%d, %%%d", cmp, cmp1, cmp2));
    auto fct = n.reg;
    writeln(format("    %%%d = select i1 %%%d, void (i32, i16)* @dummy_fct, void (i32, i16)* @runtime_error", fct, cmp));
    writeln(format("    call void %%%d(i32 4, i16 %d)", fct, n.symtab.line)); // error: index out of bounds
    auto offset_base = n.reg;
    writeln(format("    %%%d = mul i32 %%%d, %d ", offset_base, idx1, sz2));
    auto offset = n.reg;
    writeln(format("    %%%d = add i32 %%%d, %%%d", offset, offset_base, idx2));
    auto gep = n.reg;
    writeln(format("    %%%d = getelementptr [ %u x double ], [ %u x double ]* %%_DATA2_%s, i32 0, i32 %%%d",
        gep, sz1 * sz2, sz1 * sz2, n.symtab.getId(ident), offset));
    return gep;
}

public int readData(Node n) {
    auto data_n = n.symtab.dataN;
    auto ptr = n.reg;
    writeln(format("    %%%d = load i32, i32* %%_DATA_NUM_P", ptr));
    auto cmp = n.reg;
    writeln(format("    %%%d = icmp ult i32 %%%d, %d", cmp, ptr, data_n));
    auto fct = n.reg;
    writeln(format("    %%%d = select i1 %%%d, void (i32, i16)* @dummy_fct, void (i32, i16)* @runtime_error", fct, cmp));
    writeln(format("    call void %%%d(i32 1, i16 %d)", fct, n.symtab.line)); // error: out of data
    auto new_ptr = n.reg;
    writeln(format("    %%%d = add i32 %%%d, 1", new_ptr, ptr));
    writeln(format("    store i32 %%%d, i32* %%_DATA_NUM_P", new_ptr));
    auto gep = n.reg;
    writeln(format("    %%%d = getelementptr [ %d x double ], [ %d x double ]* @_DATA, i32 0, i32 %%%d", gep, data_n, data_n, ptr));
    auto data = n.reg;
    writeln(format("    %%%d = load double, double* %%%d", data, gep));
    return data;
}

public int gepStringDim(Node n, int ident, int idx) {
    auto sz = n.symtab.strDimSize(ident) + 1;
    auto cmp = n.reg;
    writeln(format("    %%%d = icmp ult i32 %%%d, %d", cmp, idx, sz));
    auto fct = n.reg;
    writeln(format("    %%%d = select i1 %%%d, void (i32, i16)* @dummy_fct, void (i32, i16)* @runtime_error", fct, cmp));
    writeln(format("    call void %%%d(i32 4, i16 %d)", fct, n.symtab.line)); // error: index out of bounds
    auto gep = n.reg;
    writeln(format("    %%%d = getelementptr [ %u x i8* ], [ %u x i8* ]* %%_DATAS_%s, i32 0, i32 %%%d",
        gep, sz, sz, n.symtab.getId(ident), idx));
    return gep;
}

public int readStringData(Node n) {
    auto data_n = n.symtab.dataStrN;
    auto ptr = n.reg;
    writeln(format("    %%%d = load i32, i32* %%_DATA_STR_P", ptr));
    auto cmp = n.reg;
    writeln(format("    %%%d = icmp ult i32 %%%d, %d", cmp, ptr, data_n));
    auto fct = n.reg;
    writeln(format("    %%%d = select i1 %%%d, void (i32, i16)* @dummy_fct, void (i32, i16)* @runtime_error", fct, cmp));
    writeln(format("    call void %%%d(i32 1, i16 %d)", fct, n.symtab.line)); // error: out of data
    auto new_ptr = n.reg;
    writeln(format("    %%%d = add i32 %%%d, 1", new_ptr, ptr));
    writeln(format("    store i32 %%%d, i32* %%_DATA_STR_P", new_ptr));
    auto gep = n.reg;
    writeln(format("    %%%d = getelementptr [%d x i8*], [%d x i8*]* @_DATA_STR, i32 0, i32 %%%d", gep, data_n, data_n, ptr));
    auto data = n.reg;
    writeln(format("    %%%d = load i8*, i8** %%%d", data, gep));
    auto r = n.reg;
    writeln(format("    %%%d = call i8* @str_dup(i8* %%%d)", r, data));
    return r;
}

public int matrix(Node n, int ident) {
    auto dim = n.reg;
    writeln(format("    %%%d = alloca %%struct.Dims", dim));
    auto gep1 = n.reg;
    writeln(format("    %%%d = getelementptr %%struct.Dims, %%struct.Dims* %%%d, i32 0, i32 0", gep1, dim));
    writeln(format("    store i32 %d, i32* %%%d", n.symtab.Dim2Size(ident)[0], gep1));
    auto gep2 = n.reg;
    writeln(format("    %%%d = getelementptr %%struct.Dims, %%struct.Dims* %%%d, i32 0, i32 1", gep2, dim));
    writeln(format("    store i32 %d, i32* %%%d", n.symtab.Dim2Size(ident)[1], gep2));
    auto mat = n.reg;
    writeln(format("    %%%d = alloca %%struct.Mat", mat));
    auto gep3 = n.reg;
    writeln(format("    %%%d = getelementptr %%struct.Mat, %%struct.Mat* %%%d, i32 0, i32 0", gep3, mat));
    writeln(format("    store %%struct.Dims* %%%d, %%struct.Dims** %%%d", dim, gep3));
    auto gep4 = n.reg;
    writeln(format("    %%%d = getelementptr %%struct.Mat, %%struct.Mat* %%%d, i32 0, i32 1", gep4, mat));
    writeln(format("    store %%struct.Dims* %%_MAT_%s, %%struct.Dims** %%%d", n.symtab.getId(ident), gep4));
    auto gep5 = n.reg;
    writeln(format("    %%%d = getelementptr %%struct.Mat, %%struct.Mat* %%%d, i32 0, i32 2", gep5, mat));
    auto ptr3 = n.reg;
    writeln(format("    %%%d = bitcast [ %d x double ]* %%_DATA2_%s to double*",
        ptr3, (n.symtab.Dim2Size(ident)[0] + 1) * (n.symtab.Dim2Size(ident)[1] + 1), n.symtab.getId(ident)));
    writeln(format("    store double* %%%d, double** %%%d", ptr3, gep5));
    return mat;
}

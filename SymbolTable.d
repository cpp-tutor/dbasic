import std.stdio : writeln, stderr;
import std.algorithm : countUntil, map;
import std.typecons : Tuple, tuple;
import std.variant : Variant;
import std.format : format;
import std.conv : to;
import std.string : indexOf;
import Expr : Expr;
import Node : For;

public enum Edition {
    First = 1, Second, Third, Fourth, Fifth, Sixth,
}

class SymbolTable {
    private enum Line { Unknown, Exists, BadRef, Referenced }
    private Line[ushort] lines;
    private int current_line = -1;
    private int nerrs = 0;
    immutable int max_errs = 5;
    private bool end_of_program = false, need_data = false, need_str_data = false;
    private string[] id_list, string_list;
    private int[] data_str;
    private double[] constant_list, data_num;
    private ushort[int] dims, str_dims;
    private Tuple!(ushort,ushort)[int] dims2;
    public struct Function { int[] param_idents; Expr fn_expr; int fn_line; ulong nparams; }
    private Function[int] functions;
    private bool[int] vars, mats, strings;
    immutable int max_depth = 8;
    private int ngosubs = 0;
    private bool[int] returns;
    private int basic_edition;
    this(Edition edition) {
        basic_edition = edition;
    }
    @property Edition edition() {
        return cast(Edition)basic_edition;
    }
    void error(string msg) {
        if (nerrs < max_errs) {
            stderr.writeln(msg, " IN ", current_line);
            ++nerrs;
        }
    }
    @property auto errors() {
        return nerrs;
    }
    void checkReferences() {
        foreach (l, ty; lines) {
            if (ty == Line.BadRef) {
                current_line = l;
                error("NO SUCH LINE");
            }
        }
        foreach (fn, f; functions) {
            if (f.fn_expr is null && f.fn_line == -1) {
                error("NO SUCH FUNCTION");
            }
        }
        if (For.pop() != -1) {
            error("FOR WITHOUT NEXT");
        }
        if (need_data && !data_num.length) {
            error("NO NUMERIC DATA");
        }
        if (need_str_data && !data_str.length) {
            error("NO STRING DATA");
        }
        end_of_program = true;
    }
    @property auto end() {
        return end_of_program;
    }
    void setLine(ushort l, bool first_pass = true) {
        if (first_pass && (l <= current_line)) {
            error("BAD LINE NUMBER");
        }
        current_line = l;
    }
    @property ushort line() {
        return cast(ushort)current_line;
    }
    void registerLine(ushort l) {
        if (l !in lines) {
            lines[l] = Line.Exists;
        }
        else if (lines[l] == Line.BadRef) {
            lines[l] = Line.Referenced;
        }
    }
    void registerFlow(ushort l) {
        if (l !in lines) {
            lines[l] = Line.BadRef;
        }
        else if (lines[l] == Line.Exists) {
            lines[l] = Line.Referenced;
        }
    }
    int installId(string id) {
        auto pos = countUntil(id_list, id);
        if (pos != -1) {
            return cast(int)pos;
        }
        else {
            id_list ~= id;
            return cast(int)(id_list.length - 1);
        }
    }
    void initializeId(int id) {
        if (id !in vars) {
            vars[id] = true;
        }
    }
    void initializeDim(int id, bool explicit_dim = false, ushort sz = 10) {
        if (id !in dims) {
            dims[id] = sz;
        }
        else if (explicit_dim) {
            error("DIM ALREADY USED");
        }
    }
    void initializeDim2(int id, bool explicit_dim = false, ushort sz1 = 10, ushort sz2 = 10) {
        if (id !in dims2) {
            dims2[id] = tuple(sz1, sz2);
        }
        else if (explicit_dim) {
            error("DIM ALREADY USED");
        }
    }
    void initializeMat(int id, bool explicit_mat = false) {
        if (id !in dims2) {
            error("DIM NOT DEFINED");
        }
        if (id !in mats) {
            if (explicit_mat) {
                mats[id] = true;
            }
            else {
                error("MAT NOT INITIALIZED");
            }
        }
    }
    int getMatType(int id) {
        if (id in mats) {
            return 2;
        }
        else if (id in dims) {
            return 1;
        }
        else {
            return 0;
        }
    }
    void initializeString(int id, bool explicit_str = false) {
        if (id !in strings) {
            if (explicit_str) {
                strings[id] = true;
            }
            else {
                error("STRING NOT INITIALIZED");
            }
        }
    }
    void initializeDimString(int id, bool explicit_dim = false, ushort sz = 10) {
        if (id !in str_dims) {
            str_dims[id] = sz;
        }
        else if (explicit_dim) {
            error("DIM ALREADY USED");
        }
    }
    int installString(string str) {
        auto pos = countUntil(string_list, str);
        if (pos != -1) {
            return cast(int)pos;
        }
        else {
            string_list ~= str;
            return cast(int)(string_list.length - 1);
        }
    }
    int installConstant(double num) {
        auto pos = countUntil(constant_list, num);
        if (pos != -1) {
            return cast(int)pos;
        }
        else {
            constant_list ~= num;
            return cast(int)(constant_list.length - 1);
        }
    }
    void installData(double num) {
        data_num ~= num;
    }
    void installData(int str) {
        data_str ~= str;
    }
    void useData(bool num = false, bool str = false) {
        if (num) {
            need_data = true;
        }
        if (str) {
            need_str_data = true;
        }
    }
    bool referencedLine(ushort l) {
        if (l !in lines) {
            throw new Exception("BAD LINE");
        }
        if (lines[l] == Line.BadRef) {
            throw new Exception("NON-EXISTENT LINE");
        }
        return lines[l] == Line.Referenced;
    }
    string getId(int i) {
        if ((i < 0) || (i >= id_list.length)) {
            throw new Exception("BAD IDENT");
        }
        if (i !in vars && i !in mats && i !in dims && i !in dims2 && i !in strings && i !in functions && i !in str_dims) {
            error("NO SUCH VARIABLE");
        }
        return id_list[i];
    }
    void addFunction(int name_id, Function f) {
        if (name_id !in functions) {
            functions[name_id] = f;
        }
        else {
            if (functions[name_id].fn_expr is null && functions[name_id].fn_line == -1) {
                if (f.nparams != functions[name_id].nparams) {
                    error("INCORRECT NUMBER OF PARAMETERS");
                }
                if (f.fn_expr !is null || f.fn_line != -1) {
                    functions[name_id] = f;
                }
            }
            else {
                if (f.fn_expr !is null || f.fn_line != -1) {
                    error("FUNCTION ALREADY DEFINED");
                }
            }
        }
    }
    ref Function getFunction(int name_id) {
        if (name_id !in functions) {
            error("NO SUCH FUNCTION");
            functions[name_id] = Function(new int[0], null, -1);
            return functions[name_id];
        }
        else {
            return functions[name_id];
        }
    }
    auto getStrLen(int str_id) { // hack for necessary bitcast
        return string_list[str_id].length;
    }
    @property auto dataN() { // hacks for get element pointer
        return data_num.length;
    }
    @property auto dataStrN() {
        return data_str.length;
    }
    @property auto gosub() {
        returns[++ngosubs] = true;
        return ngosubs;
    }
    auto getReturns() {
        return returns;
    }
    void simpleFunction(int r) {
        returns[r] = false;
    }
    auto DimSize(int id) {
        return dims[id];
    }
    auto Dim2Size(int id) {
        return dims2[id];
    }
    auto strDimSize(int id) {
        return str_dims[id];
    }
    void codegen() {
        auto g = (double value) {
            string s = to!string(value);
            return (s.indexOf('.') != -1) ? s : s ~ ".0";
        };
        foreach (i, c; constant_list) {
            writeln(format("@_C%u = private constant double %s", i, g(c)));
        }
        foreach (i, s; string_list) {
            writeln(format("@_S%u = private constant [ %u x i8 ] c\"%s\\00\"", i, s.length + 1, s));
        }
        if (dataN) {
            auto gen = data_num.map!(g);
            writeln(format("@_DATA = private constant [ %u x double ] [ %-(double %s, %) ]", dataN, gen));
        }
        if (dataStrN) {
            writeln(format("@_DATA_STR = private constant [ %u x i8* ] [ %-(i8* @_S%d, %) ]", dataStrN, data_str));
        }
        writeln("\ndefine i32 @main() {");
        writeln("  entry:");
        foreach (k, _; vars) {
            writeln(format("    %%%s = alloca double", id_list[k]));
            writeln(format("    store double 0.0, double* %%%s", id_list[k]));
        }
        foreach (k, _; strings) {
            writeln(format("    %%%s_ = alloca i8*", id_list[k]));
            writeln(format("    store i8* null, i8** %%%s_", id_list[k]));
        }
        if (data_num.length) {
            writeln("    %_DATA_NUM_P = alloca i32");
            writeln("    store i32 0, i32* %_DATA_NUM_P");
        }
        if (data_str.length) {
            writeln("    %_DATA_STR_P = alloca i32");
            writeln("    store i32 0, i32* %_DATA_STR_P");
        }
        foreach (k, v; dims) {
            writeln(format("    %%_DATA1_%s = alloca [ %d x double ]", id_list[k], v + 1));
            writeln(format("    store [ %d x double ] zeroinitializer, [ %d x double ]* %%_DATA1_%s",
                v + 1, v + 1, id_list[k]));
        }
        foreach (k, v; dims2) {
            writeln(format("    %%_DATA2_%s = alloca [ %d x double ]", id_list[k], (v[0] + 1) * (v[1] + 1)));
            writeln(format("    store [ %d x double ] zeroinitializer, [ %d x double ]* %%_DATA2_%s",
                (v[0] + 1) * (v[1] + 1), (v[0] + 1) * (v[1] + 1), id_list[k]));
        }
        foreach (k, v; str_dims) {
            writeln(format("    %%_DATAS_%s = alloca [ %d x i8* ]", id_list[k], v + 1));
            writeln(format("    store [ %d x i8* ] zeroinitializer, [ %d x i8* ]* %%_DATAS_%s",
                v + 1, v + 1, id_list[k]));
        }
        foreach (k, _; mats) {
            writeln(format("    %%_MAT_%s = alloca %%struct.Dims", id_list[k]));
            writeln(format("    store %%struct.Dims zeroinitializer, %%struct.Dims* %%_MAT_%s", id_list[k]));
        }
        if (returns.length) { // FIXME: shouldn't generate for only simple functions
            writeln(format("    %%_RETURN = alloca [ %d x i32 ]", max_depth));
            writeln(format("    store [ %d x i32 ] zeroinitializer, [ %d x i32 ]* %%_RETURN", max_depth, max_depth));
            writeln("    %_RETURN_P = alloca i32");
            writeln("    store i32 0, i32* %_RETURN_P");
        }
    }
}

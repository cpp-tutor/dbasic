import std.stdio : writeln, stderr;
import std.algorithm : countUntil;
import std.typecons : Tuple, tuple;
import Expr : Expr, Constant;

public enum Edition {
    First = 1, Second, Third, Fourth, Fifth, Sixth,
}

class SymbolTable {
    private enum Line { Unknown, Exists, Referenced, ExistsRef };
    private Line[ushort] lines;
    private int current_line = -1;
    private int nerrs = 0;
    immutable int max_errs = 5;
    private bool end_of_program = false;
    private bool[] id_initialized;
    private string[] id_list, string_list;
    private double[] constant_list, data_list;
    private ushort[int] dims;
    private Tuple!(ushort,ushort)[int] dims2;
    public struct Function { int param_ident; Expr fn_expr; }
    private Function[int] functions;
    private bool[int] mats;
    private int basic_edition;
    this(Edition edition) {
        basic_edition = edition;
    }
    @property enum Edition edition() {
        return cast(Edition)basic_edition;
    }
    void error(string msg) {
        if (nerrs < max_errs) {
            stderr.writeln(msg, " AT LINE ", current_line);
            ++nerrs;
        }
    }
    @property auto errors() {
        return nerrs;
    }
    void endOfProgram() {
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
        else if (lines[l] == Line.Referenced) {
            lines[l] = Line.ExistsRef;
        }
    }
    void registerFlow(ushort l) {
        if (l !in lines) {
            lines[l] = Line.Referenced;
        }
        else if (lines[l] == Line.Exists) {
            lines[l] = Line.ExistsRef;
        }
    }
    int installId(string id) {
        auto pos = countUntil(id_list, id);
        if (pos != -1) {
            return cast(int)pos;
        }
        else {
            id_list ~= id;
            id_initialized ~= false;
            return cast(int)(id_list.length - 1);
        }
    }
    void initializeId(int id) {
        id_initialized[id] = true;
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
        data_list ~= num;
    }
    bool referencedLine(ushort l) {
        if (l !in lines) {
            throw new Exception("BAD LINE");
        }
        if (lines[l] == Line.Referenced) {
            throw new Exception("NON-EXISTENT LINE");
        }
        return lines[l] == Line.ExistsRef;
    }
    string getId(int i, bool func = false) {
        if ((i < 0) || (i >= id_list.length)) {
            throw new Exception("BAD IDENT");
        }
        if (!id_initialized[i] && !func && i !in mats) {
            error("NO SUCH VARIABLE");
        }
        return id_list[i];
    }
    void addFunction(int n, Function f) {
        if (n !in functions) {
            functions[n] = f;
        }
        else {
            error("FUNCTION ALREADY DEFINED");
        }
    }
    ref Function getFunction(int n) {
        if (n !in functions) {
            error("NO SUCH FUNCTION");
            functions[n] = Function(0, new Constant(installConstant(0.0)));
            return functions[n];
        }
        else {
            return functions[n];
        }
    }
    void codegen() {
        foreach (i, id; id_list) {
            if (id_initialized[i]) {
                writeln(".", id, ":\n\t.double\t0.0");
            }
        }
        foreach (i, c; constant_list) {
            writeln("._c", i, ":\n\t.double\t", c);
        }
        if (data_list.length) {
            writeln("._data_ptr:\n\t.word\t0");
            writeln("._data_max:\n\t.word\t", data_list.length);
            writeln("._data:");
            foreach(d; data_list) {
                writeln("\t.double\t", d);
            }
        }
        foreach (k, v; dims) {
            writeln("._size", id_list[k], ":\n\t.word\t", v);
            writeln("\t.balign 8");
            writeln("._data", id_list[k], ":");
            for (int i = 0; i <= v; ++i) { // note: <=
                writeln("\t.double\t0.0");
            }
        }
        foreach (k, v; dims2) {
            writeln("._size2", id_list[k], ":\n\t.word\t", v[0], "\n\t.word\t", v[1]);
            writeln("\t.balign 8");
            writeln("._data2", id_list[k], ":");
            for (int i = 0; i < ((v[0] + 1) * (v[1] + 1)); ++i) {
                writeln("\t.double\t0.0");
            }
        }
        if (mats.length) {
            writeln("._mat_res:\n\t.word\t0\n\t.word\t0\n\t.word\t0");
            writeln("._mat_par1:\n\t.word\t0\n\t.word\t0\n\t.word\t0");
            writeln("._mat_par2:\n\t.word\t0\n\t.word\t0\n\t.word\t0");
            writeln("\t.balign 8");
        }
        foreach (k, _; mats) {
            writeln("._mat", id_list[k], ":\n\t.word\t0\n\t.word\t0");
        }
        foreach (i, s; string_list) {
            writeln("._s", i, ":\n\t.asciz\t\"", s, "\"");
            writeln("\t.balign 4");
        }
    }
}

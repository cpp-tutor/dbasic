import std.stdio;
import std.string;
import std.algorithm;
import Expr;

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
    private ushort[int] arrays;
    public struct Function { int param_ident; Expr fn_expr; }
    private Function[int] functions;
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
    int installID(string id) {
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
    void initializeID(int id) {
        id_initialized[id] = true;
    }
    void initializeDIM(int id, bool explicit_dim = false, ushort sz = 10) {
        if (id !in arrays) {
            arrays[id] = sz;
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
        data_list ~= num;
    }
    bool referencedLine(ushort l) {
        if (l !in lines) {
            throw new Exception("bad line");
        }
        if (lines[l] == Line.Referenced) {
            throw new Exception("non-existent line");
        }
        return lines[l] == Line.ExistsRef;
    }
    string getID(int i, bool fun = false) {
        assert((i >= 0) && (i < id_list.length));
        if (!id_initialized[i] && !fun) {
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
    Function getFunction(int n) {
        if (n !in functions) {
            error("NO SUCH FUNCTION");
            return Function(0, new Constant(installConstant(0.0)));
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
        foreach (k, v; arrays) {
            writeln("._size", id_list[k], ":\n\t.word\t", v);
            writeln("\t.balign 8");
            writeln("._data", id_list[k], ":");
            for (int i = 0; i <= v; ++i) { // note: <=
                writeln("\t.double\t0.0");
            }
        }
        foreach (i, s; string_list) {
            writeln("._s", i, ":\n\t.asciz\t\"", s, "\"");
            writeln("\t.balign 4");
        }
    }
}

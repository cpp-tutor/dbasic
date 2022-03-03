import std.stdio : writeln;
import Node : Node;
import Expr : Expr;

class Printable : Node {
    private static bool print_newline = true;
    this(Node pt) {
        left = pt;
    }
    override void codegen() {
        if (left) {
            left.codegen();
        }
        print_newline = true;
        super.codegen();
    }
    static void newline(bool nl) {
        print_newline = nl;
    }
    static bool newline() {
        return print_newline;
    }
}

class NewLine : Node {
    override void codegen() {
        if (Printable.newline()) {
            writeln("\tbl\tprint_newline(PLT)");
        }
        super.codegen();
    }
}

class Comma : Node {
    override void codegen() {
        writeln("\tbl\tprint_comma(PLT)");
        Printable.newline(false);
        super.codegen();
    }
}

class SemiColon : Node {
    override void codegen() {
        writeln("\tbl\tprint_semicolon(PLT)");
        Printable.newline(false);
        super.codegen();
    }
}

class String : Node {
    private int str;
    this(int s) {
        str = s;
    }
    override void codegen() {
        writeln("\tadrl\tr0, ._s", str);
        writeln("\tbl\tprint_string(PLT)");
        Printable.newline(true);
        super.codegen();
    }
}

class PrintExpr : Node {
    this(Node e) {
        left = e;
    }
    override void codegen() {
        Expr.clearRegs();
        left.codegen();
        writeln("\tvmov.f64\td0, d", (cast(Expr)left).result);
        writeln("\tbl\tprint_number(PLT)");
        Printable.newline(true);
        super.codegen();
    }
}
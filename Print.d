import std.stdio : writeln;
import std.format : format;
import Node : Node;
import Expr : Expr, StringExpr;

class NewLine : Node {
    override void codegen() {
        writeln("    call void @print_newline()");
        super.codegen();
    }
}

class Comma : Node {
    override void codegen() {
        writeln("    call void @print_comma()");
        super.codegen();
    }
}

class SemiColon : Node {
    override void codegen() {
        writeln("    call void @print_semicolon()");
        super.codegen();
    }
}

class String : Node {
    private int str;
    this(int s) {
        str = s;
    }
    override void codegen() {
        auto r = reg;
        writeln(format("    %%%d = bitcast [ %d x i8 ]* @_S%d to i8*", r, symtab.getStrLen(str) + 1, str));
        writeln(format("    call void @print_string(i8* %%%d)", r));
        super.codegen();
    }
}

class PrintExpr : Node {
    this(Expr e) {
        left = e;
    }
    override void codegen() {
        left.codegen();
        writeln(format("    call void @print_number(double %%%d)", (cast(Expr)left).result));
        super.codegen();
    }
}

class PrintString : Node {
    this(StringExpr e) {
        left = e;
    }
    override void codegen() {
        left.codegen();
        writeln(format("    call void @print_string(i8* %%%d)", (cast(Expr)left).result));
        super.codegen();
    }
}

class PrintTab : Node {
    this(Expr e) {
        left = e;
    }
    override void codegen() {
        left.codegen();
        auto r = reg;
        writeln(format("    %%%d = fptosi double %%%d to i32", r, (cast(Expr)left).result));
        writeln(format("    call void @print_tab(i32 %%%d)", r));
        super.codegen();
    }
}

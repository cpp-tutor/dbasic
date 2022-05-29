import std.stdio : writeln;
import Node : Node;
import Expr : Expr, StringExpr;

class Print : Node {
    this(Node pt) {
        left = pt;
    }
    override void codegen() {
        if (left) {
            left.codegen();
        }
        super.codegen();
    }
}

class NewLine : Node {
    override void codegen() {
        writeln("\tbl\tprint_newline(PLT)");
        super.codegen();
    }
}

class Comma : Node {
    override void codegen() {
        writeln("\tbl\tprint_comma(PLT)");
        super.codegen();
    }
}

class SemiColon : Node {
    override void codegen() {
        writeln("\tbl\tprint_semicolon(PLT)");
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
        super.codegen();
    }
}

class PrintExpr : Node {
    this(Expr e) {
        left = e;
    }
    override void codegen() {
        Expr.clearRegs();
        left.codegen();
        writeln("\tvmov.f64\td0, d", (cast(Expr)left).result);
        writeln("\tbl\tprint_number(PLT)");
        super.codegen();
    }
}

class PrintString : Node {
    this(StringExpr e) {
        left = e;
    }
    override void codegen() {
        left.codegen();
        writeln("\tbl\tprint_string(PLT)");
        super.codegen();
    }
}

class PrintTab : Node {
    this(Expr e) {
        left = e;
    }
    override void codegen() {
        Expr.clearRegs();
        left.codegen();
        writeln("\tvcvt.s32.f64\ts0, d", (cast(Expr)(left)).result);
        writeln("\tvmov\tr0, s0");
        writeln("\tbl\tprint_tab(PLT)");
        super.codegen();
    }
}

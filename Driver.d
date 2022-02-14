import std.stdio;
import std.conv;
import LexerImpl;
import Parser;
import SymbolTable;
import Node;

int main() {
    auto symtab = new SymbolTable();
    auto lexer = new LexerImpl(symtab);
    writeln("# Edition: BASIC The ", to!string(lexer.edition));
    auto head = new Node(symtab);
    auto parser = new Parser(lexer, symtab, head);
    try {
        parser.parse();
        if (!symtab.end) {
            symtab.error("MISSING END");
        }
    }
    catch (Exception e) {
        stderr.writeln(e);
        return 1;
    }
    if (symtab.errors == 0) {
        head.prelude();
        head.codegen();
        head.interlude();
        symtab.codegen();
        return 0;
    }
    return 1;
}

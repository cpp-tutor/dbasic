import std.stdio : writeln, stderr;
import std.conv : to;
import std.exception : collectExceptionMsg;
import LexerImpl : LexerImpl;
import Parser : Parser;
import SymbolTable : SymbolTable, Edition;
import Node : Node;

immutable uint MAX_SUPPORTED_EDITION = 4;

int main(const string[] args) {
    uint edition = MAX_SUPPORTED_EDITION;
    if (args.length == 2) {
        edition = to!uint(args[1]);
        if ((edition < 1) || (edition > 6)) {
            stderr.writeln("Bad edition (must be 1-6)");
            return 1;
        }
    }
    auto symtab = new SymbolTable(cast(Edition)edition);
    auto lexer = new LexerImpl(symtab);
    stderr.writeln("BASIC The ", to!string(symtab.edition), symtab.edition > MAX_SUPPORTED_EDITION ? " (not yet implemented)" : "");
    auto head = new Node(symtab);
    auto parser = new Parser(lexer, symtab, head);
    auto msg = collectExceptionMsg(parser.parse());
    if (msg) {
        symtab.error(msg);
    }
    else if (!symtab.end && !symtab.errors) {
        symtab.error("MISSING END");
    }
    if (!symtab.errors) {
        auto generate = {
            head.prelude();
            head.codegen();
            head.interlude();
            symtab.codegen();
        };
        msg = collectExceptionMsg(generate());
        if (msg) {
            symtab.error(msg);
            return 1;
        }
        return 0;
    }
    return 1;
}

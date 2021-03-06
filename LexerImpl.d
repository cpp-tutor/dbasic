import std.stdio :  writeln, readln, stdin, stderr;
import std.regex : matchFirst;
import std.typecons : Tuple, tuple;
import std.range.primitives : front;
import std.string : strip, startsWith, indexOf, indexOfAny;
import std.conv : parse, to;
import std.uni : isNumber;
import std.ascii : uppercase, letters, digits;
import Parser : Lexer, Parser, TokenKind, Symbol;
import SymbolTable : SymbolTable, Edition;

class LexerImpl : Lexer {
    private static immutable Keywords = [
        tuple( "LET",     TokenKind.LET,     Edition.First  ),
        tuple( "READ",    TokenKind.READ,    Edition.First  ),
        tuple( "DATA",    TokenKind.DATA,    Edition.First  ),
        tuple( "PRINT",   TokenKind.PRINT,   Edition.First  ),
        tuple( "GOSUB",   TokenKind.GOSUB,   Edition.First  ),
        tuple( "GO",      TokenKind.GO,      Edition.First  ),
        tuple( "IF",      TokenKind.IF,      Edition.First  ),
        tuple( "FOR",     TokenKind.FOR,     Edition.First  ),
        tuple( "NEXT",    TokenKind.NEXT,    Edition.First  ),
        tuple( "END",     TokenKind.END,     Edition.First  ),
        tuple( "STOP",    TokenKind.STOP,    Edition.First  ),
        tuple( "DEF",     TokenKind.DEF,     Edition.First  ),
        tuple( "FN",      TokenKind.FN, Edition.First  ),
        tuple( "RETURN",  TokenKind.RETURN,  Edition.First  ),
        tuple( "DIM",     TokenKind.DIM,     Edition.First  ),
        tuple( "REM",     TokenKind.REM,     Edition.First  ),
        tuple( "THEN",    TokenKind.THEN,    Edition.First  ),
        tuple( "TO",      TokenKind.TO,      Edition.First  ),
        tuple( "STEP",    TokenKind.STEP,    Edition.First  ),
        tuple( "MAT",     TokenKind.MAT,     Edition.Second ),
        tuple( "ZER",     TokenKind.ZER,     Edition.Second ),
        tuple( "CON",     TokenKind.CON,     Edition.Second ),
        tuple( "IDN",     TokenKind.IDN,     Edition.Second ),
        tuple( "TRN",     TokenKind.TRN,     Edition.Second ),
        tuple( "INV",     TokenKind.INV,     Edition.Second ),
        tuple( "RESTORE", TokenKind.RESTORE, Edition.Third  ),
        tuple( "INPUT",   TokenKind.INPUT,   Edition.Third  ),
        tuple( "DET",     TokenKind.DET,     Edition.Third  ),
        tuple( "NUM",     TokenKind.NUM,     Edition.Third  ),
        tuple( "CHANGE",  TokenKind.CHANGE,  Edition.Fourth ),
        tuple( "ON",      TokenKind.ON,      Edition.Fourth ),
        tuple( "TAB",     TokenKind.TAB,     Edition.Fourth ),
        tuple( "RANDOMIZE", TokenKind.RANDOM,  Edition.Fourth ),
        tuple( "RANDOM",  TokenKind.RANDOM,  Edition.Fourth ),
        tuple( "RND",     TokenKind.RND,     Edition.Fourth ),
    ];
    private static immutable Matches = [
        tuple( TokenKind.WS,          ` +`                                                          ),
        tuple( TokenKind.MATHFN,      `(SQR|SIN|COS|TAN|COT|ASN|ACS|ATN|INT|LOG|EXP|RND|ABS|SGN)\(` ),
        tuple( TokenKind.KEYWORD,     `[A-Z]([A-Z])+`                                               ),
        tuple( TokenKind.IDENT,       `[A-Z]([0-9])?`                                               ),
        tuple( TokenKind.NUMBER,      `[0-9]*\.[0-9]*(E(-)?[0-9]+)?`                                ),
        tuple( TokenKind.INTEGER,     `0|[1-9][0-9]*`                                               ),
        tuple( TokenKind.STRING,      `\"[^"]*\"`                                                   ),
        tuple( TokenKind.DATASTRING,  `[A-Za-z]([^,\n])*`                                           ),
        tuple( TokenKind.ASSIGN,      `=`                                                           ),
        tuple( TokenKind.RELOP,       `<>|<=|<|>=|>`                                                ),
        tuple( TokenKind.PLUS,        `\+`                                                          ),
        tuple( TokenKind.MINUS,       `-`                                                           ),
        tuple( TokenKind.TIMES,       `\*`                                                          ),
        tuple( TokenKind.DIVIDE,      `\/`                                                          ),
        tuple( TokenKind.EXP,         `\^`                                                          ),
        tuple( TokenKind.LPAREN,      `\(`                                                          ),
        tuple( TokenKind.RPAREN,      `\)`                                                          ),
        tuple( TokenKind.DOLLAR,      `\$`                                                          ),
        tuple( TokenKind.COMMA,       `,`                                                           ),
        tuple( TokenKind.SEMICOLON,   `;`                                                           ),
        tuple( TokenKind.APOSTROPHE,  `'`                                                           ),
        tuple( TokenKind.EOL,         `\n|\r\n`                                                     ),
    ];
    private string line_input = "";
    private SymbolTable symtab;
    this(SymbolTable s) {
        symtab = s;
    }
    public Symbol yylex() {
        if (!line_input.length) {
            line_input = to!string(readln());
            auto lmatch = matchFirst(line_input, `^(0|[1-9][0-9]*)`);
            if (lmatch) {
                symtab.setLine(to!ushort(lmatch.hit));
                symtab.registerLine(symtab.line);
                line_input = line_input[lmatch.hit.length .. $];
                return Symbol(TokenKind.LINENO, symtab.line);
            }
            else {
                if (stdin.eof()) {
                    return Symbol(TokenKind.YYEOF);
                }
                else {
                    return Symbol(TokenKind.BADLINE);
                }
            }
        }
        foreach (token; Matches) {
            if (!line_input.length) {
                return Symbol(TokenKind.EOL);
            }
            auto match = matchFirst(line_input, "^(" ~ token[1] ~ ")");
            if (match) {
                switch (token[0]) {
                    case TokenKind.WS:
                        line_input = line_input[match.hit.length .. $];
                        break; // no return to parser
                    case TokenKind.KEYWORD:
                        foreach (keyword; Keywords) {
                            if (match.hit.startsWith(keyword[0])) {
                                if (keyword[2] > symtab.edition) {
                                    symtab.error("INVALID KEYWORD FOR THIS EDITION");
                                }
                                if (keyword[0] == "REM") {
                                    line_input = "\n";
                                }
                                else {
                                    line_input = line_input[keyword[0].length .. $];
                                }
                                return Symbol(keyword[1]);
                            }
                        }
                        auto pos = line_input.indexOfAny(",\n\r"); // note: must always match
                        auto data_str = Symbol(TokenKind.DATASTRING, symtab.installString(line_input[0 .. pos]));
                        line_input = line_input[pos .. $];
                        return data_str;
                    case TokenKind.IDENT:
                        if ((letters ~ digits).indexOf(line_input[match.hit.length]) == -1) {
                            line_input = line_input[match.hit.length .. $];
                            return Symbol(TokenKind.IDENT, symtab.installId(match.hit));
                        }
                        else {
                            auto pos = line_input.indexOfAny(",\n\r");
                            auto data_str = Symbol(TokenKind.DATASTRING, symtab.installString(line_input[0 .. pos]));
                            line_input = line_input[pos .. $];
                            return data_str;
                        }
                    case TokenKind.NUMBER:
                        line_input = line_input[match.hit.length .. $];
                        return Symbol(TokenKind.NUMBER, to!double(match.hit));
                    case TokenKind.INTEGER:
                        line_input = line_input[match.hit.length .. $];
                        return Symbol(TokenKind.INTEGER, to!int(match.hit));
                    case TokenKind.STRING:
                        line_input = line_input[match.hit.length .. $];
                        return Symbol(TokenKind.STRING, symtab.installString(match.hit[1 .. $ - 1]));
                    case TokenKind.RELOP:
                        line_input = line_input[match.hit.length .. $];
                        switch (match.hit) {
                            case "<>":
                                return Symbol(TokenKind.RELOP, TokenKind.NE);
                            case "<":
                                return Symbol(TokenKind.RELOP, TokenKind.LT);
                            case "<=":
                                return Symbol(TokenKind.RELOP, TokenKind.LE);
                            case ">=":
                                return Symbol(TokenKind.RELOP, TokenKind.GE);
                            case ">":
                                return Symbol(TokenKind.RELOP, TokenKind.GT);
                            default:
                                return Symbol(TokenKind.RELOP, TokenKind.EQ);
                        }
                    case TokenKind.MATHFN:
                        line_input = line_input[match.hit.length .. $];
                        return Symbol(TokenKind.MATHFN, match.hit[0 .. $ - 1]);
                    case TokenKind.DATASTRING:
                        line_input = line_input[match.hit.length .. $];
                        return Symbol(TokenKind.DATASTRING, symtab.installString(match.hit));
                    case TokenKind.APOSTROPHE:
                        line_input = "";
                        return Symbol(TokenKind.EOL);
                    default:
                        line_input = line_input[match.hit.length .. $];
                        return Symbol(token[0]);
                }
            }
        }
        return Symbol(TokenKind.BADLINE);
    }
    public void yyerror(string msg) {
        symtab.error(msg);
    }
    public void reportSyntaxError(Parser.Context ctx)
    { // $ 10.2.6 bison manual
        symtab.error("SYNTAX ERROR");
        immutable int TOKENMAX = 25;
        auto arg = new Parser.SymbolKind[TOKENMAX];
        int n = ctx.getExpectedTokens(arg, TOKENMAX);
        if (n < TOKENMAX) {
            for (int i = 0; i < n; ++i) {
                stderr.write((i == 0 ? "(EXPECTED " : " OR "), arg[i]);
            }
        }
        auto lookahead = ctx.getToken();
        stderr.writeln(" INSTEAD OF ", lookahead, ")");
    }
}

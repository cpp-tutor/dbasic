%language "D"
%output "Parser.d"
%define api.parser.class {Parser}
%define parse.error custom
%start Stmts
%define api.value.type union
%parse-param { SymbolTable symtab }
%parse-param { Node next }

%token <ushort> LINENO 
%token <int> IDENT STRING INTEGER RELOP
%token <double> NUMBER
%token <string> MATHFN
%nterm <Parser.Node> Stmt Lineno Print Tab PrintSq Input Read
%nterm <Parser.Expr> Expr

// Keywords which are valid at the beginning of a line
%token LET READ DATA PRINT GOTO IF FOR NEXT END STOP DEF GOSUB RETURN DIM REM INPUT
// Other keywords
%token THEN TO STEP FN
// Internal grammatical tokens
%token EQ NE LT LE GE GT LPAREN RPAREN DOLLAR COMMA SEMICOLON
// Other functionality
%token EOL WS BLANKLINE BADLINE

%left PLUS MINUS
%left TIMES DIVIDE
%right UMINUS
%right EXP

%code {
    import Node : Node, Line, Stop, Goto, GoSub, Return, Let, LetDim, LetDim2, Read, ReadDim, ReadDim2, Input, InputDim, InputDim2, If, For, Next;
    import Expr : Expr, Op, Constant, Identifier, Dim, Dim2, Operation, MathFn, FnCall;
    import LexerImpl : LexerImpl;
    import SymbolTable : SymbolTable;
    import Printable : Printable, NewLine, Comma, SemiColon, String, PrintExpr;
}

%%

Stmts   : %empty
        | Stmts Stmt
        ;

Stmt    : Lineno { next = next.link($$); }
        | STOP EOL { $$ = new Stop(); next = next.link($$); }
        | PRINT PrintSq EOL { $2.linkLast(new NewLine()); $$ = new Printable($2); next = next.link($$); }
        | GOTO INTEGER EOL { symtab.registerFlow(cast(ushort)$2); $$ = new Goto(cast(ushort)$2); next = next.link($$); }
        | GOSUB INTEGER EOL { symtab.registerFlow(cast(ushort)$2); $$ = new GoSub(cast(ushort)$2); next = next.link($$); }
        | LET IDENT RELOP Expr EOL { if ($3 != TokenKind.EQ) symtab.error("ILLEGAL RELATION"); $$ = new Let($2, $4); next = next.link($$); }
        | LET IDENT LPAREN Expr RPAREN RELOP Expr EOL { if ($6 != TokenKind.EQ) symtab.error("ILLEGAL RELATION"); $$ = new LetDim($2, $4, $7); next = next.link($$); }
        | LET IDENT LPAREN Expr COMMA Expr RPAREN RELOP Expr EOL { if ($8 != TokenKind.EQ) symtab.error("ILLEGAL RELATION"); $$ = new LetDim2($2, $4, $6, $9); next = next.link($$); }
        | IF Expr RELOP Expr THEN INTEGER EOL { $$ = new If($2, $3, $4, cast(ushort)$6); next = next.link($$); }
        | FOR IDENT RELOP Expr TO Expr STEP Expr EOL { if ($3 != TokenKind.EQ) symtab.error("ILLEGAL RELATION"); $$ = new For($2, $4, $6, $8); next = next.link($$); }
        | FOR IDENT RELOP Expr TO Expr EOL { if ($3 != TokenKind.EQ) symtab.error("ILLEGAL RELATION"); $$ = new For($2, $4, $6, new Constant(symtab.installConstant(1.0))); next = next.link($$); }
        | NEXT IDENT EOL { $$ = new Next($2); next = next.link($$); }
        | DATA DataSq EOL {}
        | READ ReadSq EOL {}
        | INPUT InputSq EOL {}
        | DIM IDENT LPAREN INTEGER RPAREN EOL { symtab.initializeDim($2, true, cast(ushort)$4); }
        | DIM IDENT LPAREN INTEGER COMMA INTEGER RPAREN EOL { symtab.initializeDim2($2, true, cast(ushort)$4, cast(ushort)$6); }
        | DEF FN IDENT LPAREN IDENT RPAREN RELOP Expr EOL { if ($7 != TokenKind.EQ) symtab.error("ILLEGAL RELATION"); symtab.initializeId($5); symtab.addFunction($3, SymbolTable.Function($5, $8)); }
        | RETURN EOL { $$ = new Return(); next = next.link($$); }
        | REM EOL { }
        | END EOL { if (For.pop() != -1) symtab.error("FOR WITHOUT NEXT"); symtab.endOfProgram(); }
        ;

Lineno  : LINENO { if (symtab.end) symtab.error("STATEMENT AFTER END"); $$ = new Line($1); }
        ;

PrintSq : %empty { $$ = new Node(); }
        | Print { $$ = $1; }
        | PrintSq Tab { $$.linkLast($2); }
        | PrintSq Tab Print { $$.linkLast($2); $$.linkLast($3); }
        ;

Print   : STRING { $$ = new String($1); }
        | Expr { $$ = new PrintExpr($1); }
        | STRING Expr { $$ = new String($1); $$.linkLast(new PrintExpr($2)); }
        ;

Tab     : COMMA { $$ = new Comma(); }
        | SEMICOLON { $$ = new SemiColon(); }
        ;

DataSq  : Data {} // no type for $$
        | DataSq COMMA Data {}
        ;

Data    : INTEGER { symtab.installData($1); } // no type for $$
        | NUMBER { symtab.installData($1); }
        | MINUS INTEGER { symtab.installData(-$2); }
        | MINUS NUMBER { symtab.installData(-$2); }
        ;

ReadSq  : Read {} // no type for $$
        | ReadSq COMMA Read {}
        ;

Read    : IDENT { $$ = new Read($1); next = next.link($$); }
        | IDENT LPAREN Expr RPAREN { $$ = new ReadDim($1, $3); next = next.link($$); }
        | IDENT LPAREN Expr COMMA Expr RPAREN { $$ = new ReadDim2($1, $3, $5); next = next.link($$); }
        ;

InputSq : Input
        | InputSq COMMA Input
        ;

Input   : IDENT { $$ = new Input($1); next = next.link($$); }
        | IDENT LPAREN Expr RPAREN { $$ = new InputDim($1, $3); next = next.link($$); }
        | IDENT LPAREN Expr COMMA Expr RPAREN { $$ = new InputDim2($1, $3, $5); next = next.link($$); }
        ;

Expr    : NUMBER { $$ = new Constant(symtab.installConstant($1)); }
        | INTEGER { $$ = new Constant(symtab.installConstant($1)); }
        | IDENT { $$ = new Identifier($1); }
        | MATHFN Expr RPAREN { $$ = new MathFn($1, $2); }
        | FN IDENT LPAREN Expr RPAREN { $$ = new FnCall($2, $4); }
        | IDENT LPAREN Expr RPAREN { $$ = new Dim($1, $3); }
        | IDENT LPAREN Expr COMMA Expr RPAREN { $$ = new Dim2($1, $3, $5); }
        | Expr PLUS Expr { $$ = new Operation($1, Op.Add, $3); }
        | Expr MINUS Expr { $$ = new Operation($1, Op.Sub, $3); }
        | Expr TIMES Expr { $$ = new Operation($1, Op.Mul, $3); }
        | Expr DIVIDE Expr { $$ = new Operation($1, Op.Div, $3); }
        | Expr EXP Expr { $$ = new Operation($1, Op.Exp, $3); }
        | MINUS Expr %prec UMINUS { $$ = new Operation($2, Op.Neg); }
        | LPAREN Expr RPAREN { $$ = $2; }
        ;

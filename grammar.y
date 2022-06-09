%language "D"
%output "Parser.d"
%define api.parser.class {Parser}
%define parse.error custom
%start Stmts
%define api.value.type union
%parse-param { SymbolTable symtab }
%parse-param { Node next }

%token <ushort> LINENO
%token <int> KEYWORD IDENT STRING INTEGER RELOP DATASTRING
%token <double> NUMBER
%token <string> MATHFN
%nterm <Parser.Node> Stmt Print PrintSq PrintSt PrintEn PrintTa Read MatPr MatPrSq MatPrSt MatPrEn MatRead Input
%nterm <Parser.Expr> Expr
%nterm <int[]> IdSq GotoSq
%nterm <Parser.Expr[]> ExprSq
%nterm <Parser.StringExpr> StrExpr

// Keywords which are valid at the beginning of a line
%token LET READ DATA PRINT GO IF FOR NEXT END STOP DEF GOSUB RETURN DIM REM MAT RESTORE INPUT CHANGE RANDOM
// Other keywords
%token THEN TO STEP FN ZER CON IDN TRN INV DET NUM ON TAB RND
// Internal grammatical tokens
%token ASSIGN EQ NE LT LE GE GT LPAREN RPAREN DOLLAR COMMA SEMICOLON APOSTROPHE
// Other functionality
%token EOL WS BLANKLINE BADLINE

%left PLUS MINUS
%left TIMES DIVIDE
%right UMINUS
%right EXP

%code {
    import Node : Node, Line, Stop, Goto, GoSub, Return, Let, LetDim, LetDim2, Read, ReadDim, ReadDim2, Input, InputDim, InputDim2, If, For, Next, Restore, LetString, InputString, ReadString, LetDimString, ReadDimString, ChangeFromString, ChangeToString, OnGoto, IfString, Randomize;
    import Expr : Expr, Op, Constant, Identifier, Dim, Dim2, Operation, MathFn, FnCall, StringExpr, StringVariable, StringConstant, StringIndexed;
    import LexerImpl : LexerImpl;
    import SymbolTable : SymbolTable, Edition;
    import Print : Print, NewLine, Comma, SemiColon, String, PrintExpr, PrintString, PrintTab;
    import Mat : MatRead, MatRead2, MatPrint, MatFullPrint, MatAdd, MatSub, MatMul, MatZerCon, MatIdn, MatTrn, MatInv, MatScalar, MatZerConIdnDim, MatInput, MatReadString, MatFullPrintDimString;
}

%%

Stmts   : %empty
        | Stmts Stmt
        ;

Stmt    : LINENO { $$ = new Line($1); next = next.link($$); }
        // BASIC the First
        | STOP EOL { $$ = new Stop(); next = next.link($$); }
        | PRINT Print EOL { $$ = new Print($2); next = next.link($$); }
        | GO TO INTEGER EOL { symtab.registerFlow(cast(ushort)$3); $$ = new Goto(cast(ushort)$3); next = next.link($$); }
        | GOSUB INTEGER EOL { symtab.registerFlow(cast(ushort)$2); $$ = new GoSub(cast(ushort)$2); next = next.link($$); }
        | LET IDENT ASSIGN Expr EOL { $$ = new Let($2, $4); next = next.link($$); }
        | LET IDENT LPAREN Expr RPAREN ASSIGN Expr EOL { $$ = new LetDim($2, $4, $7); next = next.link($$); }
        | LET IDENT LPAREN Expr COMMA Expr RPAREN ASSIGN Expr EOL { $$ = new LetDim2($2, $4, $6, $9); next = next.link($$); }
        | IF Expr RELOP Expr THEN INTEGER EOL { $$ = new If($2, $3, $4, cast(ushort)$6); next = next.link($$); }
        | IF Expr ASSIGN Expr THEN INTEGER EOL { $$ = new If($2, TokenKind.EQ, $4, cast(ushort)$6); next = next.link($$); }
        | FOR IDENT ASSIGN Expr TO Expr STEP Expr EOL { $$ = new For($2, $4, $6, $8); next = next.link($$); }
        | FOR IDENT ASSIGN Expr TO Expr EOL { $$ = new For($2, $4, $6, new Constant(symtab.installConstant(1.0))); next = next.link($$); }
        | NEXT IDENT EOL { $$ = new Next($2); next = next.link($$); }
        | DATA DataSq EOL {}
        | READ ReadSq EOL {}
        | DIM DimSq EOL {}
        | DEF FN IDENT LPAREN IdSq RPAREN ASSIGN Expr EOL { foreach(id; $5) symtab.initializeId(id); symtab.addFunction($3, SymbolTable.Function($5, $8, -1, $5.length)); }
        | DEF FN IDENT ASSIGN Expr EOL { symtab.addFunction($3, SymbolTable.Function(new int[0], $5, -1, 0)); }
        | RETURN EOL { $$ = new Return(); next = next.link($$); }
        | REM EOL { }
        | END EOL { symtab.checkReferences(); return YYACCEPT; }
        // BASIC the Second (CardBasic)
        | MAT READ MatRdSq EOL {}
        | MAT PRINT MatPr EOL { $$ = new MatPrint($3); next = next.link($$); }
        | MAT IDENT ASSIGN IDENT PLUS IDENT EOL { symtab.initializeMat($2, true); symtab.initializeMat($4); symtab.initializeMat($6); $$ = new MatAdd($2, $4, $6); next = next.link($$); }
        | MAT IDENT ASSIGN IDENT MINUS IDENT EOL { symtab.initializeMat($2, true); symtab.initializeMat($4); symtab.initializeMat($6); $$ = new MatSub($2, $4, $6); next = next.link($$); }
        | MAT IDENT ASSIGN IDENT TIMES IDENT EOL { symtab.initializeMat($2, true); symtab.initializeMat($4); symtab.initializeMat($6); $$ = new MatMul($2, $4, $6); next = next.link($$); }
        | MAT IDENT ASSIGN ZER LPAREN Expr COMMA Expr RPAREN EOL { symtab.initializeMat($2, true); $$ = new MatZerCon($2, $6, $8); next = next.link($$); }
        | MAT IDENT ASSIGN CON LPAREN Expr COMMA Expr RPAREN EOL { symtab.initializeMat($2, true); $$ = new MatZerCon($2, $6, $8, true); next = next.link($$); }
        | MAT IDENT ASSIGN IDN LPAREN Expr RPAREN EOL { symtab.initializeMat($2, true); $$ = new MatIdn($2, $6); next = next.link($$); }
        | MAT IDENT ASSIGN TRN LPAREN IDENT RPAREN EOL { symtab.initializeMat($2, true); symtab.initializeMat($6); $$ = new MatTrn($2, $6); next = next.link($$); }
        | MAT IDENT ASSIGN INV LPAREN IDENT RPAREN EOL { symtab.initializeMat($2, true); symtab.initializeMat($6); if (symtab.edition >= Edition.Fourth) symtab.initializeId(symtab.installId("DET")); $$ = new MatInv($2, $6); next = next.link($$); }
        | MAT IDENT ASSIGN LPAREN Expr RPAREN TIMES IDENT EOL { symtab.initializeMat($2, true); symtab.initializeMat($8); $$ = new MatScalar($2, $8, $5); next = next.link($$); }
        // BASIC the Third
        | MAT IDENT ASSIGN ZER EOL { symtab.initializeMat($2, true); $$ = new MatZerConIdnDim($2, 0); next = next.link($$); }
        | MAT IDENT ASSIGN CON EOL { symtab.initializeMat($2, true); $$ = new MatZerConIdnDim($2, 1); next = next.link($$); }
        | MAT IDENT ASSIGN IDN EOL { symtab.initializeMat($2, true); $$ = new MatZerConIdnDim($2, 2); next = next.link($$); }
        | MAT INPUT IDENT EOL { symtab.initializeDim($3); symtab.initializeId(symtab.installId("NUM")); $$ = new MatInput($3); next = next.link($$); }
        | RESTORE EOL { $$ = new Restore(); next = next.link($$); }
        | INPUT InputSq EOL {}
        // BASIC the Fourth
        | LET IDENT DOLLAR ASSIGN StrExpr EOL { $$ = new LetString($2, $5); next = next.link($$); }
        | LET IDENT DOLLAR LPAREN Expr RPAREN ASSIGN StrExpr EOL { $$ = new LetDimString($2, $5, $8); next = next.link($$); }
        | IF StrExpr RELOP StrExpr THEN INTEGER EOL { $$ = new IfString($2, $3, $4, cast(ushort)$6); next = next.link($$); }
        | IF StrExpr ASSIGN StrExpr THEN INTEGER EOL { $$ = new IfString($2, TokenKind.EQ, $4, cast(ushort)$6); next = next.link($$); }
        | ON Expr GotoThen GotoSq EOL { $$ = new OnGoto($2, $4); next = next.link($$); }
        | CHANGE IDENT DOLLAR TO IDENT EOL { $$ = new ChangeFromString($2, $5); next = next.link($$); }
        | CHANGE IDENT TO IDENT DOLLAR EOL { $$ = new ChangeToString($2, $4); next = next.link($$); }
        | RANDOM EOL { $$ = new Randomize(); next = next.link($$); }
        | RESTORE TIMES EOL { $$ = new Restore(true, false); next = next.link($$); }
        | RESTORE DOLLAR EOL { $$ = new Restore(false, true); next = next.link($$); }
        | DEF FN IDENT LPAREN IdSq RPAREN EOL { foreach(id; $5) symtab.initializeId(id); symtab.addFunction($3, SymbolTable.Function($5, null, symtab.line, $5.length)); symtab.registerFlow(symtab.line); }
        | DEF FN IDENT EOL { symtab.addFunction($3, SymbolTable.Function(new int[0], null, symtab.line, 0)); symtab.registerFlow(symtab.line); }
        | LET FN IDENT ASSIGN Expr EOL { $$ = new Let(symtab.installId("FN" ~ symtab.getId($3)), $5); next = next.link($$); }
        | FN END EOL { $$ = new Return(); next = next.link($$); }
        ;

Print   : %empty { $$ = new NewLine(); }
        | PrintEn { $$ = $1; }
        | PrintSq PrintEn { $$ = $1; $$.linkLast($2); }
        ;

PrintSq : PrintSt { $$ = $1; }
        | PrintSq PrintSt { $$.linkLast($2); }
        ;

PrintSt : Expr PrintTa { $$ = new PrintExpr($1); $$.linkLast($2); }
        | STRING Expr PrintTa { $$ = new String($1); $$.linkLast(new PrintExpr($2)); $$.linkLast($3); }
        | StrExpr SEMICOLON { $$ = new PrintString($1); }
        | StrExpr COMMA { $$ = new PrintString($1); $$.linkLast(new Comma()); }
        | TAB LPAREN Expr RPAREN SEMICOLON { $$ = new PrintTab($3); }
        ;

PrintEn : Expr { $$ = new PrintExpr($1); $$.linkLast(new NewLine()); }
        | STRING Expr { $$ = new String($1); $$.linkLast(new PrintExpr($2)); $$.linkLast(new NewLine()); }
        | StrExpr { $$ = new PrintString($1); $$.linkLast(new NewLine()); }
        | PrintSt { $$ = $1; }
        ;

PrintTa : COMMA { $$ = new Comma(); }
        | SEMICOLON { $$ = new SemiColon(); }
        ;

DataSq  : Data {} // no type for $$
        | DataSq COMMA Data {}
        ;

Data    : INTEGER { symtab.installData(cast(double)$1); } // no type for $$
        | NUMBER { symtab.installData($1); }
        | MINUS INTEGER { symtab.installData(cast(double)-$2); }
        | MINUS NUMBER { symtab.installData(-$2); }
        | STRING { symtab.installData($1); }
        | DATASTRING { symtab.installData($1); }
        ;

ReadSq  : Read {} // no type for $$
        | ReadSq COMMA Read {}
        ;

Read    : IDENT { $$ = new Read($1); next = next.link($$); }
        | IDENT LPAREN Expr RPAREN { $$ = new ReadDim($1, $3); next = next.link($$); }
        | IDENT LPAREN Expr COMMA Expr RPAREN { $$ = new ReadDim2($1, $3, $5); next = next.link($$); }
        | IDENT DOLLAR { $$ = new ReadString($1); next = next.link($$); }
        | IDENT DOLLAR LPAREN Expr RPAREN { $$ = new ReadDimString($1, $4); next = next.link($$); }
        ;

DimSq   : Dim {} // no type for $$
        | DimSq COMMA Dim {}
        ;

Dim     : IDENT LPAREN INTEGER RPAREN { symtab.initializeDim($1, true, cast(ushort)$3); }
        | IDENT LPAREN INTEGER COMMA INTEGER RPAREN { symtab.initializeDim2($1, true, cast(ushort)$3, cast(ushort)$5); }
        | IDENT DOLLAR LPAREN INTEGER RPAREN { symtab.initializeDimString($1, true, cast(ushort)$4); }
        ;

IdSq    : IDENT { int[] i; $$ = i; $$ ~= $1; }
        | IdSq COMMA IDENT { $$ ~= $3; }
        ;

ExprSq  : Expr { Expr[] e; $$ = e; $$ ~= $1; }
        | ExprSq COMMA Expr { $$ ~= $3; }
        ;

MatPr   : MatPrEn { $$ = $1; }
        | MatPrSq MatPrEn { $$ = $1; $$.linkLast($2); }
        ;

MatPrSq : MatPrSt { $$ = $1; }
        | MatPrSq MatPrSt { $$.linkLast($2); }
        ;

MatPrSt : IDENT COMMA { symtab.initializeMat($1); $$ = new MatFullPrint($1); }
        | IDENT SEMICOLON { symtab.initializeMat($1); $$ = new MatFullPrint($1, true); }
        ;

MatPrEn : IDENT { symtab.initializeMat($1); $$ = new MatFullPrint($1); }
        | IDENT SEMICOLON { symtab.initializeMat($1); $$ = new MatFullPrint($1, true); }
        | IDENT DOLLAR { $$ = new MatFullPrintDimString($1); }
        | IDENT DOLLAR SEMICOLON { $$ = new MatFullPrintDimString($1, true); }
        ;

MatRdSq : MatRead {} // no type for $$
        | MatRdSq COMMA MatRead {}
        ;

MatRead : IDENT LPAREN Expr RPAREN { $$ = new MatRead($1, $3); next = next.link($$); }
        | IDENT LPAREN Expr COMMA Expr RPAREN { $$ = new MatRead2($1, $3, $5); next = next.link($$); }
        | IDENT DOLLAR LPAREN Expr RPAREN { $$ = new MatReadString($1, $4); next = next.link($$); }
        ;

InputSq : Input {}
        | InputSq COMMA Input {}
        ;

Input   : IDENT { $$ = new Input($1); next = next.link($$); }
        | IDENT LPAREN Expr RPAREN { $$ = new InputDim($1, $3); next = next.link($$); }
        | IDENT LPAREN Expr COMMA Expr RPAREN { $$ = new InputDim2($1, $3, $5); next = next.link($$); }
        | IDENT DOLLAR { $$ = new InputString($1); next = next.link($$); }
        ;

Expr    : NUMBER { $$ = new Constant(symtab.installConstant($1)); }
        | INTEGER { $$ = new Constant(symtab.installConstant($1)); }
        | IDENT { $$ = new Identifier($1); }
        | MATHFN Expr RPAREN { $$ = new MathFn($1, $2); }
        | FN IDENT LPAREN ExprSq RPAREN { $$ = new FnCall($2, $4); }
        | FN IDENT { $$ = (symtab.edition >= Edition.Fourth) ? new Identifier(symtab.installId("FN" ~ symtab.getId($2))) : new FnCall($2, new Expr[0]); }
        | IDENT LPAREN Expr RPAREN { $$ = new Dim($1, $3); }
        | IDENT LPAREN Expr COMMA Expr RPAREN { $$ = new Dim2($1, $3, $5); }
        | Expr PLUS Expr { $$ = new Operation($1, Op.Add, $3); }
        | Expr MINUS Expr { $$ = new Operation($1, Op.Sub, $3); }
        | Expr TIMES Expr { $$ = new Operation($1, Op.Mul, $3); }
        | Expr DIVIDE Expr { $$ = new Operation($1, Op.Div, $3); }
        | Expr EXP Expr { $$ = new Operation($1, Op.Exp, $3); }
        | MINUS Expr %prec UMINUS { $$ = new Operation($2, Op.Neg); }
        | LPAREN Expr RPAREN { $$ = $2; }
        | DET { $$ = new Identifier(symtab.installId("DET")); }
        | NUM { $$ = new Identifier(symtab.installId("NUM")); }
        | RND { $$ = new MathFn("RND", null); }
        ;

StrExpr : IDENT DOLLAR { $$ = new StringVariable($1); }
        | IDENT DOLLAR LPAREN Expr RPAREN { $$ = new StringIndexed($1, $4); }
        | STRING { $$ = new StringConstant($1); }
        ;

GotoThen: GO TO {}
        | THEN {}
        ;

GotoSq  : INTEGER { int[] l; $$ = l; $$ ~= $1; symtab.registerFlow(cast(ushort)$1); }
        | GotoSq COMMA INTEGER { $$ ~= $3; symtab.registerFlow(cast(ushort)$3); }
        ;

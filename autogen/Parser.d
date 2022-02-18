/* A Bison parser, made by GNU Bison 3.8.2.2-4fe5-dirty.  */

/* Skeleton implementation for Bison LALR(1) parsers in D

   Copyright (C) 2007-2012, 2019-2021 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */


version(D_Version2) {
} else {
  static assert(false, "need compiler for D Version 2");
}




import std.format;
import std.conv;

/**
 * Handle error message internationalisation.
 */
static if (!is(typeof(YY_))) {
  version(YYENABLE_NLS)
  {
    version(ENABLE_NLS)
    {
      extern(C) char* dgettext(const char*, const char*);
      string YY_(const char* s)
      {
        return to!string(dgettext("bison-runtime", s));
      }
    }
  }
  static if (!is(typeof(YY_)))
  {
    pragma(inline, true)
    string YY_(string msg) { return msg; }
  }
}

/**
 * A Bison parser, automatically generated from <tt>grammar.y</tt>.
 *
 * @author LALR (1) parser skeleton written by Paolo Bonzini.
 * Port to D language was done by Oliver Mangold.
 */

/**
 * Communication interface between the scanner and the Bison-generated
 * parser <tt>Parser</tt>.
 */
public interface Lexer
{
  /**
   * Entry point for the scanner.  Returns the token identifier corresponding
   * to the next token and prepares to return the semantic value
   * of the token.
   * @return the token identifier corresponding to the next token. */
  Symbol yylex ();

  /**
   * Entry point for error reporting.  Emits an error
   * in a user-defined way.
   *
   * @param s The string for the error message.  */
   void yyerror (string s);

  /**
   * Build and emit a "syntax error" message in a user-defined way.
   *
   * @param ctx  The context of the error.
   */
  void reportSyntaxError(Parser.Context ctx);

}


alias Symbol = Parser.Symbol;
alias Value = YYSemanticType;


private union YYSemanticType
{
  Parser.Expr Expr;                        /* Expr  */
  Parser.Node Stmt;                        /* Stmt  */
  Parser.Node Lineno;                      /* Lineno  */
  Parser.Node PrintSq;                     /* PrintSq  */
  Parser.Node Print;                       /* Print  */
  Parser.Node Tab;                         /* Tab  */
  Parser.Node ReadSq;                      /* ReadSq  */
  Parser.Node InputSq;                     /* InputSq  */
  double NUMBER;                           /* NUMBER  */
  int IDENT;                               /* IDENT  */
  int STRING;                              /* STRING  */
  int INTEGER;                             /* INTEGER  */
  int RELOP;                               /* RELOP  */
  string MATHFN;                           /* MATHFN  */
  ushort LINENO;                           /* LINENO  */

#line 131 "Parser.d"

};
/* Token kinds.  */
public enum TokenKind {
  YYEMPTY = -2,
  YYEOF = 0,
  YYerror = 1,
  YYUNDEF = 2,
  LINENO = 3,
  IDENT = 4,
  STRING = 5,
  INTEGER = 6,
  RELOP = 7,
  NUMBER = 8,
  MATHFN = 9,
  LET = 10,
  READ = 11,
  DATA = 12,
  PRINT = 13,
  GOTO = 14,
  IF = 15,
  FOR = 16,
  NEXT = 17,
  END = 18,
  STOP = 19,
  DEF = 20,
  GOSUB = 21,
  RETURN = 22,
  DIM = 23,
  REM = 24,
  INPUT = 25,
  THEN = 26,
  TO = 27,
  STEP = 28,
  FN = 29,
  EQ = 30,
  NE = 31,
  LT = 32,
  LE = 33,
  GE = 34,
  GT = 35,
  LPAREN = 36,
  RPAREN = 37,
  DOLLAR = 38,
  COMMA = 39,
  SEMICOLON = 40,
  EOL = 41,
  WS = 42,
  BLANKLINE = 43,
  BADLINE = 44,
  PLUS = 45,
  MINUS = 46,
  TIMES = 47,
  DIVIDE = 48,
  UMINUS = 49,
  EXP = 50,
}

class Parser
{
  /** Version number for the Bison executable that generated this parser.  */
  public static immutable string yy_bison_version = "3.8.2.2-4fe5-dirty";

  /** Name of the skeleton that generated this parser.  */
  public static immutable string yy_bison_skeleton = "lalr1.d";


  /* Symbol kinds.  */
  struct SymbolKind
  {
    enum
    {
    YYEMPTY = -2,  /* No symbol.  */
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 1,                   /* error  */
    YYUNDEF = 2,                   /* "invalid token"  */
    LINENO = 3,                    /* LINENO  */
    IDENT = 4,                     /* IDENT  */
    STRING = 5,                    /* STRING  */
    INTEGER = 6,                   /* INTEGER  */
    RELOP = 7,                     /* RELOP  */
    NUMBER = 8,                    /* NUMBER  */
    MATHFN = 9,                    /* MATHFN  */
    LET = 10,                      /* LET  */
    READ = 11,                     /* READ  */
    DATA = 12,                     /* DATA  */
    PRINT = 13,                    /* PRINT  */
    GOTO = 14,                     /* GOTO  */
    IF = 15,                       /* IF  */
    FOR = 16,                      /* FOR  */
    NEXT = 17,                     /* NEXT  */
    END = 18,                      /* END  */
    STOP = 19,                     /* STOP  */
    DEF = 20,                      /* DEF  */
    GOSUB = 21,                    /* GOSUB  */
    RETURN = 22,                   /* RETURN  */
    DIM = 23,                      /* DIM  */
    REM = 24,                      /* REM  */
    INPUT = 25,                    /* INPUT  */
    THEN = 26,                     /* THEN  */
    TO = 27,                       /* TO  */
    STEP = 28,                     /* STEP  */
    FN = 29,                       /* FN  */
    EQ = 30,                       /* EQ  */
    NE = 31,                       /* NE  */
    LT = 32,                       /* LT  */
    LE = 33,                       /* LE  */
    GE = 34,                       /* GE  */
    GT = 35,                       /* GT  */
    LPAREN = 36,                   /* LPAREN  */
    RPAREN = 37,                   /* RPAREN  */
    DOLLAR = 38,                   /* DOLLAR  */
    COMMA = 39,                    /* COMMA  */
    SEMICOLON = 40,                /* SEMICOLON  */
    EOL = 41,                      /* EOL  */
    WS = 42,                       /* WS  */
    BLANKLINE = 43,                /* BLANKLINE  */
    BADLINE = 44,                  /* BADLINE  */
    PLUS = 45,                     /* PLUS  */
    MINUS = 46,                    /* MINUS  */
    TIMES = 47,                    /* TIMES  */
    DIVIDE = 48,                   /* DIVIDE  */
    UMINUS = 49,                   /* UMINUS  */
    EXP = 50,                      /* EXP  */
    YYACCEPT = 51,                 /* $accept  */
    Stmts = 52,                    /* Stmts  */
    Stmt = 53,                     /* Stmt  */
    Lineno = 54,                   /* Lineno  */
    PrintSq = 55,                  /* PrintSq  */
    Print = 56,                    /* Print  */
    Tab = 57,                      /* Tab  */
    DataSq = 58,                   /* DataSq  */
    Data = 59,                     /* Data  */
    ReadSq = 60,                   /* ReadSq  */
    InputSq = 61,                  /* InputSq  */
    Expr = 62,                     /* Expr  */
    }

    private int yycode_;
    alias yycode_ this;

    this(int code)
    {
      yycode_ = code;
    }

    /* Return YYSTR after stripping away unnecessary quotes and
     backslashes, so that it's suitable for yyerror.  The heuristic is
     that double-quoting is unnecessary unless the string contains an
     apostrophe, a comma, or backslash (other than backslash-backslash).
     YYSTR is taken from yytname.  */
    final void toString(void delegate(const(char)[]) sink) const
    {
      immutable string[] yy_sname = [
  "end of file", "error", "invalid token", "LINENO", "IDENT", "STRING",
  "INTEGER", "RELOP", "NUMBER", "MATHFN", "LET", "READ", "DATA", "PRINT",
  "GOTO", "IF", "FOR", "NEXT", "END", "STOP", "DEF", "GOSUB", "RETURN",
  "DIM", "REM", "INPUT", "THEN", "TO", "STEP", "FN", "EQ", "NE", "LT",
  "LE", "GE", "GT", "LPAREN", "RPAREN", "DOLLAR", "COMMA", "SEMICOLON",
  "EOL", "WS", "BLANKLINE", "BADLINE", "PLUS", "MINUS", "TIMES", "DIVIDE",
  "UMINUS", "EXP", "$accept", "Stmts", "Stmt", "Lineno", "PrintSq",
  "Print", "Tab", "DataSq", "Data", "ReadSq", "InputSq", "Expr", null
      ];

      sink.formattedWrite!"%s"(yy_sname[yycode_]);
    }
  }





  /** The object doing lexical analysis for us.  */
  private Lexer yylexer;


    /* User arguments.  */
    protected SymbolTable symtab;
    protected Node next;



  /**
   * Instantiate the Bison-generated parser.
   * @param yylexer The scanner that will supply tokens to the parser.
   */
  public this (Lexer yylexer, SymbolTable symtab,Node next) {
    this.yylexer = yylexer;
this.symtab = symtab;
          this.next = next;
          
  }

  private final Parser.Symbol yylex () {
    return yylexer.yylex ();
  }

  protected final void yyerror (string s) {
    yylexer.yyerror (s);
  }

  /**
   * The number of syntax errors so far.
   */
  public int numberOfErrors() const { return yynerrs_; }
  private int yynerrs_ = 0;

  /**
   * Returned by a Bison action in order to stop the parsing process and
   * return success (<tt>true</tt>).  */
  public static immutable int YYACCEPT = 0;

  /**
   * Returned by a Bison action in order to stop the parsing process and
   * return failure (<tt>false</tt>).  */
  public static immutable int YYABORT = 1;


  /**
   * Returned by a Bison action in order to start error recovery without
   * printing an error message.  */
  public static immutable int YYERROR = 2;

  // Internal return codes that are not supported for user semantic
  // actions.
  private static immutable int YYERRLAB = 3;
  private static immutable int YYNEWSTATE = 4;
  private static immutable int YYDEFAULT = 5;
  private static immutable int YYREDUCE = 6;
  private static immutable int YYERRLAB1 = 7;
  private static immutable int YYRETURN = 8;



  private int yyerrstatus_ = 0;

  private void yyerrok()
  {
    yyerrstatus_ = 0;
  }

  // Lookahead symbol kind.
  SymbolKind yytoken = SymbolKind.YYEMPTY;

  /* State.  */
  int yyn = 0;
  int yylen = 0;
  int yystate = 0;

  YYStack yystack;

  int label = YYNEWSTATE;

  /* Error handling.  */


  /// Semantic value of the lookahead.
  Value yylval;

  /**
   * Whether error recovery is being done.  In this state, the parser
   * reads token until it reaches a known state, and then restarts normal
   * operation.  */
  public final bool recovering ()
  {
    return yyerrstatus_ == 0;
  }

  /** Compute post-reduction state.
   * @param yystate   the current state
   * @param yysym     the nonterminal to push on the stack
   */
  private int yyLRGotoState(int yystate, int yysym) {
    int yyr = yypgoto_[yysym - yyntokens_] + yystate;
    if (0 <= yyr && yyr <= yylast_ && yycheck_[yyr] == yystate)
      return yytable_[yyr];
    else
      return yydefgoto_[yysym - yyntokens_];
  }

  private int yyaction (int yyn, ref YYStack yystack, int yylen)
  {
    Value yyval;

    /* If YYLEN is nonzero, implement the default value of the action:
       `$$ = $1'.  Otherwise, use the top of the stack.

       Otherwise, the following line sets YYVAL to garbage.
       This behavior is undocumented and Bison
       users should not rely upon it.  */
    if (yylen > 0)
      yyval = yystack.valueAt (yylen - 1);
    else
      yyval = yystack.valueAt (0);



    switch (yyn)
    {
    case 4: /* Stmt: Lineno  */
#line 46 "grammar.y"
                 { next = next.link((yyval.Stmt)); }
      break;

    case 5: /* Stmt: STOP EOL  */
#line 47 "grammar.y"
                   { (yyval.Stmt) = new Stop(); next = next.link((yyval.Stmt)); }
      break;

    case 6: /* Stmt: PRINT PrintSq EOL  */
#line 48 "grammar.y"
                            { ((yystack.valueAt (1)).PrintSq).linkLast(new NewLine()); (yyval.Stmt) = new Printable(((yystack.valueAt (1)).PrintSq)); next = next.link((yyval.Stmt)); }
      break;

    case 7: /* Stmt: GOTO INTEGER EOL  */
#line 49 "grammar.y"
                           { symtab.registerFlow(cast(ushort)((yystack.valueAt (1)).INTEGER)); (yyval.Stmt) = new Goto(cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 8: /* Stmt: GOSUB INTEGER EOL  */
#line 50 "grammar.y"
                            { symtab.registerFlow(cast(ushort)((yystack.valueAt (1)).INTEGER)); (yyval.Stmt) = new GoSub(cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 9: /* Stmt: LET IDENT RELOP Expr EOL  */
#line 51 "grammar.y"
                                   { assert(((yystack.valueAt (2)).RELOP) == TokenKind.EQ); (yyval.Stmt) = new Let(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 10: /* Stmt: LET IDENT LPAREN Expr RPAREN RELOP Expr EOL  */
#line 52 "grammar.y"
                                                      { assert(((yystack.valueAt (2)).RELOP) == TokenKind.EQ); (yyval.Stmt) = new LetDim(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 11: /* Stmt: IF Expr RELOP Expr THEN INTEGER EOL  */
#line 53 "grammar.y"
                                              { (yyval.Stmt) = new If(((yystack.valueAt (5)).Expr), ((yystack.valueAt (4)).RELOP), ((yystack.valueAt (3)).Expr), cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 12: /* Stmt: FOR IDENT RELOP Expr TO Expr STEP Expr EOL  */
#line 54 "grammar.y"
                                                     { assert(((yystack.valueAt (6)).RELOP) == TokenKind.EQ); (yyval.Stmt) = new For(((yystack.valueAt (7)).IDENT), ((yystack.valueAt (5)).Expr), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 13: /* Stmt: FOR IDENT RELOP Expr TO Expr EOL  */
#line 55 "grammar.y"
                                           { assert(((yystack.valueAt (4)).RELOP) == TokenKind.EQ); (yyval.Stmt) = new For(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr), new Constant(symtab.installConstant(1.0))); next = next.link((yyval.Stmt)); }
      break;

    case 14: /* Stmt: NEXT IDENT EOL  */
#line 56 "grammar.y"
                         { (yyval.Stmt) = new Next(((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 15: /* Stmt: DATA DataSq EOL  */
#line 57 "grammar.y"
                          {}
      break;

    case 16: /* Stmt: READ ReadSq EOL  */
#line 58 "grammar.y"
                          {}
      break;

    case 17: /* Stmt: INPUT InputSq EOL  */
#line 59 "grammar.y"
                            {}
      break;

    case 18: /* Stmt: DIM IDENT LPAREN INTEGER RPAREN EOL  */
#line 60 "grammar.y"
                                              { symtab.initializeDIM(((yystack.valueAt (4)).IDENT), true, cast(ushort)((yystack.valueAt (2)).INTEGER)); }
      break;

    case 19: /* Stmt: DEF FN IDENT LPAREN IDENT RPAREN RELOP Expr EOL  */
#line 61 "grammar.y"
                                                          { assert(((yystack.valueAt (2)).RELOP) == TokenKind.EQ); symtab.initializeID(((yystack.valueAt (4)).IDENT)); symtab.addFunction(((yystack.valueAt (6)).IDENT), SymbolTable.SymbolTable.Function(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (1)).Expr))); }
      break;

    case 20: /* Stmt: RETURN EOL  */
#line 62 "grammar.y"
                     { (yyval.Stmt) = new Return(); next = next.link((yyval.Stmt)); }
      break;

    case 21: /* Stmt: REM EOL  */
#line 63 "grammar.y"
                  { }
      break;

    case 22: /* Stmt: END EOL  */
#line 64 "grammar.y"
                  { symtab.endOfProgram(); }
      break;

    case 23: /* Lineno: LINENO  */
#line 67 "grammar.y"
                 { if (symtab.end) yyerror("STATEMENTS AFTER END"); (yyval.Lineno) = new Line(((yystack.valueAt (0)).LINENO)); }
      break;

    case 24: /* PrintSq: %empty  */
#line 70 "grammar.y"
                 { (yyval.PrintSq) = new Node(); }
      break;

    case 25: /* PrintSq: Print  */
#line 71 "grammar.y"
                { (yyval.PrintSq) = ((yystack.valueAt (0)).Print); }
      break;

    case 26: /* PrintSq: PrintSq Tab  */
#line 72 "grammar.y"
                      { (yyval.PrintSq).linkLast(((yystack.valueAt (0)).Tab)); }
      break;

    case 27: /* PrintSq: PrintSq Tab Print  */
#line 73 "grammar.y"
                            { (yyval.PrintSq).linkLast(((yystack.valueAt (1)).Tab)); (yyval.PrintSq).linkLast(((yystack.valueAt (0)).Print)); }
      break;

    case 28: /* Print: STRING  */
#line 76 "grammar.y"
                 { (yyval.Print) = new String(((yystack.valueAt (0)).STRING)); }
      break;

    case 29: /* Print: Expr  */
#line 77 "grammar.y"
               { (yyval.Print) = new PrintExpr(((yystack.valueAt (0)).Expr)); }
      break;

    case 30: /* Print: STRING Expr  */
#line 78 "grammar.y"
                      { (yyval.Print) = new String(((yystack.valueAt (1)).STRING)); (yyval.Print).linkLast(new PrintExpr(((yystack.valueAt (0)).Expr))); }
      break;

    case 31: /* Tab: COMMA  */
#line 81 "grammar.y"
                { (yyval.Tab) = new Comma(); }
      break;

    case 32: /* Tab: SEMICOLON  */
#line 82 "grammar.y"
                    { (yyval.Tab) = new SemiColon(); }
      break;

    case 33: /* DataSq: Data  */
#line 85 "grammar.y"
               {}
      break;

    case 34: /* DataSq: DataSq COMMA Data  */
#line 86 "grammar.y"
                            {}
      break;

    case 35: /* Data: INTEGER  */
#line 89 "grammar.y"
                  { symtab.installData(((yystack.valueAt (0)).INTEGER)); }
      break;

    case 36: /* Data: NUMBER  */
#line 90 "grammar.y"
                 { symtab.installData(((yystack.valueAt (0)).NUMBER)); }
      break;

    case 37: /* Data: MINUS INTEGER  */
#line 91 "grammar.y"
                        { symtab.installData(-((yystack.valueAt (0)).INTEGER)); }
      break;

    case 38: /* Data: MINUS NUMBER  */
#line 92 "grammar.y"
                       { symtab.installData(-((yystack.valueAt (0)).NUMBER)); }
      break;

    case 39: /* ReadSq: IDENT  */
#line 96 "grammar.y"
                { (yyval.ReadSq) = new Read(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.ReadSq)); }
      break;

    case 40: /* ReadSq: ReadSq COMMA IDENT  */
#line 97 "grammar.y"
                             { (yyval.ReadSq) = new Read(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.ReadSq)); }
      break;

    case 41: /* InputSq: IDENT  */
#line 100 "grammar.y"
                { (yyval.InputSq) = new Input(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.InputSq)); }
      break;

    case 42: /* InputSq: InputSq COMMA IDENT  */
#line 101 "grammar.y"
                              { (yyval.InputSq) = new Input(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.InputSq)); }
      break;

    case 43: /* Expr: NUMBER  */
#line 104 "grammar.y"
                 { (yyval.Expr) = new Constant(symtab.installConstant(((yystack.valueAt (0)).NUMBER))); }
      break;

    case 44: /* Expr: INTEGER  */
#line 105 "grammar.y"
                  { (yyval.Expr) = new Constant(symtab.installConstant(((yystack.valueAt (0)).INTEGER))); }
      break;

    case 45: /* Expr: IDENT  */
#line 106 "grammar.y"
                { (yyval.Expr) = new Identifier(((yystack.valueAt (0)).IDENT)); }
      break;

    case 46: /* Expr: MATHFN Expr RPAREN  */
#line 107 "grammar.y"
                             { (yyval.Expr) = new MathFn(((yystack.valueAt (2)).MATHFN), ((yystack.valueAt (1)).Expr)); }
      break;

    case 47: /* Expr: FN IDENT LPAREN Expr RPAREN  */
#line 108 "grammar.y"
                                      { (yyval.Expr) = new FunctionCall(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); }
      break;

    case 48: /* Expr: IDENT LPAREN Expr RPAREN  */
#line 109 "grammar.y"
                                   { (yyval.Expr) = new Array(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); }
      break;

    case 49: /* Expr: Expr PLUS Expr  */
#line 110 "grammar.y"
                         { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Add, ((yystack.valueAt (0)).Expr)); }
      break;

    case 50: /* Expr: Expr MINUS Expr  */
#line 111 "grammar.y"
                          { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Sub, ((yystack.valueAt (0)).Expr)); }
      break;

    case 51: /* Expr: Expr TIMES Expr  */
#line 112 "grammar.y"
                          { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Mul, ((yystack.valueAt (0)).Expr)); }
      break;

    case 52: /* Expr: Expr DIVIDE Expr  */
#line 113 "grammar.y"
                           { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Div, ((yystack.valueAt (0)).Expr)); }
      break;

    case 53: /* Expr: Expr EXP Expr  */
#line 114 "grammar.y"
                        { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Exp, ((yystack.valueAt (0)).Expr)); }
      break;

    case 54: /* Expr: MINUS Expr  */
#line 115 "grammar.y"
                                  { (yyval.Expr) = new Operation(((yystack.valueAt (0)).Expr), Op.Neg); }
      break;

    case 55: /* Expr: LPAREN Expr RPAREN  */
#line 116 "grammar.y"
                             { (yyval.Expr) = ((yystack.valueAt (1)).Expr); }
      break;


#line 692 "Parser.d"

      default: break;
    }



    yystack.pop (yylen);
    yylen = 0;

    /* Shift the result of the reduction.  */
    int yystate = yyLRGotoState(yystack.stateAt(0), yyr1_[yyn]);
    yystack.push (yystate, yyval);
    return YYNEWSTATE;
  }



  /**
    * A complete symbol
    */
  struct Symbol
  {
    private SymbolKind kind;
    private Value value_;

    this(TokenKind token)
    {
      kind = yytranslate_(token);
    }
    this(TokenKind token, double val)
    {
      kind = yytranslate_(token);
      static foreach (member; __traits(allMembers, YYSemanticType))
      {
        static if (is(typeof(mixin("value_." ~ member)) == double))
        {
          mixin("value_." ~ member ~ " = val;");
        }
      }
    }
    this(TokenKind token, int val)
    {
      kind = yytranslate_(token);
      static foreach (member; __traits(allMembers, YYSemanticType))
      {
        static if (is(typeof(mixin("value_." ~ member)) == int))
        {
          mixin("value_." ~ member ~ " = val;");
        }
      }
    }
    this(TokenKind token, string val)
    {
      kind = yytranslate_(token);
      static foreach (member; __traits(allMembers, YYSemanticType))
      {
        static if (is(typeof(mixin("value_." ~ member)) == string))
        {
          mixin("value_." ~ member ~ " = val;");
        }
      }
    }
    this(TokenKind token, ushort val)
    {
      kind = yytranslate_(token);
      static foreach (member; __traits(allMembers, YYSemanticType))
      {
        static if (is(typeof(mixin("value_." ~ member)) == ushort))
        {
          mixin("value_." ~ member ~ " = val;");
        }
      }
    }

    SymbolKind token() { return kind; }
    Value value() { return value_; }

  }


  /**
   * Parse input from the scanner that was specified at object construction
   * time.  Return whether the end of the input was reached successfully.
   *
   * @return <tt>true</tt> if the parsing succeeds.  Note that this does not
   *          imply that there were no syntax errors.
   */
  public bool parse()
  {  bool yyresult;
    yyerrstatus_ = 0;


    /* Initialize the stack.  */
    yystack.push (yystate, yylval);

    label = YYNEWSTATE;
    for (;;)
      final switch (label)
      {
        /* New state.  Unlike in the C/C++ skeletons, the state is already
           pushed when we come here.  */
      case YYNEWSTATE:

        /* Accept?  */
        if (yystate == yyfinal_)
          return true;

        /* Take a decision.  First try without lookahead.  */
        yyn = yypact_[yystate];
        if (yyPactValueIsDefault(yyn))
        {
          label = YYDEFAULT;
          break;
        }

        /* Read a lookahead token.  */
        if (yytoken == SymbolKind.YYEMPTY)
        {
          Symbol yysymbol = yylex();
          yytoken = yysymbol.token();
          yylval = yysymbol.value();
        }

        /* Token already converted to internal form.  */

        if (yytoken == SymbolKind.YYerror)
        {
          // The scanner already issued an error message, process directly
          // to error recovery.  But do not keep the error token as
          // lookahead, it is too special and may lead us to an endless
          // loop in error recovery. */
          yytoken = SymbolKind.YYUNDEF;
          label = YYERRLAB1;
        }
        else
        {
          /* If the proper action on seeing token YYTOKEN is to reduce or to
             detect an error, take that action.  */
          yyn += yytoken;
          if (yyn < 0 || yylast_ < yyn || yycheck_[yyn] != yytoken) {
              label = YYDEFAULT;
          }
          /* <= 0 means reduce or error.  */
          else if ((yyn = yytable_[yyn]) <= 0)
          {
            if (yyTableValueIsError(yyn))
              label = YYERRLAB;
            else
            {
              yyn = -yyn;
              label = YYREDUCE;
            }
          }
          else
          {
            /* Shift the lookahead token.  */

            /* Discard the token being shifted.  */
            yytoken = SymbolKind.YYEMPTY;

            /* Count tokens shifted since error; after three, turn off error
             * status.  */
            if (yyerrstatus_ > 0)
              --yyerrstatus_;

            yystate = yyn;
            yystack.push (yystate, yylval);
            label = YYNEWSTATE;
          }
        }
        break;

      /*-----------------------------------------------------------.
      | yydefault -- do the default action for the current state.  |
      `-----------------------------------------------------------*/
      case YYDEFAULT:
        yyn = yydefact_[yystate];
        if (yyn == 0)
          label = YYERRLAB;
        else
          label = YYREDUCE;
        break;

      /*-----------------------------.
      | yyreduce -- Do a reduction.  |
      `-----------------------------*/
      case YYREDUCE:
        yylen = yyr2_[yyn];
        label = yyaction (yyn, yystack, yylen);
        yystate = yystack.stateAt (0);
        break;

      /*--------------------------------------.
      | yyerrlab -- here on detecting error.  |
      `--------------------------------------*/
      case YYERRLAB:
        /* If not already recovering from an error, report this error.  */
        if (yyerrstatus_ == 0)
        {
          ++yynerrs_;
          yyreportSyntaxError(new Context(yystack, yytoken));
        }

        if (yyerrstatus_ == 3)
        {
          /* If just tried and failed to reuse lookahead token after an
           * error, discard it.  */

          /* Return failure if at end of input.  */
          if (yytoken == SymbolKind.YYEOF)
          return false;
          else
            yytoken = SymbolKind.YYEMPTY;
        }

        /* Else will try to reuse lookahead token after shifting the error
         * token.  */
        label = YYERRLAB1;
        break;

      /*-------------------------------------------------.
      | errorlab -- error raised explicitly by YYERROR.  |
      `-------------------------------------------------*/
      case YYERROR:
        /* Do not reclaim the symbols of the rule which action triggered
           this YYERROR.  */
        yystack.pop (yylen);
        yylen = 0;
        yystate = yystack.stateAt (0);
        label = YYERRLAB1;
        break;

      /*-------------------------------------------------------------.
      | yyerrlab1 -- common code for both syntax error and YYERROR.  |
      `-------------------------------------------------------------*/
      case YYERRLAB1:
        yyerrstatus_ = 3;       /* Each real token shifted decrements this.  */

        // Pop stack until we find a state that shifts the error token.
        for (;;)
        {
          yyn = yypact_[yystate];
          if (!yyPactValueIsDefault(yyn))
          {
            yyn += SymbolKind.YYerror;
            if (0 <= yyn && yyn <= yylast_ && yycheck_[yyn] == SymbolKind.YYerror)
            {
              yyn = yytable_[yyn];
              if (0 < yyn)
                break;
                  }
          }

          /* Pop the current state because it cannot handle the error token.  */
          if (yystack.height == 1)
            return false;


          yystack.pop ();
          yystate = yystack.stateAt (0);
        }


        /* Shift the error token.  */
        yystate = yyn;
        yystack.push (yyn, yylval);
        label = YYNEWSTATE;
        break;

      /* Accept.  */
      case YYACCEPT:
        yyresult = true;
        label = YYRETURN;
        break;

      /* Abort.  */
      case YYABORT:
        yyresult = false;
        label = YYRETURN;
        break;
      case YYRETURN:
        return yyresult;
    }
    assert(0);
  }



  // Generate an error message.
  private final void yyreportSyntaxError(Context yyctx)
  {
    yylexer.reportSyntaxError(yyctx);
  }




  /**
   * Information needed to get the list of expected tokens and to forge
   * a syntax error diagnostic.
   */
  public static final class Context
  {
    private const(YYStack) yystack;
    private SymbolKind yytoken;

    this(YYStack stack, SymbolKind kind)
    {
      yystack = stack;
      yytoken = kind;
    }

    final SymbolKind getToken() const
    {
      return yytoken;
    }
    /**
     * Put in YYARG at most YYARGN of the expected tokens given the
     * current YYCTX, and return the number of tokens stored in YYARG.  If
     * YYARG is null, return the number of expected tokens (guaranteed to
     * be less than YYNTOKENS).
     */
    int getExpectedTokens(SymbolKind[] yyarg, int yyargn) const
    {
      return getExpectedTokens(yyarg, 0, yyargn);
    }

    int getExpectedTokens(SymbolKind[] yyarg, int yyoffset, int yyargn) const
    {
      int yycount = yyoffset;
      int yyn = yypact_[this.yystack.stateAt(0)];
      if (!yyPactValueIsDefault(yyn))
      {
        /* Start YYX at -YYN if negative to avoid negative
           indexes in YYCHECK.  In other words, skip the first
           -YYN actions for this state because they are default
           actions.  */
        int yyxbegin = yyn < 0 ? -yyn : 0;
        /* Stay within bounds of both yycheck and yytname.  */
        int yychecklim = yylast_ - yyn + 1;
        int yyxend = yychecklim < yyntokens_ ? yychecklim : yyntokens_;
        for (int yyx = yyxbegin; yyx < yyxend; ++yyx)
          if (yycheck_[yyx + yyn] == yyx && yyx != SymbolKind.YYerror
              && !yyTableValueIsError(yytable_[yyx + yyn]))
          {
            if (yyarg is null)
              ++yycount;
            else if (yycount == yyargn)
              return 0;
            else
              yyarg[yycount++] = SymbolKind(yyx);
          }
      }
      if (yyarg !is null && yycount == yyoffset && yyoffset < yyargn)
        yyarg[yyoffset] = SymbolKind.YYEMPTY;
      return yycount - yyoffset;
    }
  }



  /**
   * Whether the given <code>yypact_</code> value indicates a defaulted state.
   * @param yyvalue   the value to check
   */
  private static bool yyPactValueIsDefault(int yyvalue)
  {
    return yyvalue == yypact_ninf_;
  }

  /**
   * Whether the given <code>yytable_</code> value indicates a syntax error.
   * @param yyvalue   the value to check
   */
  private static bool yyTableValueIsError(int yyvalue)
  {
    return yyvalue == yytable_ninf_;
  }

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
  private static immutable short yypact_ninf_ = -38;

  /* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule which
     number is the opposite.  If YYTABLE_NINF_, syntax error.  */
  private static immutable short yytable_ninf_ = -1;

    /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
private static immutable short[] yypact_ =
[
     -38,    74,   -38,   -38,    11,    16,     5,     1,    29,    25,
      39,    48,    -3,    18,    33,    62,    31,    75,    40,    76,
     -38,   -38,    -4,   -38,   -37,   -38,   -38,     6,    34,   -38,
      46,    25,   -38,   -38,    25,    98,    25,    25,     9,   -38,
      60,    70,    -6,    96,    72,   -38,   -38,   111,    84,   -38,
      80,   -38,   -38,    37,    25,    25,   144,   -38,   -38,   -38,
       5,   -38,    25,    60,   -29,   120,    87,    67,   -38,   -38,
     -38,     1,    25,    25,    25,    25,    25,   -38,    25,    25,
     -38,   128,   -38,   151,   161,   -38,   113,    93,   -38,   -38,
      99,   -38,    25,   -38,   -38,   -24,   -24,    67,    67,    67,
      10,    73,   168,   136,   -38,   -38,   173,   -38,   105,   175,
      25,   149,   147,    25,   -38,   148,    81,   183,   -38,   121,
     -38,    25,   -38,    25,   -38,   129,   137,   -38,   -38
];

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
private static immutable byte[] yydefact_ =
[
       2,     0,     1,    23,     0,     0,     0,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       3,     4,     0,    39,     0,    35,    36,     0,     0,    33,
      45,    28,    44,    43,     0,     0,     0,     0,     0,    25,
      29,     0,     0,     0,     0,    22,     5,     0,     0,    20,
       0,    21,    41,     0,     0,     0,     0,    16,    37,    38,
       0,    15,     0,    30,     0,     0,     0,    54,    31,    32,
       6,    26,     0,     0,     0,     0,     0,     7,     0,     0,
      14,     0,     8,     0,     0,    17,     0,     0,    40,    34,
       0,    46,     0,    55,    27,    49,    50,    51,    52,    53,
       0,     0,     0,     0,    42,     9,     0,    48,     0,     0,
       0,     0,     0,     0,    47,     0,     0,     0,    18,     0,
      11,     0,    13,     0,    10,     0,     0,    12,    19
];

  /* YYPGOTO[NTERM-NUM].  */
private static immutable short[] yypgoto_ =
[
     -38,   -38,   -38,   -38,   -38,   122,   -38,   -38,   131,   -38,
     -38,    -9
];

  /* YYDEFGOTO[NTERM-NUM].  */
private static immutable byte[] yydefgoto_ =
[
       0,     1,    20,    21,    38,    39,    71,    28,    29,    24,
      53,    40
];

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
private static immutable short[] yytable_ =
[
      42,    78,    56,    54,    57,    30,    31,    32,    91,    33,
      34,    25,    58,    26,    59,    22,    72,    73,    74,    75,
      23,    76,    63,    74,    75,    64,    76,    66,    67,    30,
      35,    32,    55,    33,    34,    41,   109,    36,    45,    72,
      73,    74,    75,    43,    76,    86,    87,    37,    68,    69,
      70,    27,    44,    90,    35,    72,    73,    74,    75,    46,
      76,    36,    47,    95,    96,    97,    98,    99,    48,   100,
     101,    37,    49,    60,     2,    61,    84,     3,    85,    50,
      52,    51,    62,   108,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
     110,   116,    65,    79,   119,    72,    73,    74,    75,   121,
      76,    77,   125,    80,   126,    81,    83,    76,    72,    73,
      74,    75,   122,    76,    93,    82,    72,    73,    74,    75,
     106,    76,    72,    73,    74,    75,   107,    76,    72,    73,
      74,    75,   114,    76,    72,    73,    74,    75,    88,    76,
      72,    73,    74,    75,   105,    76,    92,   103,    72,    73,
      74,    75,   124,    76,   102,   104,    72,    73,    74,    75,
     127,    76,   111,   112,    72,    73,    74,    75,   128,    76,
     113,   115,    72,    73,    74,    75,   117,    76,   118,   120,
     123,    89,     0,    94
];

private static immutable byte[] yycheck_ =
[
       9,     7,    39,     7,    41,     4,     5,     6,    37,     8,
       9,     6,     6,     8,     8,     4,    45,    46,    47,    48,
       4,    50,    31,    47,    48,    34,    50,    36,    37,     4,
      29,     6,    36,     8,     9,     6,    26,    36,    41,    45,
      46,    47,    48,     4,    50,    54,    55,    46,    39,    40,
      41,    46,     4,    62,    29,    45,    46,    47,    48,    41,
      50,    36,    29,    72,    73,    74,    75,    76,     6,    78,
      79,    46,    41,    39,     0,    41,    39,     3,    41,     4,
       4,    41,    36,    92,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      27,   110,     4,     7,   113,    45,    46,    47,    48,    28,
      50,    41,   121,    41,   123,     4,    36,    50,    45,    46,
      47,    48,    41,    50,    37,    41,    45,    46,    47,    48,
      37,    50,    45,    46,    47,    48,    37,    50,    45,    46,
      47,    48,    37,    50,    45,    46,    47,    48,     4,    50,
      45,    46,    47,    48,    41,    50,    36,     6,    45,    46,
      47,    48,    41,    50,    36,     4,    45,    46,    47,    48,
      41,    50,     4,    37,    45,    46,    47,    48,    41,    50,
       7,     6,    45,    46,    47,    48,    37,    50,    41,    41,
       7,    60,    -1,    71
];

  /* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
     state STATE-NUM.  */
private static immutable byte[] yystos_ =
[
       0,    52,     0,     3,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      53,    54,     4,     4,    60,     6,     8,    46,    58,    59,
       4,     5,     6,     8,     9,    29,    36,    46,    55,    56,
      62,     6,    62,     4,     4,    41,    41,    29,     6,    41,
       4,    41,     4,    61,     7,    36,    39,    41,     6,     8,
      39,    41,    36,    62,    62,     4,    62,    62,    39,    40,
      41,    57,    45,    46,    47,    48,    50,    41,     7,     7,
      41,     4,    41,    36,    39,    41,    62,    62,     4,    59,
      62,    37,    36,    37,    56,    62,    62,    62,    62,    62,
      62,    62,    36,     6,     4,    41,    37,    37,    62,    26,
      27,     4,    37,     7,    37,     6,    62,    37,    41,    62,
      41,    28,    41,     7,    41,    62,    62,    41,    41
];

  /* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
private static immutable byte[] yyr1_ =
[
       0,    51,    52,    52,    53,    53,    53,    53,    53,    53,
      53,    53,    53,    53,    53,    53,    53,    53,    53,    53,
      53,    53,    53,    54,    55,    55,    55,    55,    56,    56,
      56,    57,    57,    58,    58,    59,    59,    59,    59,    60,
      60,    61,    61,    62,    62,    62,    62,    62,    62,    62,
      62,    62,    62,    62,    62,    62
];

  /* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
private static immutable byte[] yyr2_ =
[
       0,     2,     0,     2,     1,     2,     3,     3,     3,     5,
       8,     7,     9,     7,     3,     3,     3,     3,     6,     9,
       2,     2,     2,     1,     0,     1,     2,     3,     1,     1,
       2,     1,     1,     1,     3,     1,     1,     2,     2,     1,
       3,     1,     3,     1,     1,     1,     3,     5,     4,     3,
       3,     3,     3,     3,     2,     3
];




  private static auto yytranslate_ (int t)
  {
    return SymbolKind(t);
  }

  private static immutable int yylast_ = 193;
  private static immutable int yynnts_ = 12;
  private static immutable int yyfinal_ = 2;
  private static immutable int yyntokens_ = 51;

  private final struct YYStackElement {
    int state;
    Value value;
  }

  private final struct YYStack {
    private YYStackElement[] stack = [];

    public final ulong height()
    {
      return stack.length;
    }

    public final void push (int state, Value value  )
    {
      stack ~= YYStackElement(state, value);
    }

    public final void pop ()
    {
      pop (1);
    }

    public final void pop (int num)
    {
      stack.length -= num;
    }

    public final int stateAt (int i) const
    {
      return stack[$-i-1].state;
    }



    public final ref Value valueAt (int i)
    {
      return stack[$-i-1].value;
    }

  }
/* Unqualified %code blocks.  */
#line 31 "grammar.y"

    import Node;
    import Expr;
    import std.stdio;
    import LexerImpl;
    import SymbolTable;
    import Printable;

#line 1290 "Parser.d"

}

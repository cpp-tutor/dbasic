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
  Parser.Node Read;                        /* Read  */
  Parser.Node Input;                       /* Input  */
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
    Read = 61,                     /* Read  */
    InputSq = 62,                  /* InputSq  */
    Input = 63,                    /* Input  */
    Expr = 64,                     /* Expr  */
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
  "Print", "Tab", "DataSq", "Data", "ReadSq", "Read", "InputSq", "Input",
  "Expr", null
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
#line 45 "grammar.y"
                 { next = next.link((yyval.Stmt)); }
      break;

    case 5: /* Stmt: STOP EOL  */
#line 46 "grammar.y"
                   { (yyval.Stmt) = new Stop(); next = next.link((yyval.Stmt)); }
      break;

    case 6: /* Stmt: PRINT PrintSq EOL  */
#line 47 "grammar.y"
                            { ((yystack.valueAt (1)).PrintSq).linkLast(new NewLine()); (yyval.Stmt) = new Printable(((yystack.valueAt (1)).PrintSq)); next = next.link((yyval.Stmt)); }
      break;

    case 7: /* Stmt: GOTO INTEGER EOL  */
#line 48 "grammar.y"
                           { symtab.registerFlow(cast(ushort)((yystack.valueAt (1)).INTEGER)); (yyval.Stmt) = new Goto(cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 8: /* Stmt: GOSUB INTEGER EOL  */
#line 49 "grammar.y"
                            { symtab.registerFlow(cast(ushort)((yystack.valueAt (1)).INTEGER)); (yyval.Stmt) = new GoSub(cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 9: /* Stmt: LET IDENT RELOP Expr EOL  */
#line 50 "grammar.y"
                                   { if (((yystack.valueAt (2)).RELOP) != TokenKind.EQ) symtab.error("ILLEGAL RELATION"); (yyval.Stmt) = new Let(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 10: /* Stmt: LET IDENT LPAREN Expr RPAREN RELOP Expr EOL  */
#line 51 "grammar.y"
                                                      { if (((yystack.valueAt (2)).RELOP) != TokenKind.EQ) symtab.error("ILLEGAL RELATION"); (yyval.Stmt) = new LetDim(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 11: /* Stmt: LET IDENT LPAREN Expr COMMA Expr RPAREN RELOP Expr EOL  */
#line 52 "grammar.y"
                                                                 { if (((yystack.valueAt (2)).RELOP) != TokenKind.EQ) symtab.error("ILLEGAL RELATION"); (yyval.Stmt) = new LetDim2(((yystack.valueAt (8)).IDENT), ((yystack.valueAt (6)).Expr), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 12: /* Stmt: IF Expr RELOP Expr THEN INTEGER EOL  */
#line 53 "grammar.y"
                                              { (yyval.Stmt) = new If(((yystack.valueAt (5)).Expr), ((yystack.valueAt (4)).RELOP), ((yystack.valueAt (3)).Expr), cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 13: /* Stmt: FOR IDENT RELOP Expr TO Expr STEP Expr EOL  */
#line 54 "grammar.y"
                                                     { if (((yystack.valueAt (6)).RELOP) != TokenKind.EQ) symtab.error("ILLEGAL RELATION"); (yyval.Stmt) = new For(((yystack.valueAt (7)).IDENT), ((yystack.valueAt (5)).Expr), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 14: /* Stmt: FOR IDENT RELOP Expr TO Expr EOL  */
#line 55 "grammar.y"
                                           { if (((yystack.valueAt (4)).RELOP) != TokenKind.EQ) symtab.error("ILLEGAL RELATION"); (yyval.Stmt) = new For(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr), new Constant(symtab.installConstant(1.0))); next = next.link((yyval.Stmt)); }
      break;

    case 15: /* Stmt: NEXT IDENT EOL  */
#line 56 "grammar.y"
                         { (yyval.Stmt) = new Next(((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 16: /* Stmt: DATA DataSq EOL  */
#line 57 "grammar.y"
                          {}
      break;

    case 17: /* Stmt: READ ReadSq EOL  */
#line 58 "grammar.y"
                          {}
      break;

    case 18: /* Stmt: INPUT InputSq EOL  */
#line 59 "grammar.y"
                            {}
      break;

    case 19: /* Stmt: DIM IDENT LPAREN INTEGER RPAREN EOL  */
#line 60 "grammar.y"
                                              { symtab.initializeDim(((yystack.valueAt (4)).IDENT), true, cast(ushort)((yystack.valueAt (2)).INTEGER)); }
      break;

    case 20: /* Stmt: DIM IDENT LPAREN INTEGER COMMA INTEGER RPAREN EOL  */
#line 61 "grammar.y"
                                                            { symtab.initializeDim2(((yystack.valueAt (6)).IDENT), true, cast(ushort)((yystack.valueAt (4)).INTEGER), cast(ushort)((yystack.valueAt (2)).INTEGER)); }
      break;

    case 21: /* Stmt: DEF FN IDENT LPAREN IDENT RPAREN RELOP Expr EOL  */
#line 62 "grammar.y"
                                                          { if (((yystack.valueAt (2)).RELOP) != TokenKind.EQ) symtab.error("ILLEGAL RELATION"); symtab.initializeId(((yystack.valueAt (4)).IDENT)); symtab.addFunction(((yystack.valueAt (6)).IDENT), SymbolTable.Function(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (1)).Expr))); }
      break;

    case 22: /* Stmt: RETURN EOL  */
#line 63 "grammar.y"
                     { (yyval.Stmt) = new Return(); next = next.link((yyval.Stmt)); }
      break;

    case 23: /* Stmt: REM EOL  */
#line 64 "grammar.y"
                  { }
      break;

    case 24: /* Stmt: END EOL  */
#line 65 "grammar.y"
                  { if (For.pop() != -1) symtab.error("FOR WITHOUT NEXT"); symtab.endOfProgram(); }
      break;

    case 25: /* Lineno: LINENO  */
#line 68 "grammar.y"
                 { if (symtab.end) symtab.error("STATEMENT AFTER END"); (yyval.Lineno) = new Line(((yystack.valueAt (0)).LINENO)); }
      break;

    case 26: /* PrintSq: %empty  */
#line 71 "grammar.y"
                 { (yyval.PrintSq) = new Node(); }
      break;

    case 27: /* PrintSq: Print  */
#line 72 "grammar.y"
                { (yyval.PrintSq) = ((yystack.valueAt (0)).Print); }
      break;

    case 28: /* PrintSq: PrintSq Tab  */
#line 73 "grammar.y"
                      { (yyval.PrintSq).linkLast(((yystack.valueAt (0)).Tab)); }
      break;

    case 29: /* PrintSq: PrintSq Tab Print  */
#line 74 "grammar.y"
                            { (yyval.PrintSq).linkLast(((yystack.valueAt (1)).Tab)); (yyval.PrintSq).linkLast(((yystack.valueAt (0)).Print)); }
      break;

    case 30: /* Print: STRING  */
#line 77 "grammar.y"
                 { (yyval.Print) = new String(((yystack.valueAt (0)).STRING)); }
      break;

    case 31: /* Print: Expr  */
#line 78 "grammar.y"
               { (yyval.Print) = new PrintExpr(((yystack.valueAt (0)).Expr)); }
      break;

    case 32: /* Print: STRING Expr  */
#line 79 "grammar.y"
                      { (yyval.Print) = new String(((yystack.valueAt (1)).STRING)); (yyval.Print).linkLast(new PrintExpr(((yystack.valueAt (0)).Expr))); }
      break;

    case 33: /* Tab: COMMA  */
#line 82 "grammar.y"
                { (yyval.Tab) = new Comma(); }
      break;

    case 34: /* Tab: SEMICOLON  */
#line 83 "grammar.y"
                    { (yyval.Tab) = new SemiColon(); }
      break;

    case 35: /* DataSq: Data  */
#line 86 "grammar.y"
               {}
      break;

    case 36: /* DataSq: DataSq COMMA Data  */
#line 87 "grammar.y"
                            {}
      break;

    case 37: /* Data: INTEGER  */
#line 90 "grammar.y"
                  { symtab.installData(((yystack.valueAt (0)).INTEGER)); }
      break;

    case 38: /* Data: NUMBER  */
#line 91 "grammar.y"
                 { symtab.installData(((yystack.valueAt (0)).NUMBER)); }
      break;

    case 39: /* Data: MINUS INTEGER  */
#line 92 "grammar.y"
                        { symtab.installData(-((yystack.valueAt (0)).INTEGER)); }
      break;

    case 40: /* Data: MINUS NUMBER  */
#line 93 "grammar.y"
                       { symtab.installData(-((yystack.valueAt (0)).NUMBER)); }
      break;

    case 41: /* ReadSq: Read  */
#line 96 "grammar.y"
               {}
      break;

    case 42: /* ReadSq: ReadSq COMMA Read  */
#line 97 "grammar.y"
                            {}
      break;

    case 43: /* Read: IDENT  */
#line 100 "grammar.y"
                { (yyval.Read) = new Read(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Read)); }
      break;

    case 44: /* Read: IDENT LPAREN Expr RPAREN  */
#line 101 "grammar.y"
                                   { (yyval.Read) = new ReadDim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Read)); }
      break;

    case 45: /* Read: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 102 "grammar.y"
                                              { (yyval.Read) = new ReadDim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Read)); }
      break;

    case 48: /* Input: IDENT  */
#line 109 "grammar.y"
                { (yyval.Input) = new Input(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Input)); }
      break;

    case 49: /* Input: IDENT LPAREN Expr RPAREN  */
#line 110 "grammar.y"
                                   { (yyval.Input) = new InputDim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Input)); }
      break;

    case 50: /* Input: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 111 "grammar.y"
                                              { (yyval.Input) = new InputDim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Input)); }
      break;

    case 51: /* Expr: NUMBER  */
#line 114 "grammar.y"
                 { (yyval.Expr) = new Constant(symtab.installConstant(((yystack.valueAt (0)).NUMBER))); }
      break;

    case 52: /* Expr: INTEGER  */
#line 115 "grammar.y"
                  { (yyval.Expr) = new Constant(symtab.installConstant(((yystack.valueAt (0)).INTEGER))); }
      break;

    case 53: /* Expr: IDENT  */
#line 116 "grammar.y"
                { (yyval.Expr) = new Identifier(((yystack.valueAt (0)).IDENT)); }
      break;

    case 54: /* Expr: MATHFN Expr RPAREN  */
#line 117 "grammar.y"
                             { (yyval.Expr) = new MathFn(((yystack.valueAt (2)).MATHFN), ((yystack.valueAt (1)).Expr)); }
      break;

    case 55: /* Expr: FN IDENT LPAREN Expr RPAREN  */
#line 118 "grammar.y"
                                      { (yyval.Expr) = new FnCall(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); }
      break;

    case 56: /* Expr: IDENT LPAREN Expr RPAREN  */
#line 119 "grammar.y"
                                   { (yyval.Expr) = new Dim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); }
      break;

    case 57: /* Expr: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 120 "grammar.y"
                                              { (yyval.Expr) = new Dim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); }
      break;

    case 58: /* Expr: Expr PLUS Expr  */
#line 121 "grammar.y"
                         { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Add, ((yystack.valueAt (0)).Expr)); }
      break;

    case 59: /* Expr: Expr MINUS Expr  */
#line 122 "grammar.y"
                          { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Sub, ((yystack.valueAt (0)).Expr)); }
      break;

    case 60: /* Expr: Expr TIMES Expr  */
#line 123 "grammar.y"
                          { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Mul, ((yystack.valueAt (0)).Expr)); }
      break;

    case 61: /* Expr: Expr DIVIDE Expr  */
#line 124 "grammar.y"
                           { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Div, ((yystack.valueAt (0)).Expr)); }
      break;

    case 62: /* Expr: Expr EXP Expr  */
#line 125 "grammar.y"
                        { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Exp, ((yystack.valueAt (0)).Expr)); }
      break;

    case 63: /* Expr: MINUS Expr  */
#line 126 "grammar.y"
                                  { (yyval.Expr) = new Operation(((yystack.valueAt (0)).Expr), Op.Neg); }
      break;

    case 64: /* Expr: LPAREN Expr RPAREN  */
#line 127 "grammar.y"
                             { (yyval.Expr) = ((yystack.valueAt (1)).Expr); }
      break;


#line 730 "Parser.d"

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
  private static immutable short yypact_ninf_ = -44;

  /* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule which
     number is the opposite.  If YYTABLE_NINF_, syntax error.  */
  private static immutable short yytable_ninf_ = -1;

    /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
private static immutable short[] yypact_ =
[
     -44,   131,   -44,   -44,    -1,     5,     0,     7,     4,    16,
      17,    23,   -11,    -3,    22,    48,    24,    53,    30,    60,
     -44,   -44,    -5,    50,    43,   -44,   -44,   -44,    95,    46,
     -44,    59,    16,   -44,   -44,    16,    92,    16,    16,   -22,
     -44,    79,    68,    -6,   107,    81,   -44,   -44,   124,    89,
     -44,    96,   -44,   100,    66,   -44,    16,    16,    16,     5,
     -44,   -44,   -44,     0,   -44,    16,    79,    13,   101,   138,
      88,   -44,   -44,   -44,     7,    16,    16,    16,    16,    16,
     -44,    16,    16,   -44,   104,   -44,   152,    16,    60,   -44,
     176,    44,    73,   -44,   -44,   120,   -44,    16,   -44,   -44,
     -43,   -43,    88,    88,    88,    29,   -13,   157,    76,   132,
     -44,   -44,   153,    16,   -44,    16,   -44,    16,   144,   158,
      16,   125,   122,   166,   -44,    16,    16,   150,   156,   162,
     -44,   133,    52,   169,   -44,   136,   168,   184,   204,   -44,
     -44,   -44,    16,   -44,    16,   178,   -44,   -44,    16,   192,
     200,   -44,   208,   -44,   -44,   -44
];

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
private static immutable byte[] yydefact_ =
[
       2,     0,     1,    25,     0,     0,     0,    26,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       3,     4,     0,    43,     0,    41,    37,    38,     0,     0,
      35,    53,    30,    52,    51,     0,     0,     0,     0,     0,
      27,    31,     0,     0,     0,     0,    24,     5,     0,     0,
      22,     0,    23,    48,     0,    46,     0,     0,     0,     0,
      17,    39,    40,     0,    16,     0,    32,     0,     0,     0,
      63,    33,    34,     6,    28,     0,     0,     0,     0,     0,
       7,     0,     0,    15,     0,     8,     0,     0,     0,    18,
       0,     0,     0,    42,    36,     0,    54,     0,    64,    29,
      58,    59,    60,    61,    62,     0,     0,     0,     0,     0,
      47,     9,     0,     0,    44,     0,    56,     0,     0,     0,
       0,     0,     0,     0,    49,     0,     0,     0,     0,     0,
      55,     0,     0,     0,    19,     0,     0,     0,     0,    45,
      57,    12,     0,    14,     0,     0,    50,    10,     0,     0,
       0,    20,     0,    13,    21,    11
];

  /* YYPGOTO[NTERM-NUM].  */
private static immutable short[] yypgoto_ =
[
     -44,   -44,   -44,   -44,   -44,   146,   -44,   -44,   164,   -44,
     177,   -44,   140,    -9
];

  /* YYDEFGOTO[NTERM-NUM].  */
private static immutable byte[] yydefgoto_ =
[
       0,     1,    20,    21,    39,    40,    74,    29,    30,    24,
      25,    54,    55,    41
];

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
private static immutable short[] yytable_ =
[
      43,    81,    56,    22,    77,    78,    26,    79,    27,    23,
      42,    31,    32,    33,   120,    34,    35,    71,    72,    73,
      31,    44,    33,    66,    34,    35,    67,    45,    69,    70,
      46,    57,    75,    76,    77,    78,    36,    79,    47,    75,
      76,    77,    78,    37,    79,    36,    28,    90,    91,    92,
      96,    48,    37,    38,    49,   119,    95,    51,    75,    76,
      77,    78,    38,    79,    53,    50,   100,   101,   102,   103,
     104,    52,   105,   106,    75,    76,    77,    78,   109,    79,
     142,   112,    59,   113,    60,    63,    58,    64,   118,    75,
      76,    77,    78,   143,    79,    65,    68,    75,    76,    77,
      78,    61,    79,    62,   127,    88,   128,    89,   129,    80,
     114,   132,   115,   122,    82,   123,   136,   137,    75,    76,
      77,    78,    83,    79,    75,    76,    77,    78,    84,    79,
      85,     2,    86,   149,     3,   150,    87,    97,    79,   152,
     107,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,   116,   108,   117,
     126,   121,   133,   134,   131,    75,    76,    77,    78,   124,
      79,   125,   135,   145,   141,    98,   144,    75,    76,    77,
      78,   130,    79,    75,    76,    77,    78,   138,    79,    75,
      76,    77,    78,   139,    79,    75,    76,    77,    78,   140,
      79,    75,    76,    77,    78,   146,    79,    75,    76,    77,
      78,   148,    79,    75,    76,    77,    78,   111,    79,   151,
      99,    75,    76,    77,    78,   147,    79,    94,   110,    75,
      76,    77,    78,   153,    79,     0,    93,    75,    76,    77,
      78,   154,    79,     0,     0,    75,    76,    77,    78,   155,
      79,     0,     0,    75,    76,    77,    78,     0,    79
];

private static immutable short[] yycheck_ =
[
       9,     7,     7,     4,    47,    48,     6,    50,     8,     4,
       6,     4,     5,     6,    27,     8,     9,    39,    40,    41,
       4,     4,     6,    32,     8,     9,    35,     4,    37,    38,
      41,    36,    45,    46,    47,    48,    29,    50,    41,    45,
      46,    47,    48,    36,    50,    29,    46,    56,    57,    58,
      37,    29,    36,    46,     6,    26,    65,     4,    45,    46,
      47,    48,    46,    50,     4,    41,    75,    76,    77,    78,
      79,    41,    81,    82,    45,    46,    47,    48,    87,    50,
      28,    37,    39,    39,    41,    39,    36,    41,    97,    45,
      46,    47,    48,    41,    50,    36,     4,    45,    46,    47,
      48,     6,    50,     8,   113,    39,   115,    41,   117,    41,
      37,   120,    39,    37,     7,    39,   125,   126,    45,    46,
      47,    48,    41,    50,    45,    46,    47,    48,     4,    50,
      41,     0,    36,   142,     3,   144,    36,    36,    50,   148,
      36,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    37,     6,    39,
       7,     4,    37,    41,     6,    45,    46,    47,    48,    37,
      50,    39,     6,    37,    41,    37,     7,    45,    46,    47,
      48,    37,    50,    45,    46,    47,    48,    37,    50,    45,
      46,    47,    48,    37,    50,    45,    46,    47,    48,    37,
      50,    45,    46,    47,    48,    37,    50,    45,    46,    47,
      48,     7,    50,    45,    46,    47,    48,    41,    50,    41,
      74,    45,    46,    47,    48,    41,    50,    63,    88,    45,
      46,    47,    48,    41,    50,    -1,    59,    45,    46,    47,
      48,    41,    50,    -1,    -1,    45,    46,    47,    48,    41,
      50,    -1,    -1,    45,    46,    47,    48,    -1,    50
];

  /* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
     state STATE-NUM.  */
private static immutable byte[] yystos_ =
[
       0,    52,     0,     3,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      53,    54,     4,     4,    60,    61,     6,     8,    46,    58,
      59,     4,     5,     6,     8,     9,    29,    36,    46,    55,
      56,    64,     6,    64,     4,     4,    41,    41,    29,     6,
      41,     4,    41,     4,    62,    63,     7,    36,    36,    39,
      41,     6,     8,    39,    41,    36,    64,    64,     4,    64,
      64,    39,    40,    41,    57,    45,    46,    47,    48,    50,
      41,     7,     7,    41,     4,    41,    36,    36,    39,    41,
      64,    64,    64,    61,    59,    64,    37,    36,    37,    56,
      64,    64,    64,    64,    64,    64,    64,    36,     6,    64,
      63,    41,    37,    39,    37,    39,    37,    39,    64,    26,
      27,     4,    37,    39,    37,    39,     7,    64,    64,    64,
      37,     6,    64,    37,    41,     6,    64,    64,    37,    37,
      37,    41,    28,    41,     7,    37,    37,    41,     7,    64,
      64,    41,    64,    41,    41,    41
];

  /* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
private static immutable byte[] yyr1_ =
[
       0,    51,    52,    52,    53,    53,    53,    53,    53,    53,
      53,    53,    53,    53,    53,    53,    53,    53,    53,    53,
      53,    53,    53,    53,    53,    54,    55,    55,    55,    55,
      56,    56,    56,    57,    57,    58,    58,    59,    59,    59,
      59,    60,    60,    61,    61,    61,    62,    62,    63,    63,
      63,    64,    64,    64,    64,    64,    64,    64,    64,    64,
      64,    64,    64,    64,    64
];

  /* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
private static immutable byte[] yyr2_ =
[
       0,     2,     0,     2,     1,     2,     3,     3,     3,     5,
       8,    10,     7,     9,     7,     3,     3,     3,     3,     6,
       8,     9,     2,     2,     2,     1,     0,     1,     2,     3,
       1,     1,     2,     1,     1,     1,     3,     1,     1,     2,
       2,     1,     3,     1,     4,     6,     1,     3,     1,     4,
       6,     1,     1,     1,     3,     5,     4,     6,     3,     3,
       3,     3,     3,     2,     3
];




  private static auto yytranslate_ (int t)
  {
    return SymbolKind(t);
  }

  private static immutable int yylast_ = 258;
  private static immutable int yynnts_ = 14;
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

    import Node : Node, Line, Stop, Goto, GoSub, Return, Let, LetDim, LetDim2, Read, ReadDim, ReadDim2, Input, InputDim, InputDim2, If, For, Next;
    import Expr : Expr, Op, Constant, Identifier, Dim, Dim2, Operation, MathFn, FnCall;
    import LexerImpl : LexerImpl;
    import SymbolTable : SymbolTable;
    import Printable : Printable, NewLine, Comma, SemiColon, String, PrintExpr;

#line 1350 "Parser.d"

}

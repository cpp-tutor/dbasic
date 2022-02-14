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

    case 19: /* Stmt: RETURN EOL  */
#line 61 "grammar.y"
                     { (yyval.Stmt) = new Return(); next = next.link((yyval.Stmt)); }
      break;

    case 20: /* Stmt: REM EOL  */
#line 62 "grammar.y"
                  { }
      break;

    case 21: /* Stmt: END EOL  */
#line 63 "grammar.y"
                  { symtab.endOfProgram(); }
      break;

    case 22: /* Lineno: LINENO  */
#line 66 "grammar.y"
                 { if (symtab.end) yyerror("STATEMENTS AFTER END"); (yyval.Lineno) = new Line(((yystack.valueAt (0)).LINENO)); }
      break;

    case 23: /* PrintSq: %empty  */
#line 69 "grammar.y"
                 { (yyval.PrintSq) = new Node(); }
      break;

    case 24: /* PrintSq: Print  */
#line 70 "grammar.y"
                { (yyval.PrintSq) = ((yystack.valueAt (0)).Print); }
      break;

    case 25: /* PrintSq: PrintSq Tab  */
#line 71 "grammar.y"
                      { (yyval.PrintSq).linkLast(((yystack.valueAt (0)).Tab)); }
      break;

    case 26: /* PrintSq: PrintSq Tab Print  */
#line 72 "grammar.y"
                            { (yyval.PrintSq).linkLast(((yystack.valueAt (1)).Tab)); (yyval.PrintSq).linkLast(((yystack.valueAt (0)).Print)); }
      break;

    case 27: /* Print: STRING  */
#line 75 "grammar.y"
                 { (yyval.Print) = new String(((yystack.valueAt (0)).STRING)); }
      break;

    case 28: /* Print: Expr  */
#line 76 "grammar.y"
               { (yyval.Print) = new PrintExpr(((yystack.valueAt (0)).Expr)); }
      break;

    case 29: /* Print: STRING Expr  */
#line 77 "grammar.y"
                      { (yyval.Print) = new String(((yystack.valueAt (1)).STRING)); (yyval.Print).linkLast(new PrintExpr(((yystack.valueAt (0)).Expr))); }
      break;

    case 30: /* Tab: COMMA  */
#line 80 "grammar.y"
                { (yyval.Tab) = new Comma(); }
      break;

    case 31: /* Tab: SEMICOLON  */
#line 81 "grammar.y"
                    { (yyval.Tab) = new SemiColon(); }
      break;

    case 32: /* DataSq: Data  */
#line 84 "grammar.y"
               {}
      break;

    case 33: /* DataSq: DataSq COMMA Data  */
#line 85 "grammar.y"
                            {}
      break;

    case 34: /* Data: INTEGER  */
#line 88 "grammar.y"
                  { symtab.installData(((yystack.valueAt (0)).INTEGER)); }
      break;

    case 35: /* Data: NUMBER  */
#line 89 "grammar.y"
                 { symtab.installData(((yystack.valueAt (0)).NUMBER)); }
      break;

    case 36: /* Data: MINUS INTEGER  */
#line 90 "grammar.y"
                        { symtab.installData(-((yystack.valueAt (0)).INTEGER)); }
      break;

    case 37: /* Data: MINUS NUMBER  */
#line 91 "grammar.y"
                       { symtab.installData(-((yystack.valueAt (0)).NUMBER)); }
      break;

    case 38: /* ReadSq: IDENT  */
#line 95 "grammar.y"
                { (yyval.ReadSq) = new Read(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.ReadSq)); }
      break;

    case 39: /* ReadSq: ReadSq COMMA IDENT  */
#line 96 "grammar.y"
                             { (yyval.ReadSq) = new Read(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.ReadSq)); }
      break;

    case 40: /* InputSq: IDENT  */
#line 99 "grammar.y"
                { (yyval.InputSq) = new Input(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.InputSq)); }
      break;

    case 41: /* InputSq: InputSq COMMA IDENT  */
#line 100 "grammar.y"
                              { (yyval.InputSq) = new Input(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.InputSq)); }
      break;

    case 42: /* Expr: NUMBER  */
#line 102 "grammar.y"
                 { (yyval.Expr) = new Constant(symtab.installConstant(((yystack.valueAt (0)).NUMBER))); }
      break;

    case 43: /* Expr: INTEGER  */
#line 103 "grammar.y"
                  { (yyval.Expr) = new Constant(symtab.installConstant(((yystack.valueAt (0)).INTEGER))); }
      break;

    case 44: /* Expr: IDENT  */
#line 104 "grammar.y"
                { (yyval.Expr) = new Identifier(((yystack.valueAt (0)).IDENT)); }
      break;

    case 45: /* Expr: MATHFN Expr RPAREN  */
#line 105 "grammar.y"
                             { (yyval.Expr) = new MathFn(((yystack.valueAt (2)).MATHFN), ((yystack.valueAt (1)).Expr)); }
      break;

    case 46: /* Expr: IDENT LPAREN Expr RPAREN  */
#line 106 "grammar.y"
                                   { (yyval.Expr) = new Array(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); }
      break;

    case 47: /* Expr: Expr PLUS Expr  */
#line 107 "grammar.y"
                         { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Add, ((yystack.valueAt (0)).Expr)); }
      break;

    case 48: /* Expr: Expr MINUS Expr  */
#line 108 "grammar.y"
                          { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Sub, ((yystack.valueAt (0)).Expr)); }
      break;

    case 49: /* Expr: Expr TIMES Expr  */
#line 109 "grammar.y"
                          { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Mul, ((yystack.valueAt (0)).Expr)); }
      break;

    case 50: /* Expr: Expr DIVIDE Expr  */
#line 110 "grammar.y"
                           { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Div, ((yystack.valueAt (0)).Expr)); }
      break;

    case 51: /* Expr: Expr EXP Expr  */
#line 111 "grammar.y"
                        { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Exp, ((yystack.valueAt (0)).Expr)); }
      break;

    case 52: /* Expr: MINUS Expr  */
#line 112 "grammar.y"
                                  { (yyval.Expr) = new Operation(((yystack.valueAt (0)).Expr), Op.Neg); }
      break;

    case 53: /* Expr: LPAREN Expr RPAREN  */
#line 113 "grammar.y"
                             { (yyval.Expr) = ((yystack.valueAt (1)).Expr); }
      break;


#line 682 "Parser.d"

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
  private static immutable byte yypact_ninf_ = -44;

  /* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule which
     number is the opposite.  If YYTABLE_NINF_, syntax error.  */
  private static immutable byte yytable_ninf_ = -1;

    /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
private static immutable byte[] yypact_ =
[
     -44,    67,   -44,   -44,     4,     8,     9,     5,    29,    28,
      19,    34,    -2,     7,    47,    16,    36,    27,    65,   -44,
     -44,    -6,   -44,   -23,   -44,   -44,    25,    13,   -44,    35,
      28,   -44,   -44,    28,    28,    28,   -12,   -44,   -43,    31,
      -1,    66,    53,   -44,   -44,    56,   -44,    39,   -44,   -44,
      17,    28,    28,    72,   -44,   -44,   -44,     9,   -44,    28,
     -43,    83,    89,    48,   -44,   -44,   -44,     5,    28,    28,
      28,    28,    28,   -44,    28,    28,   -44,   -44,    93,    96,
     -44,   109,    95,   -44,   -44,   101,   -44,   -44,   -44,   -28,
     -28,    48,    48,    48,    61,    69,    73,   -44,   -44,    97,
     -44,   106,    28,    62,    28,    80,    77,   -44,   117,   -44,
      28,   -44,   -44,   125,   -44
];

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
private static immutable byte[] yydefact_ =
[
       2,     0,     1,    22,     0,     0,     0,    23,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     3,
       4,     0,    38,     0,    34,    35,     0,     0,    32,    44,
      27,    43,    42,     0,     0,     0,     0,    24,    28,     0,
       0,     0,     0,    21,     5,     0,    19,     0,    20,    40,
       0,     0,     0,     0,    16,    36,    37,     0,    15,     0,
      29,     0,     0,    52,    30,    31,     6,    25,     0,     0,
       0,     0,     0,     7,     0,     0,    14,     8,     0,     0,
      17,     0,     0,    39,    33,     0,    45,    53,    26,    47,
      48,    49,    50,    51,     0,     0,     0,    41,     9,     0,
      46,     0,     0,     0,     0,     0,     0,    18,     0,    11,
       0,    13,    10,     0,    12
];

  /* YYPGOTO[NTERM-NUM].  */
private static immutable byte[] yypgoto_ =
[
     -44,   -44,   -44,   -44,   -44,    46,   -44,   -44,    45,   -44,
     -44,    -9
];

  /* YYDEFGOTO[NTERM-NUM].  */
private static immutable byte[] yydefgoto_ =
[
       0,     1,    19,    20,    36,    37,    67,    27,    28,    23,
      50,    38
];

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
private static immutable byte[] yytable_ =
[
      40,    51,    68,    69,    70,    71,    74,    72,    21,    29,
      30,    31,    22,    32,    33,    24,    53,    25,    54,    70,
      71,    60,    72,    41,    61,    62,    63,    64,    65,    66,
      52,    55,    29,    56,    31,    39,    32,    33,    42,    43,
      47,    34,    81,    82,    68,    69,    70,    71,    44,    72,
      85,    35,    57,    45,    58,    26,    79,    46,    80,    89,
      90,    91,    92,    93,    34,    94,    95,     2,    48,    49,
       3,    59,    73,    75,    35,    78,    83,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,   101,    14,    15,
      16,    17,    18,   106,    76,   108,   102,    77,    72,    96,
      97,   113,    84,   107,   104,   110,    68,    69,    70,    71,
     103,    72,   105,    88,    68,    69,    70,    71,   111,    72,
      86,   109,    68,    69,    70,    71,    87,    72,    68,    69,
      70,    71,    99,    72,    68,    69,    70,    71,   100,    72,
      68,    69,    70,    71,     0,    72,    68,    69,    70,    71,
      98,    72,     0,     0,    68,    69,    70,    71,   112,    72,
       0,     0,    68,    69,    70,    71,   114,    72,     0,     0,
      68,    69,    70,    71,     0,    72
];

private static immutable byte[] yycheck_ =
[
       9,     7,    45,    46,    47,    48,     7,    50,     4,     4,
       5,     6,     4,     8,     9,     6,    39,     8,    41,    47,
      48,    30,    50,     4,    33,    34,    35,    39,    40,    41,
      36,     6,     4,     8,     6,     6,     8,     9,     4,    41,
       4,    36,    51,    52,    45,    46,    47,    48,    41,    50,
      59,    46,    39,     6,    41,    46,    39,    41,    41,    68,
      69,    70,    71,    72,    36,    74,    75,     0,    41,     4,
       3,    36,    41,     7,    46,    36,     4,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    26,    21,    22,
      23,    24,    25,   102,    41,   104,    27,    41,    50,     6,
       4,   110,    57,    41,     7,    28,    45,    46,    47,    48,
      37,    50,     6,    67,    45,    46,    47,    48,    41,    50,
      37,    41,    45,    46,    47,    48,    37,    50,    45,    46,
      47,    48,    37,    50,    45,    46,    47,    48,    37,    50,
      45,    46,    47,    48,    -1,    50,    45,    46,    47,    48,
      41,    50,    -1,    -1,    45,    46,    47,    48,    41,    50,
      -1,    -1,    45,    46,    47,    48,    41,    50,    -1,    -1,
      45,    46,    47,    48,    -1,    50
];

  /* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
     state STATE-NUM.  */
private static immutable byte[] yystos_ =
[
       0,    52,     0,     3,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    21,    22,    23,    24,    25,    53,
      54,     4,     4,    60,     6,     8,    46,    58,    59,     4,
       5,     6,     8,     9,    36,    46,    55,    56,    62,     6,
      62,     4,     4,    41,    41,     6,    41,     4,    41,     4,
      61,     7,    36,    39,    41,     6,     8,    39,    41,    36,
      62,    62,    62,    62,    39,    40,    41,    57,    45,    46,
      47,    48,    50,    41,     7,     7,    41,    41,    36,    39,
      41,    62,    62,     4,    59,    62,    37,    37,    56,    62,
      62,    62,    62,    62,    62,    62,     6,     4,    41,    37,
      37,    26,    27,    37,     7,     6,    62,    41,    62,    41,
      28,    41,    41,    62,    41
];

  /* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
private static immutable byte[] yyr1_ =
[
       0,    51,    52,    52,    53,    53,    53,    53,    53,    53,
      53,    53,    53,    53,    53,    53,    53,    53,    53,    53,
      53,    53,    54,    55,    55,    55,    55,    56,    56,    56,
      57,    57,    58,    58,    59,    59,    59,    59,    60,    60,
      61,    61,    62,    62,    62,    62,    62,    62,    62,    62,
      62,    62,    62,    62
];

  /* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
private static immutable byte[] yyr2_ =
[
       0,     2,     0,     2,     1,     2,     3,     3,     3,     5,
       8,     7,     9,     7,     3,     3,     3,     3,     6,     2,
       2,     2,     1,     0,     1,     2,     3,     1,     1,     2,
       1,     1,     1,     3,     1,     1,     2,     2,     1,     3,
       1,     3,     1,     1,     1,     3,     4,     3,     3,     3,
       3,     3,     2,     3
];




  private static auto yytranslate_ (int t)
  {
    return SymbolKind(t);
  }

  private static immutable int yylast_ = 175;
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

#line 1273 "Parser.d"

}
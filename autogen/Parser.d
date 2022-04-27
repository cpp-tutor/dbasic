/* A Bison parser, made by GNU Bison 3.8.2.12-013d-dirty.  */

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
  Parser.Node Print;                       /* Print  */
  Parser.Node PrintSq;                     /* PrintSq  */
  Parser.Node PrintSt;                     /* PrintSt  */
  Parser.Node PrintEn;                     /* PrintEn  */
  Parser.Node PrintTa;                     /* PrintTa  */
  Parser.Node Read;                        /* Read  */
  Parser.Node MatPr;                       /* MatPr  */
  Parser.Node MatPrSq;                     /* MatPrSq  */
  Parser.Node MatPrSt;                     /* MatPrSt  */
  Parser.Node MatPrEn;                     /* MatPrEn  */
  Parser.Node Input;                       /* Input  */
  double NUMBER;                           /* NUMBER  */
  int KEYWORD;                             /* KEYWORD  */
  int IDENT;                               /* IDENT  */
  int STRING;                              /* STRING  */
  int INTEGER;                             /* INTEGER  */
  int RELOP;                               /* RELOP  */
  string MATHFN;                           /* MATHFN  */
  ushort LINENO;                           /* LINENO  */

#line 138 "Parser.d"

};
/* Token kinds.  */
public enum TokenKind {
  YYEMPTY = -2,
  YYEOF = 0,
  YYerror = 1,
  YYUNDEF = 2,
  LINENO = 3,
  KEYWORD = 4,
  IDENT = 5,
  STRING = 6,
  INTEGER = 7,
  RELOP = 8,
  NUMBER = 9,
  MATHFN = 10,
  LET = 11,
  READ = 12,
  DATA = 13,
  PRINT = 14,
  GO = 15,
  IF = 16,
  FOR = 17,
  NEXT = 18,
  END = 19,
  STOP = 20,
  DEF = 21,
  GOSUB = 22,
  RETURN = 23,
  DIM = 24,
  REM = 25,
  MAT = 26,
  INPUT = 27,
  THEN = 28,
  TO = 29,
  STEP = 30,
  FN = 31,
  ZER = 32,
  CON = 33,
  IDN = 34,
  TRN = 35,
  INV = 36,
  DET = 37,
  ASSIGN = 38,
  EQ = 39,
  NE = 40,
  LT = 41,
  LE = 42,
  GE = 43,
  GT = 44,
  LPAREN = 45,
  RPAREN = 46,
  DOLLAR = 47,
  COMMA = 48,
  SEMICOLON = 49,
  EOL = 50,
  WS = 51,
  BLANKLINE = 52,
  BADLINE = 53,
  PLUS = 54,
  MINUS = 55,
  TIMES = 56,
  DIVIDE = 57,
  UMINUS = 58,
  EXP = 59,
}

class Parser
{
  /** Version number for the Bison executable that generated this parser.  */
  public static immutable string yy_bison_version = "3.8.2.12-013d-dirty";

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
    KEYWORD = 4,                   /* KEYWORD  */
    IDENT = 5,                     /* IDENT  */
    STRING = 6,                    /* STRING  */
    INTEGER = 7,                   /* INTEGER  */
    RELOP = 8,                     /* RELOP  */
    NUMBER = 9,                    /* NUMBER  */
    MATHFN = 10,                   /* MATHFN  */
    LET = 11,                      /* LET  */
    READ = 12,                     /* READ  */
    DATA = 13,                     /* DATA  */
    PRINT = 14,                    /* PRINT  */
    GO = 15,                       /* GO  */
    IF = 16,                       /* IF  */
    FOR = 17,                      /* FOR  */
    NEXT = 18,                     /* NEXT  */
    END = 19,                      /* END  */
    STOP = 20,                     /* STOP  */
    DEF = 21,                      /* DEF  */
    GOSUB = 22,                    /* GOSUB  */
    RETURN = 23,                   /* RETURN  */
    DIM = 24,                      /* DIM  */
    REM = 25,                      /* REM  */
    MAT = 26,                      /* MAT  */
    INPUT = 27,                    /* INPUT  */
    THEN = 28,                     /* THEN  */
    TO = 29,                       /* TO  */
    STEP = 30,                     /* STEP  */
    FN = 31,                       /* FN  */
    ZER = 32,                      /* ZER  */
    CON = 33,                      /* CON  */
    IDN = 34,                      /* IDN  */
    TRN = 35,                      /* TRN  */
    INV = 36,                      /* INV  */
    DET = 37,                      /* DET  */
    ASSIGN = 38,                   /* ASSIGN  */
    EQ = 39,                       /* EQ  */
    NE = 40,                       /* NE  */
    LT = 41,                       /* LT  */
    LE = 42,                       /* LE  */
    GE = 43,                       /* GE  */
    GT = 44,                       /* GT  */
    LPAREN = 45,                   /* LPAREN  */
    RPAREN = 46,                   /* RPAREN  */
    DOLLAR = 47,                   /* DOLLAR  */
    COMMA = 48,                    /* COMMA  */
    SEMICOLON = 49,                /* SEMICOLON  */
    EOL = 50,                      /* EOL  */
    WS = 51,                       /* WS  */
    BLANKLINE = 52,                /* BLANKLINE  */
    BADLINE = 53,                  /* BADLINE  */
    PLUS = 54,                     /* PLUS  */
    MINUS = 55,                    /* MINUS  */
    TIMES = 56,                    /* TIMES  */
    DIVIDE = 57,                   /* DIVIDE  */
    UMINUS = 58,                   /* UMINUS  */
    EXP = 59,                      /* EXP  */
    YYACCEPT = 60,                 /* $accept  */
    Stmts = 61,                    /* Stmts  */
    Stmt = 62,                     /* Stmt  */
    Lineno = 63,                   /* Lineno  */
    Print = 64,                    /* Print  */
    PrintSq = 65,                  /* PrintSq  */
    PrintSt = 66,                  /* PrintSt  */
    PrintEn = 67,                  /* PrintEn  */
    PrintTa = 68,                  /* PrintTa  */
    DataSq = 69,                   /* DataSq  */
    Data = 70,                     /* Data  */
    ReadSq = 71,                   /* ReadSq  */
    Read = 72,                     /* Read  */
    DimSq = 73,                    /* DimSq  */
    Dim = 74,                      /* Dim  */
    MatPr = 75,                    /* MatPr  */
    MatPrSq = 76,                  /* MatPrSq  */
    MatPrSt = 77,                  /* MatPrSt  */
    MatPrEn = 78,                  /* MatPrEn  */
    InputSq = 79,                  /* InputSq  */
    Input = 80,                    /* Input  */
    Expr = 81,                     /* Expr  */
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
  "end of file", "error", "invalid token", "LINENO", "KEYWORD", "IDENT",
  "STRING", "INTEGER", "RELOP", "NUMBER", "MATHFN", "LET", "READ", "DATA",
  "PRINT", "GO", "IF", "FOR", "NEXT", "END", "STOP", "DEF", "GOSUB",
  "RETURN", "DIM", "REM", "MAT", "INPUT", "THEN", "TO", "STEP", "FN",
  "ZER", "CON", "IDN", "TRN", "INV", "DET", "ASSIGN", "EQ", "NE", "LT",
  "LE", "GE", "GT", "LPAREN", "RPAREN", "DOLLAR", "COMMA", "SEMICOLON",
  "EOL", "WS", "BLANKLINE", "BADLINE", "PLUS", "MINUS", "TIMES", "DIVIDE",
  "UMINUS", "EXP", "$accept", "Stmts", "Stmt", "Lineno", "Print",
  "PrintSq", "PrintSt", "PrintEn", "PrintTa", "DataSq", "Data", "ReadSq",
  "Read", "DimSq", "Dim", "MatPr", "MatPrSq", "MatPrSt", "MatPrEn",
  "InputSq", "Input", "Expr", null
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
#line 48 "grammar.y"
                   { (yyval.Stmt) = new Stop(); next = next.link((yyval.Stmt)); }
      break;

    case 6: /* Stmt: PRINT Print EOL  */
#line 49 "grammar.y"
                          { (yyval.Stmt) = new Print(((yystack.valueAt (1)).Print)); next = next.link((yyval.Stmt)); }
      break;

    case 7: /* Stmt: GO TO INTEGER EOL  */
#line 50 "grammar.y"
                            { symtab.registerFlow(cast(ushort)((yystack.valueAt (1)).INTEGER)); (yyval.Stmt) = new Goto(cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 8: /* Stmt: GOSUB INTEGER EOL  */
#line 51 "grammar.y"
                            { symtab.registerFlow(cast(ushort)((yystack.valueAt (1)).INTEGER)); (yyval.Stmt) = new GoSub(cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 9: /* Stmt: LET IDENT ASSIGN Expr EOL  */
#line 52 "grammar.y"
                                    { (yyval.Stmt) = new Let(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 10: /* Stmt: LET IDENT LPAREN Expr RPAREN ASSIGN Expr EOL  */
#line 53 "grammar.y"
                                                       { (yyval.Stmt) = new LetDim(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 11: /* Stmt: LET IDENT LPAREN Expr COMMA Expr RPAREN ASSIGN Expr EOL  */
#line 54 "grammar.y"
                                                                  { (yyval.Stmt) = new LetDim2(((yystack.valueAt (8)).IDENT), ((yystack.valueAt (6)).Expr), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 12: /* Stmt: IF Expr RELOP Expr THEN INTEGER EOL  */
#line 55 "grammar.y"
                                              { (yyval.Stmt) = new If(((yystack.valueAt (5)).Expr), ((yystack.valueAt (4)).RELOP), ((yystack.valueAt (3)).Expr), cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 13: /* Stmt: IF Expr ASSIGN Expr THEN INTEGER EOL  */
#line 56 "grammar.y"
                                               { (yyval.Stmt) = new If(((yystack.valueAt (5)).Expr), TokenKind.EQ, ((yystack.valueAt (3)).Expr), cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 14: /* Stmt: FOR IDENT ASSIGN Expr TO Expr STEP Expr EOL  */
#line 57 "grammar.y"
                                                      { (yyval.Stmt) = new For(((yystack.valueAt (7)).IDENT), ((yystack.valueAt (5)).Expr), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 15: /* Stmt: FOR IDENT ASSIGN Expr TO Expr EOL  */
#line 58 "grammar.y"
                                            { (yyval.Stmt) = new For(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr), new Constant(symtab.installConstant(1.0))); next = next.link((yyval.Stmt)); }
      break;

    case 16: /* Stmt: NEXT IDENT EOL  */
#line 59 "grammar.y"
                         { (yyval.Stmt) = new Next(((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 17: /* Stmt: DATA DataSq EOL  */
#line 60 "grammar.y"
                          {}
      break;

    case 18: /* Stmt: READ ReadSq EOL  */
#line 61 "grammar.y"
                          {}
      break;

    case 19: /* Stmt: DIM DimSq EOL  */
#line 62 "grammar.y"
                        {}
      break;

    case 20: /* Stmt: DEF FN IDENT LPAREN IDENT RPAREN ASSIGN Expr EOL  */
#line 63 "grammar.y"
                                                           { symtab.initializeId(((yystack.valueAt (4)).IDENT)); symtab.addFunction(((yystack.valueAt (6)).IDENT), SymbolTable.Function(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (1)).Expr))); }
      break;

    case 21: /* Stmt: RETURN EOL  */
#line 64 "grammar.y"
                     { (yyval.Stmt) = new Return(); next = next.link((yyval.Stmt)); }
      break;

    case 22: /* Stmt: REM EOL  */
#line 65 "grammar.y"
                  { }
      break;

    case 23: /* Stmt: END EOL  */
#line 66 "grammar.y"
                  { if (For.pop() != -1) symtab.error("FOR WITHOUT NEXT"); symtab.endOfProgram(); }
      break;

    case 24: /* Stmt: MAT READ IDENT LPAREN Expr COMMA Expr RPAREN EOL  */
#line 68 "grammar.y"
                                                           { symtab.initializeMat(((yystack.valueAt (6)).IDENT), true); (yyval.Stmt) = new MatRead(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (2)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 25: /* Stmt: MAT READ IDENT LPAREN Expr RPAREN EOL  */
#line 69 "grammar.y"
                                                { symtab.initializeMat(((yystack.valueAt (4)).IDENT), true); (yyval.Stmt) = new MatRead(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (2)).Expr), new Constant(symtab.installConstant(1))); next = next.link((yyval.Stmt)); }
      break;

    case 26: /* Stmt: MAT PRINT MatPr EOL  */
#line 70 "grammar.y"
                              { (yyval.Stmt) = new MatPrint(((yystack.valueAt (1)).MatPr)); next = next.link((yyval.Stmt)); }
      break;

    case 27: /* Stmt: MAT IDENT ASSIGN IDENT PLUS IDENT EOL  */
#line 71 "grammar.y"
                                                { symtab.initializeMat(((yystack.valueAt (5)).IDENT), true); symtab.initializeMat(((yystack.valueAt (3)).IDENT)); symtab.initializeMat(((yystack.valueAt (1)).IDENT)); (yyval.Stmt) = new MatAdd(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 28: /* Stmt: MAT IDENT ASSIGN IDENT MINUS IDENT EOL  */
#line 72 "grammar.y"
                                                 { symtab.initializeMat(((yystack.valueAt (5)).IDENT), true); symtab.initializeMat(((yystack.valueAt (3)).IDENT)); symtab.initializeMat(((yystack.valueAt (1)).IDENT)); (yyval.Stmt) = new MatSub(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 29: /* Stmt: MAT IDENT ASSIGN IDENT TIMES IDENT EOL  */
#line 73 "grammar.y"
                                                 { symtab.initializeMat(((yystack.valueAt (5)).IDENT), true); symtab.initializeMat(((yystack.valueAt (3)).IDENT)); symtab.initializeMat(((yystack.valueAt (1)).IDENT)); (yyval.Stmt) = new MatMul(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 30: /* Stmt: MAT IDENT ASSIGN ZER LPAREN Expr COMMA Expr RPAREN EOL  */
#line 74 "grammar.y"
                                                                 { symtab.initializeMat(((yystack.valueAt (8)).IDENT), true); (yyval.Stmt) = new MatZerCon(((yystack.valueAt (8)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (2)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 31: /* Stmt: MAT IDENT ASSIGN CON LPAREN Expr COMMA Expr RPAREN EOL  */
#line 75 "grammar.y"
                                                                 { symtab.initializeMat(((yystack.valueAt (8)).IDENT), true); (yyval.Stmt) = new MatZerCon(((yystack.valueAt (8)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (2)).Expr), true); next = next.link((yyval.Stmt)); }
      break;

    case 32: /* Stmt: MAT IDENT ASSIGN IDN LPAREN Expr RPAREN EOL  */
#line 76 "grammar.y"
                                                      { symtab.initializeMat(((yystack.valueAt (6)).IDENT), true); (yyval.Stmt) = new MatIdn(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (2)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 33: /* Stmt: MAT IDENT ASSIGN TRN LPAREN IDENT RPAREN EOL  */
#line 77 "grammar.y"
                                                       { symtab.initializeMat(((yystack.valueAt (6)).IDENT), true); symtab.initializeMat(((yystack.valueAt (2)).IDENT)); (yyval.Stmt) = new MatTrn(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (2)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 34: /* Stmt: MAT IDENT ASSIGN INV LPAREN IDENT RPAREN EOL  */
#line 78 "grammar.y"
                                                       { symtab.initializeMat(((yystack.valueAt (6)).IDENT), true); symtab.initializeMat(((yystack.valueAt (2)).IDENT)); symtab.initializeId(symtab.installId("DET")); (yyval.Stmt) = new MatInv(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (2)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 35: /* Stmt: MAT IDENT ASSIGN LPAREN Expr RPAREN TIMES IDENT EOL  */
#line 79 "grammar.y"
                                                              { symtab.initializeMat(((yystack.valueAt (7)).IDENT), true); symtab.initializeMat(((yystack.valueAt (1)).IDENT)); (yyval.Stmt) = new MatScalar(((yystack.valueAt (7)).IDENT), ((yystack.valueAt (1)).IDENT), ((yystack.valueAt (4)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 36: /* Stmt: INPUT InputSq EOL  */
#line 81 "grammar.y"
                            {}
      break;

    case 37: /* Lineno: LINENO  */
#line 84 "grammar.y"
                 { if (symtab.end) symtab.error("STATEMENT AFTER END"); (yyval.Lineno) = new Line(((yystack.valueAt (0)).LINENO)); }
      break;

    case 38: /* Print: %empty  */
#line 87 "grammar.y"
                 { (yyval.Print) = new NewLine(); }
      break;

    case 39: /* Print: PrintEn  */
#line 88 "grammar.y"
                  { (yyval.Print) = ((yystack.valueAt (0)).PrintEn); }
      break;

    case 40: /* Print: PrintSq PrintEn  */
#line 89 "grammar.y"
                          { (yyval.Print) = ((yystack.valueAt (1)).PrintSq); (yyval.Print).linkLast(((yystack.valueAt (0)).PrintEn)); }
      break;

    case 41: /* PrintSq: PrintSt  */
#line 92 "grammar.y"
                  { (yyval.PrintSq) = ((yystack.valueAt (0)).PrintSt); }
      break;

    case 42: /* PrintSq: PrintSq PrintSt  */
#line 93 "grammar.y"
                          { (yyval.PrintSq).linkLast(((yystack.valueAt (0)).PrintSt)); }
      break;

    case 43: /* PrintSt: STRING SEMICOLON  */
#line 96 "grammar.y"
                           { (yyval.PrintSt) = new String(((yystack.valueAt (1)).STRING)); }
      break;

    case 44: /* PrintSt: STRING COMMA  */
#line 97 "grammar.y"
                       { (yyval.PrintSt) = new String(((yystack.valueAt (1)).STRING)); (yyval.PrintSt).linkLast(new Comma()); }
      break;

    case 45: /* PrintSt: Expr PrintTa  */
#line 98 "grammar.y"
                       { (yyval.PrintSt) = new PrintExpr(((yystack.valueAt (1)).Expr)); (yyval.PrintSt).linkLast(((yystack.valueAt (0)).PrintTa)); }
      break;

    case 46: /* PrintSt: STRING Expr PrintTa  */
#line 99 "grammar.y"
                              { (yyval.PrintSt) = new String(((yystack.valueAt (2)).STRING)); (yyval.PrintSt).linkLast(new PrintExpr(((yystack.valueAt (1)).Expr))); (yyval.PrintSt).linkLast(((yystack.valueAt (0)).PrintTa)); }
      break;

    case 47: /* PrintEn: STRING  */
#line 102 "grammar.y"
                 { (yyval.PrintEn) = new String(((yystack.valueAt (0)).STRING)); (yyval.PrintEn).linkLast(new NewLine()); }
      break;

    case 48: /* PrintEn: Expr  */
#line 103 "grammar.y"
               { (yyval.PrintEn) = new PrintExpr(((yystack.valueAt (0)).Expr)); (yyval.PrintEn).linkLast(new NewLine()); }
      break;

    case 49: /* PrintEn: STRING Expr  */
#line 104 "grammar.y"
                      { (yyval.PrintEn) = new String(((yystack.valueAt (1)).STRING)); (yyval.PrintEn).linkLast(new PrintExpr(((yystack.valueAt (0)).Expr))); (yyval.PrintEn).linkLast(new NewLine()); }
      break;

    case 50: /* PrintEn: PrintSt  */
#line 105 "grammar.y"
                  { (yyval.PrintEn) = ((yystack.valueAt (0)).PrintSt); }
      break;

    case 51: /* PrintTa: COMMA  */
#line 108 "grammar.y"
                { (yyval.PrintTa) = new Comma(); }
      break;

    case 52: /* PrintTa: SEMICOLON  */
#line 109 "grammar.y"
                    { (yyval.PrintTa) = new SemiColon(); }
      break;

    case 53: /* DataSq: Data  */
#line 112 "grammar.y"
               {}
      break;

    case 54: /* DataSq: DataSq COMMA Data  */
#line 113 "grammar.y"
                            {}
      break;

    case 55: /* Data: INTEGER  */
#line 116 "grammar.y"
                  { symtab.installData(((yystack.valueAt (0)).INTEGER)); }
      break;

    case 56: /* Data: NUMBER  */
#line 117 "grammar.y"
                 { symtab.installData(((yystack.valueAt (0)).NUMBER)); }
      break;

    case 57: /* Data: MINUS INTEGER  */
#line 118 "grammar.y"
                        { symtab.installData(-((yystack.valueAt (0)).INTEGER)); }
      break;

    case 58: /* Data: MINUS NUMBER  */
#line 119 "grammar.y"
                       { symtab.installData(-((yystack.valueAt (0)).NUMBER)); }
      break;

    case 59: /* ReadSq: Read  */
#line 122 "grammar.y"
               {}
      break;

    case 60: /* ReadSq: ReadSq COMMA Read  */
#line 123 "grammar.y"
                            {}
      break;

    case 61: /* Read: IDENT  */
#line 126 "grammar.y"
                { (yyval.Read) = new Read(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Read)); }
      break;

    case 62: /* Read: IDENT LPAREN Expr RPAREN  */
#line 127 "grammar.y"
                                   { (yyval.Read) = new ReadDim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Read)); }
      break;

    case 63: /* Read: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 128 "grammar.y"
                                              { (yyval.Read) = new ReadDim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Read)); }
      break;

    case 64: /* DimSq: Dim  */
#line 131 "grammar.y"
              {}
      break;

    case 65: /* DimSq: DimSq COMMA Dim  */
#line 132 "grammar.y"
                          {}
      break;

    case 66: /* Dim: IDENT LPAREN INTEGER RPAREN  */
#line 135 "grammar.y"
                                      { symtab.initializeDim(((yystack.valueAt (3)).IDENT), true, cast(ushort)((yystack.valueAt (1)).INTEGER)); }
      break;

    case 67: /* Dim: IDENT LPAREN INTEGER COMMA INTEGER RPAREN  */
#line 136 "grammar.y"
                                                    { symtab.initializeDim2(((yystack.valueAt (5)).IDENT), true, cast(ushort)((yystack.valueAt (3)).INTEGER), cast(ushort)((yystack.valueAt (1)).INTEGER)); }
      break;

    case 68: /* MatPr: MatPrEn  */
#line 139 "grammar.y"
                  { (yyval.MatPr) = ((yystack.valueAt (0)).MatPrEn); }
      break;

    case 69: /* MatPr: MatPrSq MatPrEn  */
#line 140 "grammar.y"
                          { (yyval.MatPr) = ((yystack.valueAt (1)).MatPrSq); (yyval.MatPr).linkLast(((yystack.valueAt (0)).MatPrEn)); }
      break;

    case 70: /* MatPrSq: MatPrSt  */
#line 143 "grammar.y"
                  { (yyval.MatPrSq) = ((yystack.valueAt (0)).MatPrSt); }
      break;

    case 71: /* MatPrSq: MatPrSq MatPrSt  */
#line 144 "grammar.y"
                          { (yyval.MatPrSq).linkLast(((yystack.valueAt (0)).MatPrSt)); }
      break;

    case 72: /* MatPrSt: IDENT COMMA  */
#line 147 "grammar.y"
                      { symtab.initializeMat(((yystack.valueAt (1)).IDENT)); (yyval.MatPrSt) = new MatFullPrint(((yystack.valueAt (1)).IDENT)); }
      break;

    case 73: /* MatPrSt: IDENT SEMICOLON  */
#line 148 "grammar.y"
                          { symtab.initializeMat(((yystack.valueAt (1)).IDENT)); (yyval.MatPrSt) = new MatFullPrint(((yystack.valueAt (1)).IDENT), true); }
      break;

    case 74: /* MatPrEn: IDENT  */
#line 151 "grammar.y"
                { symtab.initializeMat(((yystack.valueAt (0)).IDENT)); (yyval.MatPrEn) = new MatFullPrint(((yystack.valueAt (0)).IDENT)); }
      break;

    case 75: /* MatPrEn: IDENT SEMICOLON  */
#line 152 "grammar.y"
                          { symtab.initializeMat(((yystack.valueAt (1)).IDENT)); (yyval.MatPrEn) = new MatFullPrint(((yystack.valueAt (1)).IDENT), true); }
      break;

    case 76: /* InputSq: Input  */
#line 155 "grammar.y"
                {}
      break;

    case 77: /* InputSq: InputSq COMMA Input  */
#line 156 "grammar.y"
                              {}
      break;

    case 78: /* Input: IDENT  */
#line 159 "grammar.y"
                { (yyval.Input) = new Input(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Input)); }
      break;

    case 79: /* Input: IDENT LPAREN Expr RPAREN  */
#line 160 "grammar.y"
                                   { (yyval.Input) = new InputDim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Input)); }
      break;

    case 80: /* Input: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 161 "grammar.y"
                                              { (yyval.Input) = new InputDim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Input)); }
      break;

    case 81: /* Expr: NUMBER  */
#line 164 "grammar.y"
                 { (yyval.Expr) = new Constant(symtab.installConstant(((yystack.valueAt (0)).NUMBER))); }
      break;

    case 82: /* Expr: INTEGER  */
#line 165 "grammar.y"
                  { (yyval.Expr) = new Constant(symtab.installConstant(((yystack.valueAt (0)).INTEGER))); }
      break;

    case 83: /* Expr: IDENT  */
#line 166 "grammar.y"
                { (yyval.Expr) = new Identifier(((yystack.valueAt (0)).IDENT)); }
      break;

    case 84: /* Expr: MATHFN Expr RPAREN  */
#line 167 "grammar.y"
                             { (yyval.Expr) = new MathFn(((yystack.valueAt (2)).MATHFN), ((yystack.valueAt (1)).Expr)); }
      break;

    case 85: /* Expr: FN IDENT LPAREN Expr RPAREN  */
#line 168 "grammar.y"
                                      { (yyval.Expr) = new FnCall(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); }
      break;

    case 86: /* Expr: IDENT LPAREN Expr RPAREN  */
#line 169 "grammar.y"
                                   { (yyval.Expr) = new Dim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); }
      break;

    case 87: /* Expr: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 170 "grammar.y"
                                              { (yyval.Expr) = new Dim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); }
      break;

    case 88: /* Expr: Expr PLUS Expr  */
#line 171 "grammar.y"
                         { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Add, ((yystack.valueAt (0)).Expr)); }
      break;

    case 89: /* Expr: Expr MINUS Expr  */
#line 172 "grammar.y"
                          { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Sub, ((yystack.valueAt (0)).Expr)); }
      break;

    case 90: /* Expr: Expr TIMES Expr  */
#line 173 "grammar.y"
                          { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Mul, ((yystack.valueAt (0)).Expr)); }
      break;

    case 91: /* Expr: Expr DIVIDE Expr  */
#line 174 "grammar.y"
                           { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Div, ((yystack.valueAt (0)).Expr)); }
      break;

    case 92: /* Expr: Expr EXP Expr  */
#line 175 "grammar.y"
                        { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Exp, ((yystack.valueAt (0)).Expr)); }
      break;

    case 93: /* Expr: MINUS Expr  */
#line 176 "grammar.y"
                                  { (yyval.Expr) = new Operation(((yystack.valueAt (0)).Expr), Op.Neg); }
      break;

    case 94: /* Expr: LPAREN Expr RPAREN  */
#line 177 "grammar.y"
                             { (yyval.Expr) = ((yystack.valueAt (1)).Expr); }
      break;

    case 95: /* Expr: DET  */
#line 178 "grammar.y"
              { (yyval.Expr) = new Identifier(symtab.installId("DET")); }
      break;


#line 930 "Parser.d"

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
  private static immutable short yypact_ninf_ = -48;

  /* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule which
     number is the opposite.  If YYTABLE_NINF_, syntax error.  */
  private static immutable short yytable_ninf_ = -76;

    /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
private static immutable short[] yypact_ =
[
     -48,   204,   -48,   -48,    10,    17,    -1,     7,     0,    66,
      41,    50,    13,    24,    36,    85,    27,    88,    44,    28,
      90,   -48,   -48,   -34,    54,   -47,   -48,   -48,   -48,    -2,
      -7,   -48,    55,    59,   -48,   -48,    66,    97,   -48,    66,
      66,    56,     7,    60,   -48,   294,   106,    -6,    67,    72,
     -48,   -48,   115,    73,   -48,    86,    -3,   -48,   -48,    92,
     129,   136,    94,    22,   -48,    66,    66,    66,    17,   -48,
     -48,   -48,    -1,   -48,    66,   -48,   -48,   294,   -36,   103,
     154,    91,   -48,    60,   -48,   -48,   -48,    66,    66,    66,
      66,    66,   -48,    99,    66,    66,    66,   -48,   111,   -48,
     135,    88,   -48,    83,   116,    35,   112,   136,   -48,   -48,
      66,    90,   -48,   134,   126,   186,   -48,   -48,   198,   -48,
     -48,    66,   -48,   -31,   -31,    91,    91,    91,   -48,    70,
      81,   -20,   158,    43,   -48,     5,   120,   130,   131,   132,
     133,    66,    66,   -48,   142,   -48,   -48,   -48,   210,   -48,
     -48,   141,    66,   -48,    66,   -48,    66,   228,   179,   187,
      66,   150,   -48,   191,   194,   196,   200,    66,    66,    66,
     201,   209,   234,   222,   -48,    66,    66,   240,   246,   252,
     -48,   183,   185,   114,   199,   190,   188,   189,   197,    98,
     304,   258,   202,   203,   195,   211,    66,   264,   312,   212,
     -48,   -48,   -48,   -48,    66,   -48,    66,   -48,   -48,   -48,
     -48,    66,    66,   213,   221,   223,   254,   -48,   270,   -48,
     -48,    66,   320,   328,   276,   282,   -48,   -48,   -48,   225,
     284,   336,   -48,   -48,   290,   295,   -48,   -48,   -48,   -48,
     -48
];

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
private static immutable byte[] yydefact_ =
[
       2,     0,     1,    37,     0,     0,     0,    38,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     4,     0,    61,     0,    59,    55,    56,     0,
       0,    53,    83,    47,    82,    81,     0,     0,    95,     0,
       0,     0,     0,    41,    39,    48,     0,     0,     0,     0,
      23,     5,     0,     0,    21,     0,     0,    64,    22,     0,
       0,     0,    78,     0,    76,     0,     0,     0,     0,    18,
      57,    58,     0,    17,     0,    44,    43,    49,     0,     0,
       0,    93,     6,    42,    40,    51,    52,     0,     0,     0,
       0,     0,    45,     0,     0,     0,     0,    16,     0,     8,
       0,     0,    19,     0,     0,    74,     0,     0,    70,    68,
       0,     0,    36,     0,     0,     0,    60,    54,     0,    46,
      84,     0,    94,    88,    89,    90,    91,    92,     7,     0,
       0,     0,     0,     0,    65,     0,     0,     0,     0,     0,
       0,     0,     0,    72,    73,    26,    71,    69,     0,    77,
       9,     0,     0,    62,     0,    86,     0,     0,     0,     0,
       0,     0,    66,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
      85,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      63,    87,    12,    13,     0,    15,     0,    67,    27,    28,
      29,     0,     0,     0,     0,     0,     0,    25,     0,    80,
      10,     0,     0,     0,     0,     0,    32,    33,    34,     0,
       0,     0,    14,    20,     0,     0,    35,    24,    11,    30,
      31
];

  /* YYPGOTO[NTERM-NUM].  */
private static immutable short[] yypgoto_ =
[
     -48,   -48,   -48,   -48,   -48,   -48,   218,   220,   267,   -48,
     274,   -48,   279,   -48,   171,   -48,   -48,   247,   248,   -48,
     245,    -9
];

  /* YYDEFGOTO[NTERM-NUM].  */
private static immutable byte[] yydefgoto_ =
[
       0,     1,    21,    22,    41,    42,    43,    44,    92,    30,
      31,    25,    26,    56,    57,   106,   107,   108,   109,    63,
      64,    45
];

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
private static immutable short[] yytable_ =
[
      47,    68,    94,    69,    65,    70,    27,    71,    28,   160,
     120,    66,    32,    33,    34,    23,    35,    36,    87,    88,
      89,    90,    24,    91,    77,    89,    90,    78,    91,    46,
      80,    81,    95,    59,    87,    88,    89,    90,    37,    91,
      60,    72,    61,    73,    38,   101,    48,   102,    87,    88,
      89,    90,    39,    91,    29,    49,   113,   114,   115,   164,
     165,   166,    40,    50,    32,   118,    34,    52,    35,    36,
     111,    32,   112,    34,    51,    35,    36,    54,   123,   124,
     125,   126,   127,   143,   144,   129,   130,   131,   135,   162,
      37,   163,    53,    55,    58,    62,    38,    37,   158,    67,
      74,   148,    79,    38,    39,    96,    82,    75,    76,   159,
     -50,    39,   157,    93,    40,   136,   137,   138,   139,   140,
      98,    40,    97,    99,    87,    88,    89,    90,   141,    91,
     103,   100,   172,   173,   104,    87,    88,    89,    90,   110,
      91,   105,   133,   177,   204,   178,   211,   179,   121,   128,
      91,   183,    87,    88,    89,    90,   132,    91,   189,   190,
     191,   142,   145,   161,   205,   167,   197,   198,    87,    88,
      89,    90,   151,    91,   152,   168,   169,   170,   171,   176,
      87,    88,    89,    90,   150,    91,   181,   218,    87,    88,
      89,    90,   -75,    91,   182,   222,   184,   223,   185,   186,
     122,   187,   224,   225,     2,   188,   192,     3,    87,    88,
      89,    90,   231,    91,   193,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,   153,   202,   154,   203,   207,   206,   208,   209,
      87,    88,    89,    90,   155,    91,   156,   210,   214,   215,
     221,   216,    87,    88,    89,    90,   174,    91,   175,   229,
      83,   217,    84,   226,    87,    88,    89,    90,   195,    91,
     196,   227,   134,   228,   180,   236,    87,    88,    89,    90,
     194,    91,    87,    88,    89,    90,   199,    91,    87,    88,
      89,    90,   200,    91,    87,    88,    89,    90,   201,    91,
      87,    88,    89,    90,   213,    91,    87,    88,    89,    90,
     219,    91,    87,    88,    89,    90,   230,    91,    87,    88,
      89,    90,   234,    91,    87,    88,    89,    90,   235,    91,
      87,    88,    89,    90,   237,    91,    87,    88,    89,    90,
     239,    91,    85,    86,   119,   240,   117,   116,    87,    88,
      89,    90,   212,    91,   146,   147,   149,     0,    87,    88,
      89,    90,   220,    91,     0,     0,    87,    88,    89,    90,
     232,    91,     0,     0,    87,    88,    89,    90,   233,    91,
       0,     0,    87,    88,    89,    90,   238,    91,     0,     0,
      87,    88,    89,    90,     0,    91
];

private static immutable short[] yycheck_ =
[
       9,    48,     8,    50,    38,     7,     7,     9,     9,    29,
      46,    45,     5,     6,     7,     5,     9,    10,    54,    55,
      56,    57,     5,    59,    33,    56,    57,    36,    59,    29,
      39,    40,    38,     5,    54,    55,    56,    57,    31,    59,
      12,    48,    14,    50,    37,    48,     5,    50,    54,    55,
      56,    57,    45,    59,    55,     5,    65,    66,    67,    54,
      55,    56,    55,    50,     5,    74,     7,    31,     9,    10,
      48,     5,    50,     7,    50,     9,    10,    50,    87,    88,
      89,    90,    91,    48,    49,    94,    95,    96,     5,    46,
      31,    48,     7,     5,    50,     5,    37,    31,    28,    45,
      45,   110,     5,    37,    45,    38,    50,    48,    49,    28,
      50,    45,   121,     7,    55,    32,    33,    34,    35,    36,
       5,    55,    50,    50,    54,    55,    56,    57,    45,    59,
      38,    45,   141,   142,     5,    54,    55,    56,    57,    45,
      59,     5,     7,   152,    30,   154,    48,   156,    45,    50,
      59,   160,    54,    55,    56,    57,    45,    59,   167,   168,
     169,    45,    50,     5,    50,    45,   175,   176,    54,    55,
      56,    57,    46,    59,    48,    45,    45,    45,    45,    38,
      54,    55,    56,    57,    50,    59,     7,   196,    54,    55,
      56,    57,    50,    59,     7,   204,    46,   206,     7,     5,
      46,     5,   211,   212,     0,     5,     5,     3,    54,    55,
      56,    57,   221,    59,     5,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    46,    50,    48,    50,    46,    38,    50,    50,
      54,    55,    56,    57,    46,    59,    48,    50,    46,    46,
      38,    56,    54,    55,    56,    57,    46,    59,    48,     5,
      42,    50,    42,    50,    54,    55,    56,    57,    46,    59,
      48,    50,   101,    50,    46,    50,    54,    55,    56,    57,
      46,    59,    54,    55,    56,    57,    46,    59,    54,    55,
      56,    57,    46,    59,    54,    55,    56,    57,    46,    59,
      54,    55,    56,    57,    46,    59,    54,    55,    56,    57,
      46,    59,    54,    55,    56,    57,    46,    59,    54,    55,
      56,    57,    46,    59,    54,    55,    56,    57,    46,    59,
      54,    55,    56,    57,    50,    59,    54,    55,    56,    57,
      50,    59,    48,    49,    77,    50,    72,    68,    54,    55,
      56,    57,    48,    59,   107,   107,   111,    -1,    54,    55,
      56,    57,    50,    59,    -1,    -1,    54,    55,    56,    57,
      50,    59,    -1,    -1,    54,    55,    56,    57,    50,    59,
      -1,    -1,    54,    55,    56,    57,    50,    59,    -1,    -1,
      54,    55,    56,    57,    -1,    59
];

  /* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
     state STATE-NUM.  */
private static immutable byte[] yystos_ =
[
       0,    61,     0,     3,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    62,    63,     5,     5,    71,    72,     7,     9,    55,
      69,    70,     5,     6,     7,     9,    10,    31,    37,    45,
      55,    64,    65,    66,    67,    81,    29,    81,     5,     5,
      50,    50,    31,     7,    50,     5,    73,    74,    50,     5,
      12,    14,     5,    79,    80,    38,    45,    45,    48,    50,
       7,     9,    48,    50,    45,    48,    49,    81,    81,     5,
      81,    81,    50,    66,    67,    48,    49,    54,    55,    56,
      57,    59,    68,     7,     8,    38,    38,    50,     5,    50,
      45,    48,    50,    38,     5,     5,    75,    76,    77,    78,
      45,    48,    50,    81,    81,    81,    72,    70,    81,    68,
      46,    45,    46,    81,    81,    81,    81,    81,    50,    81,
      81,    81,    45,     7,    74,     5,    32,    33,    34,    35,
      36,    45,    45,    48,    49,    50,    77,    78,    81,    80,
      50,    46,    48,    46,    48,    46,    48,    81,    28,    28,
      29,     5,    46,    48,    54,    55,    56,    45,    45,    45,
      45,    45,    81,    81,    46,    48,    38,    81,    81,    81,
      46,     7,     7,    81,    46,     7,     5,     5,     5,    81,
      81,    81,     5,     5,    46,    46,    48,    81,    81,    46,
      46,    46,    50,    50,    30,    50,    38,    46,    50,    50,
      50,    48,    48,    46,    46,    46,    56,    50,    81,    46,
      50,    38,    81,    81,    81,    81,    50,    50,    50,     5,
      46,    81,    50,    50,    46,    46,    50,    50,    50,    50,
      50
];

  /* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
private static immutable byte[] yyr1_ =
[
       0,    60,    61,    61,    62,    62,    62,    62,    62,    62,
      62,    62,    62,    62,    62,    62,    62,    62,    62,    62,
      62,    62,    62,    62,    62,    62,    62,    62,    62,    62,
      62,    62,    62,    62,    62,    62,    62,    63,    64,    64,
      64,    65,    65,    66,    66,    66,    66,    67,    67,    67,
      67,    68,    68,    69,    69,    70,    70,    70,    70,    71,
      71,    72,    72,    72,    73,    73,    74,    74,    75,    75,
      76,    76,    77,    77,    78,    78,    79,    79,    80,    80,
      80,    81,    81,    81,    81,    81,    81,    81,    81,    81,
      81,    81,    81,    81,    81,    81
];

  /* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
private static immutable byte[] yyr2_ =
[
       0,     2,     0,     2,     1,     2,     3,     4,     3,     5,
       8,    10,     7,     7,     9,     7,     3,     3,     3,     3,
       9,     2,     2,     2,     9,     7,     4,     7,     7,     7,
      10,    10,     8,     8,     8,     9,     3,     1,     0,     1,
       2,     1,     2,     2,     2,     2,     3,     1,     1,     2,
       1,     1,     1,     1,     3,     1,     1,     2,     2,     1,
       3,     1,     4,     6,     1,     3,     4,     6,     1,     2,
       1,     2,     2,     2,     1,     2,     1,     3,     1,     4,
       6,     1,     1,     1,     3,     5,     4,     6,     3,     3,
       3,     3,     3,     2,     3,     1
];




  private static auto yytranslate_ (int t)
  {
    return SymbolKind(t);
  }

  private static immutable int yylast_ = 395;
  private static immutable int yynnts_ = 22;
  private static immutable int yyfinal_ = 2;
  private static immutable int yyntokens_ = 60;

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
    import Print : Print, NewLine, Comma, SemiColon, String, PrintExpr;
    import Mat : MatRead, MatPrint, MatFullPrint, MatAdd, MatSub, MatMul, MatZerCon, MatIdn, MatTrn, MatInv, MatScalar;

#line 1614 "Parser.d"

}

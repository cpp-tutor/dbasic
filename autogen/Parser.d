/* A Bison parser, made by GNU Bison 3.8.2.12-013d.  */

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
  Parser.Expr[] ExprSq;                  /* ExprSq  */
  Parser.Node Stmt;                        /* Stmt  */
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
  Parser.Node MatRead;                     /* MatRead  */
  Parser.Node Input;                       /* Input  */
  Parser.StringExpr StrExpr;               /* StrExpr  */
  double NUMBER;                           /* NUMBER  */
  int KEYWORD;                             /* KEYWORD  */
  int IDENT;                               /* IDENT  */
  int STRING;                              /* STRING  */
  int INTEGER;                             /* INTEGER  */
  int RELOP;                               /* RELOP  */
  int DATASTRING;                          /* DATASTRING  */
  int[] IdSq;                            /* IdSq  */
  int[] GotoSq;                          /* GotoSq  */
  string MATHFN;                           /* MATHFN  */
  ushort LINENO;                           /* LINENO  */

#line 143 "Parser.d"

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
  DATASTRING = 9,
  NUMBER = 10,
  MATHFN = 11,
  LET = 12,
  READ = 13,
  DATA = 14,
  PRINT = 15,
  GO = 16,
  IF = 17,
  FOR = 18,
  NEXT = 19,
  END = 20,
  STOP = 21,
  DEF = 22,
  GOSUB = 23,
  RETURN = 24,
  DIM = 25,
  REM = 26,
  MAT = 27,
  RESTORE = 28,
  INPUT = 29,
  CHANGE = 30,
  RANDOM = 31,
  THEN = 32,
  TO = 33,
  STEP = 34,
  FN = 35,
  ZER = 36,
  CON = 37,
  IDN = 38,
  TRN = 39,
  INV = 40,
  DET = 41,
  NUM = 42,
  ON = 43,
  TAB = 44,
  RND = 45,
  ASSIGN = 46,
  EQ = 47,
  NE = 48,
  LT = 49,
  LE = 50,
  GE = 51,
  GT = 52,
  LPAREN = 53,
  RPAREN = 54,
  DOLLAR = 55,
  COMMA = 56,
  SEMICOLON = 57,
  APOSTROPHE = 58,
  EOL = 59,
  WS = 60,
  BLANKLINE = 61,
  BADLINE = 62,
  PLUS = 63,
  MINUS = 64,
  TIMES = 65,
  DIVIDE = 66,
  UMINUS = 67,
  EXP = 68,
}

class Parser
{
  /** Version number for the Bison executable that generated this parser.  */
  public static immutable string yy_bison_version = "3.8.2.12-013d";

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
    DATASTRING = 9,                /* DATASTRING  */
    NUMBER = 10,                   /* NUMBER  */
    MATHFN = 11,                   /* MATHFN  */
    LET = 12,                      /* LET  */
    READ = 13,                     /* READ  */
    DATA = 14,                     /* DATA  */
    PRINT = 15,                    /* PRINT  */
    GO = 16,                       /* GO  */
    IF = 17,                       /* IF  */
    FOR = 18,                      /* FOR  */
    NEXT = 19,                     /* NEXT  */
    END = 20,                      /* END  */
    STOP = 21,                     /* STOP  */
    DEF = 22,                      /* DEF  */
    GOSUB = 23,                    /* GOSUB  */
    RETURN = 24,                   /* RETURN  */
    DIM = 25,                      /* DIM  */
    REM = 26,                      /* REM  */
    MAT = 27,                      /* MAT  */
    RESTORE = 28,                  /* RESTORE  */
    INPUT = 29,                    /* INPUT  */
    CHANGE = 30,                   /* CHANGE  */
    RANDOM = 31,                   /* RANDOM  */
    THEN = 32,                     /* THEN  */
    TO = 33,                       /* TO  */
    STEP = 34,                     /* STEP  */
    FN = 35,                       /* FN  */
    ZER = 36,                      /* ZER  */
    CON = 37,                      /* CON  */
    IDN = 38,                      /* IDN  */
    TRN = 39,                      /* TRN  */
    INV = 40,                      /* INV  */
    DET = 41,                      /* DET  */
    NUM = 42,                      /* NUM  */
    ON = 43,                       /* ON  */
    TAB = 44,                      /* TAB  */
    RND = 45,                      /* RND  */
    ASSIGN = 46,                   /* ASSIGN  */
    EQ = 47,                       /* EQ  */
    NE = 48,                       /* NE  */
    LT = 49,                       /* LT  */
    LE = 50,                       /* LE  */
    GE = 51,                       /* GE  */
    GT = 52,                       /* GT  */
    LPAREN = 53,                   /* LPAREN  */
    RPAREN = 54,                   /* RPAREN  */
    DOLLAR = 55,                   /* DOLLAR  */
    COMMA = 56,                    /* COMMA  */
    SEMICOLON = 57,                /* SEMICOLON  */
    APOSTROPHE = 58,               /* APOSTROPHE  */
    EOL = 59,                      /* EOL  */
    WS = 60,                       /* WS  */
    BLANKLINE = 61,                /* BLANKLINE  */
    BADLINE = 62,                  /* BADLINE  */
    PLUS = 63,                     /* PLUS  */
    MINUS = 64,                    /* MINUS  */
    TIMES = 65,                    /* TIMES  */
    DIVIDE = 66,                   /* DIVIDE  */
    UMINUS = 67,                   /* UMINUS  */
    EXP = 68,                      /* EXP  */
    YYACCEPT = 69,                 /* $accept  */
    Stmts = 70,                    /* Stmts  */
    Stmt = 71,                     /* Stmt  */
    Print = 72,                    /* Print  */
    PrintSq = 73,                  /* PrintSq  */
    PrintSt = 74,                  /* PrintSt  */
    PrintEn = 75,                  /* PrintEn  */
    PrintTa = 76,                  /* PrintTa  */
    DataSq = 77,                   /* DataSq  */
    Data = 78,                     /* Data  */
    ReadSq = 79,                   /* ReadSq  */
    Read = 80,                     /* Read  */
    DimSq = 81,                    /* DimSq  */
    Dim = 82,                      /* Dim  */
    IdSq = 83,                     /* IdSq  */
    ExprSq = 84,                   /* ExprSq  */
    MatPr = 85,                    /* MatPr  */
    MatPrSq = 86,                  /* MatPrSq  */
    MatPrSt = 87,                  /* MatPrSt  */
    MatPrEn = 88,                  /* MatPrEn  */
    MatRdSq = 89,                  /* MatRdSq  */
    MatRead = 90,                  /* MatRead  */
    InputSq = 91,                  /* InputSq  */
    Input = 92,                    /* Input  */
    Expr = 93,                     /* Expr  */
    StrExpr = 94,                  /* StrExpr  */
    GotoThen = 95,                 /* GotoThen  */
    GotoSq = 96,                   /* GotoSq  */
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
  "STRING", "INTEGER", "RELOP", "DATASTRING", "NUMBER", "MATHFN", "LET",
  "READ", "DATA", "PRINT", "GO", "IF", "FOR", "NEXT", "END", "STOP", "DEF",
  "GOSUB", "RETURN", "DIM", "REM", "MAT", "RESTORE", "INPUT", "CHANGE",
  "RANDOM", "THEN", "TO", "STEP", "FN", "ZER", "CON", "IDN", "TRN", "INV",
  "DET", "NUM", "ON", "TAB", "RND", "ASSIGN", "EQ", "NE", "LT", "LE", "GE",
  "GT", "LPAREN", "RPAREN", "DOLLAR", "COMMA", "SEMICOLON", "APOSTROPHE",
  "EOL", "WS", "BLANKLINE", "BADLINE", "PLUS", "MINUS", "TIMES", "DIVIDE",
  "UMINUS", "EXP", "$accept", "Stmts", "Stmt", "Print", "PrintSq",
  "PrintSt", "PrintEn", "PrintTa", "DataSq", "Data", "ReadSq", "Read",
  "DimSq", "Dim", "IdSq", "ExprSq", "MatPr", "MatPrSq", "MatPrSt",
  "MatPrEn", "MatRdSq", "MatRead", "InputSq", "Input", "Expr", "StrExpr",
  "GotoThen", "GotoSq", null
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
    case 4: /* Stmt: LINENO  */
#line 49 "grammar.y"
                 { (yyval.Stmt) = new Line(((yystack.valueAt (0)).LINENO)); next = next.link((yyval.Stmt)); }
      break;

    case 5: /* Stmt: STOP EOL  */
#line 51 "grammar.y"
                   { (yyval.Stmt) = new Stop(); next = next.link((yyval.Stmt)); }
      break;

    case 6: /* Stmt: PRINT Print EOL  */
#line 52 "grammar.y"
                          { (yyval.Stmt) = new Branch(((yystack.valueAt (1)).Print)); next = next.link((yyval.Stmt)); }
      break;

    case 7: /* Stmt: GO TO INTEGER EOL  */
#line 53 "grammar.y"
                            { (yyval.Stmt) = new Goto(cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 8: /* Stmt: GOSUB INTEGER EOL  */
#line 54 "grammar.y"
                            { (yyval.Stmt) = new GoSub(cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 9: /* Stmt: LET IDENT ASSIGN Expr EOL  */
#line 55 "grammar.y"
                                    { (yyval.Stmt) = new Let(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 10: /* Stmt: LET IDENT LPAREN Expr RPAREN ASSIGN Expr EOL  */
#line 56 "grammar.y"
                                                       { (yyval.Stmt) = new LetDim(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 11: /* Stmt: LET IDENT LPAREN Expr COMMA Expr RPAREN ASSIGN Expr EOL  */
#line 57 "grammar.y"
                                                                  { (yyval.Stmt) = new LetDim2(((yystack.valueAt (8)).IDENT), ((yystack.valueAt (6)).Expr), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 12: /* Stmt: IF Expr RELOP Expr THEN INTEGER EOL  */
#line 58 "grammar.y"
                                              { (yyval.Stmt) = new If(((yystack.valueAt (5)).Expr), ((yystack.valueAt (4)).RELOP), ((yystack.valueAt (3)).Expr), cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 13: /* Stmt: IF Expr ASSIGN Expr THEN INTEGER EOL  */
#line 59 "grammar.y"
                                               { (yyval.Stmt) = new If(((yystack.valueAt (5)).Expr), TokenKind.EQ, ((yystack.valueAt (3)).Expr), cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 14: /* Stmt: FOR IDENT ASSIGN Expr TO Expr STEP Expr EOL  */
#line 60 "grammar.y"
                                                      { (yyval.Stmt) = new For(((yystack.valueAt (7)).IDENT), ((yystack.valueAt (5)).Expr), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 15: /* Stmt: FOR IDENT ASSIGN Expr TO Expr EOL  */
#line 61 "grammar.y"
                                            { (yyval.Stmt) = new For(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr), new Constant(symtab.installConstant(1.0))); next = next.link((yyval.Stmt)); }
      break;

    case 16: /* Stmt: NEXT IDENT EOL  */
#line 62 "grammar.y"
                         { (yyval.Stmt) = new Next(((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 17: /* Stmt: DATA DataSq EOL  */
#line 63 "grammar.y"
                          {}
      break;

    case 18: /* Stmt: READ ReadSq EOL  */
#line 64 "grammar.y"
                          {}
      break;

    case 19: /* Stmt: DIM DimSq EOL  */
#line 65 "grammar.y"
                        {}
      break;

    case 20: /* Stmt: DEF FN IDENT LPAREN IdSq RPAREN ASSIGN Expr EOL  */
#line 66 "grammar.y"
                                                          { foreach(id; ((yystack.valueAt (4)).IdSq)) symtab.initializeId(id); symtab.addFunction(((yystack.valueAt (6)).IDENT), SymbolTable.Function(((yystack.valueAt (4)).IdSq), ((yystack.valueAt (1)).Expr), -1, ((yystack.valueAt (4)).IdSq).length)); }
      break;

    case 21: /* Stmt: DEF FN IDENT ASSIGN Expr EOL  */
#line 67 "grammar.y"
                                       { symtab.addFunction(((yystack.valueAt (3)).IDENT), SymbolTable.Function(new int[0], ((yystack.valueAt (1)).Expr), -1, 0)); }
      break;

    case 22: /* Stmt: RETURN EOL  */
#line 68 "grammar.y"
                     { (yyval.Stmt) = new Return(); next = next.link((yyval.Stmt)); }
      break;

    case 23: /* Stmt: REM EOL  */
#line 69 "grammar.y"
                  { }
      break;

    case 24: /* Stmt: END EOL  */
#line 70 "grammar.y"
                  { symtab.checkReferences(); return YYACCEPT; }
      break;

    case 25: /* Stmt: MAT READ MatRdSq EOL  */
#line 72 "grammar.y"
                               {}
      break;

    case 26: /* Stmt: MAT PRINT MatPr EOL  */
#line 73 "grammar.y"
                              { (yyval.Stmt) = new Branch(((yystack.valueAt (1)).MatPr)); next = next.link((yyval.Stmt)); }
      break;

    case 27: /* Stmt: MAT IDENT ASSIGN IDENT PLUS IDENT EOL  */
#line 74 "grammar.y"
                                                { (yyval.Stmt) = new MatAdd(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 28: /* Stmt: MAT IDENT ASSIGN IDENT MINUS IDENT EOL  */
#line 75 "grammar.y"
                                                 { (yyval.Stmt) = new MatSub(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 29: /* Stmt: MAT IDENT ASSIGN IDENT TIMES IDENT EOL  */
#line 76 "grammar.y"
                                                 { (yyval.Stmt) = new MatMul(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 30: /* Stmt: MAT IDENT ASSIGN ZER LPAREN Expr COMMA Expr RPAREN EOL  */
#line 77 "grammar.y"
                                                                 { (yyval.Stmt) = new MatZerCon(((yystack.valueAt (8)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (2)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 31: /* Stmt: MAT IDENT ASSIGN CON LPAREN Expr COMMA Expr RPAREN EOL  */
#line 78 "grammar.y"
                                                                 { (yyval.Stmt) = new MatZerCon(((yystack.valueAt (8)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (2)).Expr), true); next = next.link((yyval.Stmt)); }
      break;

    case 32: /* Stmt: MAT IDENT ASSIGN IDN LPAREN Expr RPAREN EOL  */
#line 79 "grammar.y"
                                                      { (yyval.Stmt) = new MatIdn(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (2)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 33: /* Stmt: MAT IDENT ASSIGN TRN LPAREN IDENT RPAREN EOL  */
#line 80 "grammar.y"
                                                       { (yyval.Stmt) = new MatTrn(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (2)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 34: /* Stmt: MAT IDENT ASSIGN INV LPAREN IDENT RPAREN EOL  */
#line 81 "grammar.y"
                                                       { (yyval.Stmt) = new MatInv(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (2)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 35: /* Stmt: MAT IDENT ASSIGN LPAREN Expr RPAREN TIMES IDENT EOL  */
#line 82 "grammar.y"
                                                              { (yyval.Stmt) = new MatScalar(((yystack.valueAt (7)).IDENT), ((yystack.valueAt (1)).IDENT), ((yystack.valueAt (4)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 36: /* Stmt: MAT IDENT ASSIGN ZER EOL  */
#line 84 "grammar.y"
                                   { (yyval.Stmt) = new MatZerConIdnDim(((yystack.valueAt (3)).IDENT), 0); next = next.link((yyval.Stmt)); }
      break;

    case 37: /* Stmt: MAT IDENT ASSIGN CON EOL  */
#line 85 "grammar.y"
                                   { (yyval.Stmt) = new MatZerConIdnDim(((yystack.valueAt (3)).IDENT), 1); next = next.link((yyval.Stmt)); }
      break;

    case 38: /* Stmt: MAT IDENT ASSIGN IDN EOL  */
#line 86 "grammar.y"
                                   { (yyval.Stmt) = new MatZerConIdnDim(((yystack.valueAt (3)).IDENT), 2); next = next.link((yyval.Stmt)); }
      break;

    case 39: /* Stmt: MAT INPUT IDENT EOL  */
#line 87 "grammar.y"
                              { (yyval.Stmt) = new MatInput(((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 40: /* Stmt: RESTORE EOL  */
#line 88 "grammar.y"
                      { (yyval.Stmt) = new Restore(); next = next.link((yyval.Stmt)); }
      break;

    case 41: /* Stmt: INPUT InputSq EOL  */
#line 89 "grammar.y"
                            {}
      break;

    case 42: /* Stmt: LET IDENT DOLLAR ASSIGN StrExpr EOL  */
#line 91 "grammar.y"
                                              { (yyval.Stmt) = new LetString(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (1)).StrExpr)); next = next.link((yyval.Stmt)); }
      break;

    case 43: /* Stmt: LET IDENT DOLLAR LPAREN Expr RPAREN ASSIGN StrExpr EOL  */
#line 92 "grammar.y"
                                                                 { (yyval.Stmt) = new LetDimString(((yystack.valueAt (7)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (1)).StrExpr)); next = next.link((yyval.Stmt)); }
      break;

    case 44: /* Stmt: IF StrExpr RELOP StrExpr THEN INTEGER EOL  */
#line 93 "grammar.y"
                                                    { (yyval.Stmt) = new IfString(((yystack.valueAt (5)).StrExpr), ((yystack.valueAt (4)).RELOP), ((yystack.valueAt (3)).StrExpr), cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 45: /* Stmt: IF StrExpr ASSIGN StrExpr THEN INTEGER EOL  */
#line 94 "grammar.y"
                                                     { (yyval.Stmt) = new IfString(((yystack.valueAt (5)).StrExpr), TokenKind.EQ, ((yystack.valueAt (3)).StrExpr), cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 46: /* Stmt: ON Expr GotoThen GotoSq EOL  */
#line 95 "grammar.y"
                                      { (yyval.Stmt) = new OnGoto(((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).GotoSq)); next = next.link((yyval.Stmt)); }
      break;

    case 47: /* Stmt: CHANGE IDENT DOLLAR TO IDENT EOL  */
#line 96 "grammar.y"
                                           { (yyval.Stmt) = new ChangeFromString(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 48: /* Stmt: CHANGE IDENT TO IDENT DOLLAR EOL  */
#line 97 "grammar.y"
                                           { (yyval.Stmt) = new ChangeToString(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (2)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 49: /* Stmt: RANDOM EOL  */
#line 98 "grammar.y"
                     { (yyval.Stmt) = new Randomize(); next = next.link((yyval.Stmt)); }
      break;

    case 50: /* Stmt: RESTORE TIMES EOL  */
#line 99 "grammar.y"
                            { (yyval.Stmt) = new Restore(true, false); next = next.link((yyval.Stmt)); }
      break;

    case 51: /* Stmt: RESTORE DOLLAR EOL  */
#line 100 "grammar.y"
                             { (yyval.Stmt) = new Restore(false, true); next = next.link((yyval.Stmt)); }
      break;

    case 52: /* Stmt: DEF FN IDENT LPAREN IdSq RPAREN EOL  */
#line 101 "grammar.y"
                                              { foreach(id; ((yystack.valueAt (2)).IdSq)) symtab.initializeId(id); symtab.addFunction(((yystack.valueAt (4)).IDENT), SymbolTable.Function(((yystack.valueAt (2)).IdSq), null, symtab.line, ((yystack.valueAt (2)).IdSq).length)); symtab.registerFlow(symtab.line); }
      break;

    case 53: /* Stmt: DEF FN IDENT EOL  */
#line 102 "grammar.y"
                           { symtab.addFunction(((yystack.valueAt (1)).IDENT), SymbolTable.Function(new int[0], null, symtab.line, 0)); symtab.registerFlow(symtab.line); }
      break;

    case 54: /* Stmt: LET FN IDENT ASSIGN Expr EOL  */
#line 103 "grammar.y"
                                       { (yyval.Stmt) = new Let(symtab.installId("FN" ~ symtab.getId(((yystack.valueAt (3)).IDENT))), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 55: /* Stmt: FN END EOL  */
#line 104 "grammar.y"
                     { (yyval.Stmt) = new Return(); next = next.link((yyval.Stmt)); }
      break;

    case 56: /* Print: %empty  */
#line 107 "grammar.y"
                 { (yyval.Print) = new NewLine(); }
      break;

    case 57: /* Print: PrintEn  */
#line 108 "grammar.y"
                  { (yyval.Print) = ((yystack.valueAt (0)).PrintEn); }
      break;

    case 58: /* Print: PrintSq PrintEn  */
#line 109 "grammar.y"
                          { (yyval.Print) = ((yystack.valueAt (1)).PrintSq); (yyval.Print).linkLast(((yystack.valueAt (0)).PrintEn)); }
      break;

    case 59: /* PrintSq: PrintSt  */
#line 112 "grammar.y"
                  { (yyval.PrintSq) = ((yystack.valueAt (0)).PrintSt); }
      break;

    case 60: /* PrintSq: PrintSq PrintSt  */
#line 113 "grammar.y"
                          { (yyval.PrintSq).linkLast(((yystack.valueAt (0)).PrintSt)); }
      break;

    case 61: /* PrintSt: Expr PrintTa  */
#line 116 "grammar.y"
                       { (yyval.PrintSt) = new PrintExpr(((yystack.valueAt (1)).Expr)); (yyval.PrintSt).linkLast(((yystack.valueAt (0)).PrintTa)); }
      break;

    case 62: /* PrintSt: STRING Expr PrintTa  */
#line 117 "grammar.y"
                              { (yyval.PrintSt) = new String(((yystack.valueAt (2)).STRING)); (yyval.PrintSt).linkLast(new PrintExpr(((yystack.valueAt (1)).Expr))); (yyval.PrintSt).linkLast(((yystack.valueAt (0)).PrintTa)); }
      break;

    case 63: /* PrintSt: StrExpr SEMICOLON  */
#line 118 "grammar.y"
                            { (yyval.PrintSt) = new PrintString(((yystack.valueAt (1)).StrExpr)); }
      break;

    case 64: /* PrintSt: StrExpr COMMA  */
#line 119 "grammar.y"
                        { (yyval.PrintSt) = new PrintString(((yystack.valueAt (1)).StrExpr)); (yyval.PrintSt).linkLast(new Comma()); }
      break;

    case 65: /* PrintSt: TAB LPAREN Expr RPAREN SEMICOLON  */
#line 120 "grammar.y"
                                           { (yyval.PrintSt) = new PrintTab(((yystack.valueAt (2)).Expr)); }
      break;

    case 66: /* PrintEn: Expr  */
#line 123 "grammar.y"
               { (yyval.PrintEn) = new PrintExpr(((yystack.valueAt (0)).Expr)); (yyval.PrintEn).linkLast(new NewLine()); }
      break;

    case 67: /* PrintEn: STRING Expr  */
#line 124 "grammar.y"
                      { (yyval.PrintEn) = new String(((yystack.valueAt (1)).STRING)); (yyval.PrintEn).linkLast(new PrintExpr(((yystack.valueAt (0)).Expr))); (yyval.PrintEn).linkLast(new NewLine()); }
      break;

    case 68: /* PrintEn: StrExpr  */
#line 125 "grammar.y"
                  { (yyval.PrintEn) = new PrintString(((yystack.valueAt (0)).StrExpr)); (yyval.PrintEn).linkLast(new NewLine()); }
      break;

    case 69: /* PrintEn: PrintSt  */
#line 126 "grammar.y"
                  { (yyval.PrintEn) = ((yystack.valueAt (0)).PrintSt); }
      break;

    case 70: /* PrintTa: COMMA  */
#line 129 "grammar.y"
                { (yyval.PrintTa) = new Comma(); }
      break;

    case 71: /* PrintTa: SEMICOLON  */
#line 130 "grammar.y"
                    { (yyval.PrintTa) = new SemiColon(); }
      break;

    case 72: /* DataSq: Data  */
#line 133 "grammar.y"
               {}
      break;

    case 73: /* DataSq: DataSq COMMA Data  */
#line 134 "grammar.y"
                            {}
      break;

    case 74: /* Data: INTEGER  */
#line 137 "grammar.y"
                  { symtab.installData(cast(double)((yystack.valueAt (0)).INTEGER)); }
      break;

    case 75: /* Data: NUMBER  */
#line 138 "grammar.y"
                 { symtab.installData(((yystack.valueAt (0)).NUMBER)); }
      break;

    case 76: /* Data: MINUS INTEGER  */
#line 139 "grammar.y"
                        { symtab.installData(cast(double)-((yystack.valueAt (0)).INTEGER)); }
      break;

    case 77: /* Data: MINUS NUMBER  */
#line 140 "grammar.y"
                       { symtab.installData(-((yystack.valueAt (0)).NUMBER)); }
      break;

    case 78: /* Data: STRING  */
#line 141 "grammar.y"
                 { symtab.installData(((yystack.valueAt (0)).STRING)); }
      break;

    case 79: /* Data: DATASTRING  */
#line 142 "grammar.y"
                     { symtab.installData(((yystack.valueAt (0)).DATASTRING)); }
      break;

    case 80: /* ReadSq: Read  */
#line 145 "grammar.y"
               {}
      break;

    case 81: /* ReadSq: ReadSq COMMA Read  */
#line 146 "grammar.y"
                            {}
      break;

    case 82: /* Read: IDENT  */
#line 149 "grammar.y"
                { (yyval.Read) = new Read(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Read)); }
      break;

    case 83: /* Read: IDENT LPAREN Expr RPAREN  */
#line 150 "grammar.y"
                                   { (yyval.Read) = new ReadDim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Read)); }
      break;

    case 84: /* Read: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 151 "grammar.y"
                                              { (yyval.Read) = new ReadDim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Read)); }
      break;

    case 85: /* Read: IDENT DOLLAR  */
#line 152 "grammar.y"
                       { (yyval.Read) = new ReadString(((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Read)); }
      break;

    case 86: /* Read: IDENT DOLLAR LPAREN Expr RPAREN  */
#line 153 "grammar.y"
                                          { (yyval.Read) = new ReadDimString(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Read)); }
      break;

    case 87: /* DimSq: Dim  */
#line 156 "grammar.y"
              {}
      break;

    case 88: /* DimSq: DimSq COMMA Dim  */
#line 157 "grammar.y"
                          {}
      break;

    case 89: /* Dim: IDENT LPAREN INTEGER RPAREN  */
#line 160 "grammar.y"
                                      { symtab.initializeDim(((yystack.valueAt (3)).IDENT), true, cast(ushort)((yystack.valueAt (1)).INTEGER)); }
      break;

    case 90: /* Dim: IDENT LPAREN INTEGER COMMA INTEGER RPAREN  */
#line 161 "grammar.y"
                                                    { symtab.initializeDim2(((yystack.valueAt (5)).IDENT), true, cast(ushort)((yystack.valueAt (3)).INTEGER), cast(ushort)((yystack.valueAt (1)).INTEGER)); }
      break;

    case 91: /* Dim: IDENT DOLLAR LPAREN INTEGER RPAREN  */
#line 162 "grammar.y"
                                             { symtab.initializeDimString(((yystack.valueAt (4)).IDENT), true, cast(ushort)((yystack.valueAt (1)).INTEGER)); }
      break;

    case 92: /* IdSq: IDENT  */
#line 165 "grammar.y"
                { int[] i; (yyval.IdSq) = i; (yyval.IdSq) ~= ((yystack.valueAt (0)).IDENT); }
      break;

    case 93: /* IdSq: IdSq COMMA IDENT  */
#line 166 "grammar.y"
                           { (yyval.IdSq) ~= ((yystack.valueAt (0)).IDENT); }
      break;

    case 94: /* ExprSq: Expr  */
#line 169 "grammar.y"
               { Expr[] e; (yyval.ExprSq) = e; (yyval.ExprSq) ~= ((yystack.valueAt (0)).Expr); }
      break;

    case 95: /* ExprSq: ExprSq COMMA Expr  */
#line 170 "grammar.y"
                            { (yyval.ExprSq) ~= ((yystack.valueAt (0)).Expr); }
      break;

    case 96: /* MatPr: MatPrEn  */
#line 173 "grammar.y"
                  { (yyval.MatPr) = ((yystack.valueAt (0)).MatPrEn); }
      break;

    case 97: /* MatPr: MatPrSq MatPrEn  */
#line 174 "grammar.y"
                          { (yyval.MatPr) = ((yystack.valueAt (1)).MatPrSq); (yyval.MatPr).linkLast(((yystack.valueAt (0)).MatPrEn)); }
      break;

    case 98: /* MatPrSq: MatPrSt  */
#line 177 "grammar.y"
                  { (yyval.MatPrSq) = ((yystack.valueAt (0)).MatPrSt); }
      break;

    case 99: /* MatPrSq: MatPrSq MatPrSt  */
#line 178 "grammar.y"
                          { (yyval.MatPrSq).linkLast(((yystack.valueAt (0)).MatPrSt)); }
      break;

    case 100: /* MatPrSt: IDENT COMMA  */
#line 181 "grammar.y"
                      { (yyval.MatPrSt) = new MatPrint(((yystack.valueAt (1)).IDENT)); }
      break;

    case 101: /* MatPrSt: IDENT SEMICOLON  */
#line 182 "grammar.y"
                          { (yyval.MatPrSt) = new MatPrint(((yystack.valueAt (1)).IDENT), true); }
      break;

    case 102: /* MatPrSt: IDENT DOLLAR COMMA  */
#line 183 "grammar.y"
                             { (yyval.MatPrSt) = new MatPrintString(((yystack.valueAt (2)).IDENT)); }
      break;

    case 103: /* MatPrSt: IDENT DOLLAR SEMICOLON  */
#line 184 "grammar.y"
                                 { (yyval.MatPrSt) = new MatPrintString(((yystack.valueAt (2)).IDENT), true); }
      break;

    case 104: /* MatPrEn: IDENT  */
#line 187 "grammar.y"
                { (yyval.MatPrEn) = new MatPrint(((yystack.valueAt (0)).IDENT)); }
      break;

    case 105: /* MatPrEn: IDENT SEMICOLON  */
#line 188 "grammar.y"
                          { (yyval.MatPrEn) = new MatPrint(((yystack.valueAt (1)).IDENT), true); }
      break;

    case 106: /* MatPrEn: IDENT DOLLAR  */
#line 189 "grammar.y"
                       { (yyval.MatPrEn) = new MatPrintString(((yystack.valueAt (1)).IDENT)); }
      break;

    case 107: /* MatPrEn: IDENT DOLLAR SEMICOLON  */
#line 190 "grammar.y"
                                 { (yyval.MatPrEn) = new MatPrintString(((yystack.valueAt (2)).IDENT), true); }
      break;

    case 108: /* MatRdSq: MatRead  */
#line 193 "grammar.y"
                  {}
      break;

    case 109: /* MatRdSq: MatRdSq COMMA MatRead  */
#line 194 "grammar.y"
                                {}
      break;

    case 110: /* MatRead: IDENT LPAREN Expr RPAREN  */
#line 197 "grammar.y"
                                   { (yyval.MatRead) = new MatRead(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.MatRead)); }
      break;

    case 111: /* MatRead: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 198 "grammar.y"
                                              { (yyval.MatRead) = new MatRead2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.MatRead)); }
      break;

    case 112: /* MatRead: IDENT DOLLAR LPAREN Expr RPAREN  */
#line 199 "grammar.y"
                                          { (yyval.MatRead) = new MatReadString(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.MatRead)); }
      break;

    case 113: /* InputSq: Input  */
#line 202 "grammar.y"
                {}
      break;

    case 114: /* InputSq: InputSq COMMA Input  */
#line 203 "grammar.y"
                              {}
      break;

    case 115: /* Input: IDENT  */
#line 206 "grammar.y"
                { (yyval.Input) = new Input(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Input)); }
      break;

    case 116: /* Input: IDENT LPAREN Expr RPAREN  */
#line 207 "grammar.y"
                                   { (yyval.Input) = new InputDim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Input)); }
      break;

    case 117: /* Input: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 208 "grammar.y"
                                              { (yyval.Input) = new InputDim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Input)); }
      break;

    case 118: /* Input: IDENT DOLLAR  */
#line 209 "grammar.y"
                       { (yyval.Input) = new InputString(((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Input)); }
      break;

    case 119: /* Expr: NUMBER  */
#line 212 "grammar.y"
                 { (yyval.Expr) = new Constant(symtab.installConstant(((yystack.valueAt (0)).NUMBER))); }
      break;

    case 120: /* Expr: INTEGER  */
#line 213 "grammar.y"
                  { (yyval.Expr) = new Constant(symtab.installConstant(((yystack.valueAt (0)).INTEGER))); }
      break;

    case 121: /* Expr: IDENT  */
#line 214 "grammar.y"
                { (yyval.Expr) = new Identifier(((yystack.valueAt (0)).IDENT)); }
      break;

    case 122: /* Expr: MATHFN Expr RPAREN  */
#line 215 "grammar.y"
                             { (yyval.Expr) = new MathFn(((yystack.valueAt (2)).MATHFN), ((yystack.valueAt (1)).Expr)); }
      break;

    case 123: /* Expr: FN IDENT LPAREN ExprSq RPAREN  */
#line 216 "grammar.y"
                                        { (yyval.Expr) = new FnCall(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).ExprSq)); }
      break;

    case 124: /* Expr: FN IDENT  */
#line 217 "grammar.y"
                   { (yyval.Expr) = (symtab.edition >= Edition.Fourth) ? new Identifier(symtab.installId("FN" ~ symtab.getId(((yystack.valueAt (0)).IDENT)))) : new FnCall(((yystack.valueAt (0)).IDENT), new Expr[0]); }
      break;

    case 125: /* Expr: IDENT LPAREN Expr RPAREN  */
#line 218 "grammar.y"
                                   { (yyval.Expr) = new Dim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); }
      break;

    case 126: /* Expr: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 219 "grammar.y"
                                              { (yyval.Expr) = new Dim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); }
      break;

    case 127: /* Expr: Expr PLUS Expr  */
#line 220 "grammar.y"
                         { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Add, ((yystack.valueAt (0)).Expr)); }
      break;

    case 128: /* Expr: Expr MINUS Expr  */
#line 221 "grammar.y"
                          { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Sub, ((yystack.valueAt (0)).Expr)); }
      break;

    case 129: /* Expr: Expr TIMES Expr  */
#line 222 "grammar.y"
                          { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Mul, ((yystack.valueAt (0)).Expr)); }
      break;

    case 130: /* Expr: Expr DIVIDE Expr  */
#line 223 "grammar.y"
                           { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Div, ((yystack.valueAt (0)).Expr)); }
      break;

    case 131: /* Expr: Expr EXP Expr  */
#line 224 "grammar.y"
                        { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Exp, ((yystack.valueAt (0)).Expr)); }
      break;

    case 132: /* Expr: MINUS Expr  */
#line 225 "grammar.y"
                                  { (yyval.Expr) = new Operation(((yystack.valueAt (0)).Expr), Op.Neg); }
      break;

    case 133: /* Expr: LPAREN Expr RPAREN  */
#line 226 "grammar.y"
                             { (yyval.Expr) = ((yystack.valueAt (1)).Expr); }
      break;

    case 134: /* Expr: DET  */
#line 227 "grammar.y"
              { (yyval.Expr) = new Identifier(symtab.installId("DET")); }
      break;

    case 135: /* Expr: NUM  */
#line 228 "grammar.y"
              { (yyval.Expr) = new Identifier(symtab.installId("NUM")); }
      break;

    case 136: /* Expr: RND  */
#line 229 "grammar.y"
              { (yyval.Expr) = new MathFn("RND", null); }
      break;

    case 137: /* StrExpr: IDENT DOLLAR  */
#line 232 "grammar.y"
                       { (yyval.StrExpr) = new StringVariable(((yystack.valueAt (1)).IDENT)); }
      break;

    case 138: /* StrExpr: IDENT DOLLAR LPAREN Expr RPAREN  */
#line 233 "grammar.y"
                                          { (yyval.StrExpr) = new StringIndexed(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (1)).Expr)); }
      break;

    case 139: /* StrExpr: STRING  */
#line 234 "grammar.y"
                 { (yyval.StrExpr) = new StringConstant(((yystack.valueAt (0)).STRING)); }
      break;

    case 140: /* GotoThen: GO TO  */
#line 237 "grammar.y"
                {}
      break;

    case 141: /* GotoThen: THEN  */
#line 238 "grammar.y"
               {}
      break;

    case 142: /* GotoSq: INTEGER  */
#line 241 "grammar.y"
                  { int[] l; (yyval.GotoSq) = l; (yyval.GotoSq) ~= ((yystack.valueAt (0)).INTEGER); symtab.registerFlow(cast(ushort)((yystack.valueAt (0)).INTEGER)); }
      break;

    case 143: /* GotoSq: GotoSq COMMA INTEGER  */
#line 242 "grammar.y"
                               { (yyval.GotoSq) ~= ((yystack.valueAt (0)).INTEGER); symtab.registerFlow(cast(ushort)((yystack.valueAt (0)).INTEGER)); }
      break;


#line 1201 "Parser.d"

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
  private static immutable short yypact_ninf_ = -42;

  /* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule which
     number is the opposite.  If YYTABLE_NINF_, syntax error.  */
  private static immutable short yytable_ninf_ = -108;

    /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
private static immutable short[] yypact_ =
[
     -42,   253,   -42,   -42,    -3,     0,     8,     1,    19,    57,
       4,    28,    10,    17,    25,    67,    32,    75,    38,    15,
      16,    96,   104,    56,   103,   119,   -42,   100,   122,   -34,
      37,   -42,   -42,   -42,   -42,   -42,    40,    55,   -42,   156,
     119,   -42,   -42,   119,   133,   -42,   -42,    90,   -42,   119,
     119,    88,     1,   126,   -42,   357,   101,   183,   -42,    -7,
       2,   150,   143,   -42,   -42,   241,   188,   -42,   161,    69,
     -42,   -42,   205,   247,   250,   289,   248,   -42,   249,   184,
     106,   -42,   -29,   -42,   269,   160,    21,   119,   119,    20,
     260,   119,   256,     0,   -42,   -42,   -42,     8,   -42,   119,
     257,   357,   -41,   265,   119,   251,   273,   -42,   126,   -42,
     -42,   -42,   119,   119,   119,   119,   119,   -42,   -42,   -42,
     295,   119,   119,   223,   223,   119,   -42,    24,   -42,   360,
     327,    75,   -42,    95,   208,   123,   -42,   149,   334,   250,
     -42,   -42,   345,   -42,   -42,   119,   -42,    96,   -42,   401,
     378,   -42,   383,   -42,   408,   382,   135,   223,   119,   119,
     154,   119,   -42,   -42,   167,   119,   -42,   -42,   119,   259,
     -42,    54,    54,   273,   273,   273,   -42,    76,   105,   362,
     386,   392,   112,   119,   427,   -42,   231,   426,   -42,   162,
     -24,    -4,    35,   381,   391,   119,   119,   399,   247,   -42,
     110,   -42,   376,   -42,   -42,   -42,   -42,   194,   -42,   388,
     431,   -42,   -42,   125,   -42,   405,   119,   400,   266,   390,
     -42,   119,   272,   -42,   119,   279,   236,   177,   403,   460,
     461,   468,   469,   119,   398,   -42,   239,   -42,   476,   437,
     479,   487,   492,   119,   -42,   119,   -42,   119,   -42,   494,
     495,   285,   235,   119,   -42,   -42,   442,   -42,   119,   443,
     444,   497,   -42,   119,   292,   -42,   459,   -42,   298,   -42,
     305,   -42,   -42,   119,   -42,   447,   448,   449,   450,   129,
     -42,    -8,   505,   457,   -42,   453,   454,   455,   363,   374,
     311,   462,   463,   456,   -42,   119,   318,   324,   -42,   -42,
     -42,   406,   472,   223,   -42,   -42,   177,   -42,   -42,   -42,
     -42,   119,   -42,   119,   -42,   -42,   -42,   -42,   -42,   -42,
     119,   119,   464,   465,   466,   510,   331,   -42,   -42,   -42,
     119,   467,   414,   422,   337,   344,   -42,   -42,   -42,   470,
     -42,   430,   -42,   -42,   -42,   471,   473,   -42,   -42,   -42,
     -42
];

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
private static immutable short[] yydefact_ =
[
       2,     0,     1,     4,     0,     0,     0,    56,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     3,     0,     0,    82,
       0,    80,    78,    74,    79,    75,     0,     0,    72,   121,
     139,   120,   119,     0,     0,   134,   135,     0,   136,     0,
       0,     0,     0,    59,    57,    66,    68,     0,   139,     0,
       0,     0,     0,    24,     5,     0,     0,    22,     0,     0,
      87,    23,     0,     0,     0,     0,     0,    40,     0,   115,
       0,   113,     0,    49,     0,   121,     0,     0,     0,     0,
       0,     0,    85,     0,    18,    76,    77,     0,    17,     0,
     137,    67,     0,   124,     0,     0,   132,     6,    60,    58,
      70,    71,     0,     0,     0,     0,     0,    61,    64,    63,
       0,     0,     0,     0,     0,     0,    16,     0,     8,     0,
       0,     0,    19,     0,     0,     0,   108,   104,     0,     0,
      98,    96,     0,    51,    50,     0,   118,     0,    41,     0,
       0,    55,     0,   141,     0,     0,     0,     0,     0,     0,
       0,     0,    81,    73,     0,     0,    62,   122,     0,     0,
     133,   127,   128,   129,   130,   131,     7,     0,     0,     0,
       0,     0,     0,     0,     0,    53,     0,     0,    88,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    25,
     106,   100,   101,    26,    99,    97,    39,     0,   114,     0,
       0,   140,   142,     0,     9,     0,     0,     0,     0,     0,
      83,     0,     0,   125,     0,     0,     0,    94,     0,     0,
       0,     0,     0,     0,     0,    92,     0,    89,     0,     0,
       0,     0,     0,     0,    36,     0,    37,     0,    38,     0,
       0,     0,     0,     0,   109,   102,   103,   116,     0,     0,
       0,     0,    46,     0,     0,    42,     0,    54,     0,    86,
       0,   138,   123,     0,    65,     0,     0,     0,     0,     0,
      21,     0,     0,     0,    91,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   110,     0,     0,     0,    48,    47,
     143,     0,     0,     0,    84,   126,    95,    12,    13,    44,
      45,     0,    15,     0,    52,    93,    90,    27,    28,    29,
       0,     0,     0,     0,     0,     0,     0,   112,   117,    10,
       0,     0,     0,     0,     0,     0,    32,    33,    34,     0,
     111,     0,    43,    14,    20,     0,     0,    35,    11,    30,
      31
];

  /* YYPGOTO[NTERM-NUM].  */
private static immutable short[] yypgoto_ =
[
     -42,   -42,   -42,   -42,   -42,   475,   481,   418,   -42,   423,
     -42,   429,   -42,   397,   -42,   -42,   -42,   -42,   395,   396,
     -42,   333,   -42,   389,    -9,    -6,   -42,   -42
];

  /* YYDEFGOTO[NTERM-NUM].  */
private static immutable short[] yydefgoto_ =
[
       0,     1,    26,    51,    52,    53,    54,   117,    37,    38,
      30,    31,    69,    70,   236,   226,   138,   139,   140,   141,
     135,   136,    80,    81,    55,    56,   154,   213
];

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
private static immutable short[] yytable_ =
[
      59,   121,    27,    60,   149,    29,    39,    40,    41,    61,
     123,    42,    43,   167,    32,    33,    86,    34,    35,    91,
      72,    92,   112,   113,   114,   115,   150,   116,    73,   243,
      74,   101,    28,    62,   102,   244,    44,   152,   313,   122,
     105,   106,    45,    46,    75,    47,    48,    95,   124,   245,
      96,   314,    57,   153,    49,   246,   112,   113,   114,   115,
      65,   116,    39,    58,    41,    50,   157,    42,    43,    63,
     183,    76,    36,   158,    66,    77,    64,   184,   155,   156,
      68,    78,   160,   185,   112,   113,   114,   115,   247,   116,
     164,    67,    44,    93,   248,   169,    94,    71,    45,    46,
     189,    79,    48,   171,   172,   173,   174,   175,   229,    82,
      49,    97,   177,   178,    98,    83,   182,   180,   181,   114,
     115,    50,   116,    84,    85,   131,    41,    90,   132,    42,
      43,   190,   191,   192,   193,   194,   207,   230,   103,   112,
     113,   114,   115,   104,   116,   233,    87,   107,   195,   218,
     219,   217,   222,    88,    44,    89,   225,   118,   119,   227,
      45,    46,   147,   311,    48,   148,   255,   256,   112,   113,
     114,   115,    49,   116,   234,   112,   113,   114,   115,   198,
     116,   261,   199,    50,   262,   -69,   251,   252,   312,   215,
     120,   216,   112,   113,   114,   115,   125,   116,   112,   113,
     114,   115,   126,   116,   200,   201,   202,   264,   220,    99,
     221,   100,   268,    99,   129,   270,   130,   112,   113,   114,
     115,   223,   116,   224,   279,   240,   241,   242,   179,    58,
     112,   113,   114,   115,   288,   116,   289,   145,   290,   146,
     112,   113,   114,   115,   296,   116,   127,   128,   257,   297,
     258,   133,   134,     2,   301,   137,     3,   112,   113,   114,
     115,   196,   116,   197,   306,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,   237,   326,   238,    24,   294,
     272,   295,   273,   281,   142,   282,    25,   331,   112,   113,
     114,   115,   332,   116,   333,   170,   159,   143,   144,   161,
     165,   334,   335,   228,   112,   113,   114,   115,   168,   116,
     266,   341,   112,   113,   114,   115,   269,   116,   151,   112,
     113,   114,   115,   271,   116,   112,   113,   114,   115,   293,
     116,   116,   112,   113,   114,   115,   302,   116,   112,   113,
     114,   115,   304,   116,   176,   112,   113,   114,   115,   305,
     116,   112,   113,   114,   115,   322,   116,   186,   112,   113,
     114,   115,   327,   116,   112,   113,   114,   115,   328,   116,
     187,   112,   113,   114,   115,   340,   116,   112,   113,   114,
     115,   345,   116,   203,   112,   113,   114,   115,   346,   116,
     112,   113,   114,   115,   206,   116,   209,   112,   113,   114,
     115,   210,   116,   110,   111,   212,   211,   100,   231,   320,
     112,   113,   114,   115,   232,   116,   112,   113,   114,   115,
     321,   116,   235,   239,   249,  -105,   260,   112,   113,   114,
     115,   214,   116,   259,   250,   112,   113,   114,   115,   267,
     116,   263,   253,   112,   113,   114,   115,   280,   116,   265,
     274,   112,   113,   114,   115,   329,   116,   275,   276,   112,
     113,   114,   115,   343,   116,   277,   278,   112,   113,   114,
     115,   344,   116,   283,   285,   112,   113,   114,   115,   348,
     116,   284,   286,   112,   113,   114,   115,   287,   116,   291,
     292,  -107,   298,   299,   300,   303,   307,   308,   309,   310,
     315,   316,   317,   318,   319,   339,   323,   324,   330,   166,
     163,   325,   162,   336,   337,   338,   342,   108,   188,   347,
     349,   254,   350,   109,   204,   205,   208
];

private static immutable short[] yycheck_ =
[
       9,     8,     5,     9,    33,     5,     5,     6,     7,     5,
       8,    10,    11,    54,     6,     7,    25,     9,    10,    53,
       5,    55,    63,    64,    65,    66,    55,    68,    13,    53,
      15,    40,    35,     5,    43,    59,    35,    16,    46,    46,
      49,    50,    41,    42,    29,    44,    45,     7,    46,    53,
      10,    59,    33,    32,    53,    59,    63,    64,    65,    66,
      35,    68,     5,     6,     7,    64,    46,    10,    11,    59,
      46,    55,    64,    53,     7,    59,    59,    53,    87,    88,
       5,    65,    91,    59,    63,    64,    65,    66,    53,    68,
      99,    59,    35,    56,    59,   104,    59,    59,    41,    42,
       5,     5,    45,   112,   113,   114,   115,   116,    32,     5,
      53,    56,   121,   122,    59,    59,   125,   123,   124,    65,
      66,    64,    68,    20,     5,    56,     7,     5,    59,    10,
      11,    36,    37,    38,    39,    40,   145,    32,     5,    63,
      64,    65,    66,    53,    68,    33,    46,    59,    53,   158,
     159,   157,   161,    53,    35,    55,   165,    56,    57,   168,
      41,    42,    56,    34,    45,    59,    56,    57,    63,    64,
      65,    66,    53,    68,   183,    63,    64,    65,    66,    56,
      68,    56,    59,    64,    59,    59,   195,   196,    59,    54,
       7,    56,    63,    64,    65,    66,    46,    68,    63,    64,
      65,    66,    59,    68,    55,    56,    57,   216,    54,    53,
      56,    55,   221,    53,    53,   224,    55,    63,    64,    65,
      66,    54,    68,    56,   233,    63,    64,    65,     5,     6,
      63,    64,    65,    66,   243,    68,   245,    53,   247,    55,
      63,    64,    65,    66,   253,    68,     5,    59,    54,   258,
      56,    46,     5,     0,   263,     5,     3,    63,    64,    65,
      66,    53,    68,    55,   273,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    54,   295,    56,    35,    54,
      54,    56,    56,    54,     5,    56,    43,   303,    63,    64,
      65,    66,   311,    68,   313,    54,    46,    59,    59,    53,
      53,   320,   321,    54,    63,    64,    65,    66,    53,    68,
      54,   330,    63,    64,    65,    66,    54,    68,    59,    63,
      64,    65,    66,    54,    68,    63,    64,    65,    66,    54,
      68,    68,    63,    64,    65,    66,    54,    68,    63,    64,
      65,    66,    54,    68,    59,    63,    64,    65,    66,    54,
      68,    63,    64,    65,    66,    54,    68,     7,    63,    64,
      65,    66,    54,    68,    63,    64,    65,    66,    54,    68,
      53,    63,    64,    65,    66,    54,    68,    63,    64,    65,
      66,    54,    68,    59,    63,    64,    65,    66,    54,    68,
      63,    64,    65,    66,    59,    68,     5,    63,    64,    65,
      66,    33,    68,    56,    57,     7,    33,    55,    32,    56,
      63,    64,    65,    66,    32,    68,    63,    64,    65,    66,
      56,    68,     5,     7,    53,    59,     5,    63,    64,    65,
      66,    59,    68,    55,    53,    63,    64,    65,    66,    59,
      68,    46,    53,    63,    64,    65,    66,    59,    68,    59,
      57,    63,    64,    65,    66,    59,    68,     7,     7,    63,
      64,    65,    66,    59,    68,     7,     7,    63,    64,    65,
      66,    59,    68,     7,     5,    63,    64,    65,    66,    59,
      68,    54,     5,    63,    64,    65,    66,     5,    68,     5,
       5,    59,    59,    59,     7,    46,    59,    59,    59,    59,
       5,    54,    59,    59,    59,     5,    54,    54,    46,   101,
      97,    65,    93,    59,    59,    59,    59,    52,   131,    59,
      59,   198,    59,    52,   139,   139,   147
];

  /* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
     state STATE-NUM.  */
private static immutable byte[] yystos_ =
[
       0,    70,     0,     3,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    35,    43,    71,     5,    35,     5,
      79,    80,     6,     7,     9,    10,    64,    77,    78,     5,
       6,     7,    10,    11,    35,    41,    42,    44,    45,    53,
      64,    72,    73,    74,    75,    93,    94,    33,     6,    93,
      94,     5,     5,    59,    59,    35,     7,    59,     5,    81,
      82,    59,     5,    13,    15,    29,    55,    59,    65,     5,
      91,    92,     5,    59,    20,     5,    93,    46,    53,    55,
       5,    53,    55,    56,    59,     7,    10,    56,    59,    53,
      55,    93,    93,     5,    53,    93,    93,    59,    74,    75,
      56,    57,    63,    64,    65,    66,    68,    76,    56,    57,
       7,     8,    46,     8,    46,    46,    59,     5,    59,    53,
      55,    56,    59,    46,     5,    89,    90,     5,    85,    86,
      87,    88,     5,    59,    59,    53,    55,    56,    59,    33,
      55,    59,    16,    32,    95,    93,    93,    46,    53,    46,
      93,    53,    80,    78,    93,    53,    76,    54,    53,    93,
      54,    93,    93,    93,    93,    93,    59,    93,    93,     5,
      94,    94,    93,    46,    53,    59,     7,    53,    82,     5,
      36,    37,    38,    39,    40,    53,    53,    55,    56,    59,
      55,    56,    57,    59,    87,    88,    59,    93,    92,     5,
      33,    33,     7,    96,    59,    54,    56,    94,    93,    93,
      54,    56,    93,    54,    56,    93,    84,    93,    54,    32,
      32,    32,    32,    33,    93,     5,    83,    54,    56,     7,
      63,    64,    65,    53,    59,    53,    59,    53,    59,    53,
      53,    93,    93,    53,    90,    56,    57,    54,    56,    55,
       5,    56,    59,    46,    93,    59,    54,    59,    93,    54,
      93,    54,    54,    56,    57,     7,     7,     7,     7,    93,
      59,    54,    56,     7,    54,     5,     5,     5,    93,    93,
      93,     5,     5,    54,    54,    56,    93,    93,    59,    59,
       7,    93,    54,    46,    54,    54,    93,    59,    59,    59,
      59,    34,    59,    46,    59,     5,    54,    59,    59,    59,
      56,    56,    54,    54,    54,    65,    93,    54,    54,    59,
      46,    94,    93,    93,    93,    93,    59,    59,    59,     5,
      54,    93,    59,    59,    59,    54,    54,    59,    59,    59,
      59
];

  /* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
private static immutable byte[] yyr1_ =
[
       0,    69,    70,    70,    71,    71,    71,    71,    71,    71,
      71,    71,    71,    71,    71,    71,    71,    71,    71,    71,
      71,    71,    71,    71,    71,    71,    71,    71,    71,    71,
      71,    71,    71,    71,    71,    71,    71,    71,    71,    71,
      71,    71,    71,    71,    71,    71,    71,    71,    71,    71,
      71,    71,    71,    71,    71,    71,    72,    72,    72,    73,
      73,    74,    74,    74,    74,    74,    75,    75,    75,    75,
      76,    76,    77,    77,    78,    78,    78,    78,    78,    78,
      79,    79,    80,    80,    80,    80,    80,    81,    81,    82,
      82,    82,    83,    83,    84,    84,    85,    85,    86,    86,
      87,    87,    87,    87,    88,    88,    88,    88,    89,    89,
      90,    90,    90,    91,    91,    92,    92,    92,    92,    93,
      93,    93,    93,    93,    93,    93,    93,    93,    93,    93,
      93,    93,    93,    93,    93,    93,    93,    94,    94,    94,
      95,    95,    96,    96
];

  /* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
private static immutable byte[] yyr2_ =
[
       0,     2,     0,     2,     1,     2,     3,     4,     3,     5,
       8,    10,     7,     7,     9,     7,     3,     3,     3,     3,
       9,     6,     2,     2,     2,     4,     4,     7,     7,     7,
      10,    10,     8,     8,     8,     9,     5,     5,     5,     4,
       2,     3,     6,     9,     7,     7,     5,     6,     6,     2,
       3,     3,     7,     4,     6,     3,     0,     1,     2,     1,
       2,     2,     3,     2,     2,     5,     1,     2,     1,     1,
       1,     1,     1,     3,     1,     1,     2,     2,     1,     1,
       1,     3,     1,     4,     6,     2,     5,     1,     3,     4,
       6,     5,     1,     3,     1,     3,     1,     2,     1,     2,
       2,     2,     3,     3,     1,     2,     2,     3,     1,     3,
       4,     6,     5,     1,     3,     1,     4,     6,     2,     1,
       1,     1,     3,     5,     2,     4,     6,     3,     3,     3,
       3,     3,     2,     3,     1,     1,     1,     2,     5,     1,
       2,     1,     1,     3
];




  private static auto yytranslate_ (int t)
  {
    return SymbolKind(t);
  }

  private static immutable int yylast_ = 536;
  private static immutable int yynnts_ = 28;
  private static immutable int yyfinal_ = 2;
  private static immutable int yyntokens_ = 69;

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
#line 34 "grammar.y"

    import Node : Node, Branch, Line, Stop, Goto, GoSub, Return, Let, LetDim, LetDim2, Read, ReadDim, ReadDim2, Input, InputDim, InputDim2, If, For, Next, Restore, LetString, InputString, ReadString, LetDimString, ReadDimString, ChangeFromString, ChangeToString, OnGoto, IfString, Randomize;
    import Expr : Expr, Op, Constant, Identifier, Dim, Dim2, Operation, MathFn, FnCall, StringExpr, StringVariable, StringConstant, StringIndexed;
    import LexerImpl : LexerImpl;
    import SymbolTable : SymbolTable, Edition;
    import Print : NewLine, Comma, SemiColon, String, PrintExpr, PrintString, PrintTab;
    import Mat : MatRead, MatRead2, MatPrint, MatAdd, MatSub, MatMul, MatZerCon, MatIdn, MatTrn, MatInv, MatScalar, MatZerConIdnDim, MatInput, MatReadString, MatPrintString;

#line 1956 "Parser.d"

}

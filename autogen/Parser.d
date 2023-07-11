/* A Bison parser, made by GNU Bison 3.8.2.  */

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
  Parser.Node LineNo;                      /* LineNo  */
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

#line 144 "Parser.d"

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
  public static immutable string yy_bison_version = "3.8.2";

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
    LineNo = 71,                   /* LineNo  */
    Stmt = 72,                     /* Stmt  */
    Print = 73,                    /* Print  */
    PrintSq = 74,                  /* PrintSq  */
    PrintSt = 75,                  /* PrintSt  */
    PrintEn = 76,                  /* PrintEn  */
    PrintTa = 77,                  /* PrintTa  */
    DataSq = 78,                   /* DataSq  */
    Data = 79,                     /* Data  */
    ReadSq = 80,                   /* ReadSq  */
    Read = 81,                     /* Read  */
    DimSq = 82,                    /* DimSq  */
    Dim = 83,                      /* Dim  */
    IdSq = 84,                     /* IdSq  */
    ExprSq = 85,                   /* ExprSq  */
    MatPr = 86,                    /* MatPr  */
    MatPrSq = 87,                  /* MatPrSq  */
    MatPrSt = 88,                  /* MatPrSt  */
    MatPrEn = 89,                  /* MatPrEn  */
    MatRdSq = 90,                  /* MatRdSq  */
    MatRead = 91,                  /* MatRead  */
    InputSq = 92,                  /* InputSq  */
    Input = 93,                    /* Input  */
    Expr = 94,                     /* Expr  */
    StrExpr = 95,                  /* StrExpr  */
    GotoThen = 96,                 /* GotoThen  */
    GotoSq = 97,                   /* GotoSq  */
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
  "UMINUS", "EXP", "$accept", "Stmts", "LineNo", "Stmt", "Print",
  "PrintSq", "PrintSt", "PrintEn", "PrintTa", "DataSq", "Data", "ReadSq",
  "Read", "DimSq", "Dim", "IdSq", "ExprSq", "MatPr", "MatPrSq", "MatPrSt",
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
    case 4: /* LineNo: LINENO  */
#line 49 "grammar.y"
                 { (yyval.LineNo) = new Line(((yystack.valueAt (0)).LINENO)); next = next.link((yyval.LineNo)); }
      break;

    case 5: /* Stmt: STOP  */
#line 53 "grammar.y"
               { (yyval.Stmt) = new Stop(); next = next.link((yyval.Stmt)); }
      break;

    case 6: /* Stmt: PRINT Print  */
#line 54 "grammar.y"
                      { (yyval.Stmt) = new Branch(((yystack.valueAt (0)).Print)); next = next.link((yyval.Stmt)); }
      break;

    case 7: /* Stmt: GO TO INTEGER  */
#line 55 "grammar.y"
                        { (yyval.Stmt) = new Goto(cast(ushort)((yystack.valueAt (0)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 8: /* Stmt: GOSUB INTEGER  */
#line 56 "grammar.y"
                        { (yyval.Stmt) = new GoSub(cast(ushort)((yystack.valueAt (0)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 9: /* Stmt: LET IDENT ASSIGN Expr  */
#line 57 "grammar.y"
                                { (yyval.Stmt) = new Let(((yystack.valueAt (2)).IDENT), ((yystack.valueAt (0)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 10: /* Stmt: LET IDENT LPAREN Expr RPAREN ASSIGN Expr  */
#line 58 "grammar.y"
                                                   { (yyval.Stmt) = new LetDim(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (0)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 11: /* Stmt: LET IDENT LPAREN Expr COMMA Expr RPAREN ASSIGN Expr  */
#line 59 "grammar.y"
                                                              { (yyval.Stmt) = new LetDim2(((yystack.valueAt (7)).IDENT), ((yystack.valueAt (5)).Expr), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (0)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 12: /* Stmt: IF Expr RELOP Expr THEN INTEGER  */
#line 60 "grammar.y"
                                          { (yyval.Stmt) = new If(((yystack.valueAt (4)).Expr), ((yystack.valueAt (3)).RELOP), ((yystack.valueAt (2)).Expr), cast(ushort)((yystack.valueAt (0)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 13: /* Stmt: IF Expr ASSIGN Expr THEN INTEGER  */
#line 61 "grammar.y"
                                           { (yyval.Stmt) = new If(((yystack.valueAt (4)).Expr), TokenKind.EQ, ((yystack.valueAt (2)).Expr), cast(ushort)((yystack.valueAt (0)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 14: /* Stmt: FOR IDENT ASSIGN Expr TO Expr STEP Expr  */
#line 62 "grammar.y"
                                                  { (yyval.Stmt) = new For(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (2)).Expr), ((yystack.valueAt (0)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 15: /* Stmt: FOR IDENT ASSIGN Expr TO Expr  */
#line 63 "grammar.y"
                                        { (yyval.Stmt) = new For(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (2)).Expr), ((yystack.valueAt (0)).Expr), new Constant(symtab.installConstant(1.0))); next = next.link((yyval.Stmt)); }
      break;

    case 16: /* Stmt: NEXT IDENT  */
#line 64 "grammar.y"
                     { (yyval.Stmt) = new Next(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 17: /* Stmt: DATA DataSq  */
#line 65 "grammar.y"
                      {}
      break;

    case 18: /* Stmt: READ ReadSq  */
#line 66 "grammar.y"
                      {}
      break;

    case 19: /* Stmt: DIM DimSq  */
#line 67 "grammar.y"
                    {}
      break;

    case 20: /* Stmt: DEF FN IDENT LPAREN IdSq RPAREN ASSIGN Expr  */
#line 68 "grammar.y"
                                                      { foreach(id; ((yystack.valueAt (3)).IdSq)) symtab.initializeId(id); symtab.addFunction(((yystack.valueAt (5)).IDENT), SymbolTable.Function(((yystack.valueAt (3)).IdSq), ((yystack.valueAt (0)).Expr), -1, ((yystack.valueAt (3)).IdSq).length)); }
      break;

    case 21: /* Stmt: DEF FN IDENT ASSIGN Expr  */
#line 69 "grammar.y"
                                   { symtab.addFunction(((yystack.valueAt (2)).IDENT), SymbolTable.Function(new int[0], ((yystack.valueAt (0)).Expr), -1, 0)); }
      break;

    case 22: /* Stmt: RETURN  */
#line 70 "grammar.y"
                 { (yyval.Stmt) = new Return(); next = next.link((yyval.Stmt)); }
      break;

    case 23: /* Stmt: REM  */
#line 71 "grammar.y"
              { }
      break;

    case 24: /* Stmt: END  */
#line 72 "grammar.y"
              { symtab.checkReferences(); return YYACCEPT; }
      break;

    case 25: /* Stmt: MAT READ MatRdSq  */
#line 74 "grammar.y"
                           {}
      break;

    case 26: /* Stmt: MAT PRINT MatPr  */
#line 75 "grammar.y"
                          { (yyval.Stmt) = new Branch(((yystack.valueAt (0)).MatPr)); next = next.link((yyval.Stmt)); }
      break;

    case 27: /* Stmt: MAT IDENT ASSIGN IDENT PLUS IDENT  */
#line 76 "grammar.y"
                                            { (yyval.Stmt) = new MatAdd(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (2)).IDENT), ((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 28: /* Stmt: MAT IDENT ASSIGN IDENT MINUS IDENT  */
#line 77 "grammar.y"
                                             { (yyval.Stmt) = new MatSub(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (2)).IDENT), ((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 29: /* Stmt: MAT IDENT ASSIGN IDENT TIMES IDENT  */
#line 78 "grammar.y"
                                             { (yyval.Stmt) = new MatMul(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (2)).IDENT), ((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 30: /* Stmt: MAT IDENT ASSIGN ZER LPAREN Expr COMMA Expr RPAREN  */
#line 79 "grammar.y"
                                                             { (yyval.Stmt) = new MatZerCon(((yystack.valueAt (7)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 31: /* Stmt: MAT IDENT ASSIGN CON LPAREN Expr COMMA Expr RPAREN  */
#line 80 "grammar.y"
                                                             { (yyval.Stmt) = new MatZerCon(((yystack.valueAt (7)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr), true); next = next.link((yyval.Stmt)); }
      break;

    case 32: /* Stmt: MAT IDENT ASSIGN IDN LPAREN Expr RPAREN  */
#line 81 "grammar.y"
                                                  { (yyval.Stmt) = new MatIdn(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 33: /* Stmt: MAT IDENT ASSIGN TRN LPAREN IDENT RPAREN  */
#line 82 "grammar.y"
                                                   { (yyval.Stmt) = new MatTrn(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 34: /* Stmt: MAT IDENT ASSIGN INV LPAREN IDENT RPAREN  */
#line 83 "grammar.y"
                                                   { (yyval.Stmt) = new MatInv(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 35: /* Stmt: MAT IDENT ASSIGN LPAREN Expr RPAREN TIMES IDENT  */
#line 84 "grammar.y"
                                                          { (yyval.Stmt) = new MatScalar(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (0)).IDENT), ((yystack.valueAt (3)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 36: /* Stmt: MAT IDENT ASSIGN ZER  */
#line 86 "grammar.y"
                               { (yyval.Stmt) = new MatZerConIdnDim(((yystack.valueAt (2)).IDENT), 0); next = next.link((yyval.Stmt)); }
      break;

    case 37: /* Stmt: MAT IDENT ASSIGN CON  */
#line 87 "grammar.y"
                               { (yyval.Stmt) = new MatZerConIdnDim(((yystack.valueAt (2)).IDENT), 1); next = next.link((yyval.Stmt)); }
      break;

    case 38: /* Stmt: MAT IDENT ASSIGN IDN  */
#line 88 "grammar.y"
                               { (yyval.Stmt) = new MatZerConIdnDim(((yystack.valueAt (2)).IDENT), 2); next = next.link((yyval.Stmt)); }
      break;

    case 39: /* Stmt: MAT INPUT IDENT  */
#line 89 "grammar.y"
                          { (yyval.Stmt) = new MatInput(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 40: /* Stmt: RESTORE  */
#line 90 "grammar.y"
                  { (yyval.Stmt) = new Restore(); next = next.link((yyval.Stmt)); }
      break;

    case 41: /* Stmt: INPUT InputSq  */
#line 91 "grammar.y"
                        {}
      break;

    case 42: /* Stmt: LET IDENT DOLLAR ASSIGN StrExpr  */
#line 93 "grammar.y"
                                          { (yyval.Stmt) = new LetString(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (0)).StrExpr)); next = next.link((yyval.Stmt)); }
      break;

    case 43: /* Stmt: LET IDENT DOLLAR LPAREN Expr RPAREN ASSIGN StrExpr  */
#line 94 "grammar.y"
                                                             { (yyval.Stmt) = new LetDimString(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (0)).StrExpr)); next = next.link((yyval.Stmt)); }
      break;

    case 44: /* Stmt: IF StrExpr RELOP StrExpr THEN INTEGER  */
#line 95 "grammar.y"
                                                { (yyval.Stmt) = new IfString(((yystack.valueAt (4)).StrExpr), ((yystack.valueAt (3)).RELOP), ((yystack.valueAt (2)).StrExpr), cast(ushort)((yystack.valueAt (0)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 45: /* Stmt: IF StrExpr ASSIGN StrExpr THEN INTEGER  */
#line 96 "grammar.y"
                                                 { (yyval.Stmt) = new IfString(((yystack.valueAt (4)).StrExpr), TokenKind.EQ, ((yystack.valueAt (2)).StrExpr), cast(ushort)((yystack.valueAt (0)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 46: /* Stmt: ON Expr GotoThen GotoSq  */
#line 97 "grammar.y"
                                  { (yyval.Stmt) = new OnGoto(((yystack.valueAt (2)).Expr), ((yystack.valueAt (0)).GotoSq)); next = next.link((yyval.Stmt)); }
      break;

    case 47: /* Stmt: CHANGE IDENT DOLLAR TO IDENT  */
#line 98 "grammar.y"
                                       { (yyval.Stmt) = new ChangeFromString(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 48: /* Stmt: CHANGE IDENT TO IDENT DOLLAR  */
#line 99 "grammar.y"
                                       { (yyval.Stmt) = new ChangeToString(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 49: /* Stmt: RANDOM  */
#line 100 "grammar.y"
                 { (yyval.Stmt) = new Randomize(); next = next.link((yyval.Stmt)); }
      break;

    case 50: /* Stmt: RESTORE TIMES  */
#line 101 "grammar.y"
                        { (yyval.Stmt) = new Restore(true, false); next = next.link((yyval.Stmt)); }
      break;

    case 51: /* Stmt: RESTORE DOLLAR  */
#line 102 "grammar.y"
                         { (yyval.Stmt) = new Restore(false, true); next = next.link((yyval.Stmt)); }
      break;

    case 52: /* Stmt: DEF FN IDENT LPAREN IdSq RPAREN  */
#line 103 "grammar.y"
                                          { foreach(id; ((yystack.valueAt (1)).IdSq)) symtab.initializeId(id); symtab.addFunction(((yystack.valueAt (3)).IDENT), SymbolTable.Function(((yystack.valueAt (1)).IdSq), null, symtab.line, ((yystack.valueAt (1)).IdSq).length)); symtab.registerFlow(symtab.line); }
      break;

    case 53: /* Stmt: DEF FN IDENT  */
#line 104 "grammar.y"
                       { symtab.addFunction(((yystack.valueAt (0)).IDENT), SymbolTable.Function(new int[0], null, symtab.line, 0)); symtab.registerFlow(symtab.line); }
      break;

    case 54: /* Stmt: LET FN IDENT ASSIGN Expr  */
#line 105 "grammar.y"
                                   { (yyval.Stmt) = new Let(symtab.installId("FN" ~ symtab.getId(((yystack.valueAt (2)).IDENT))), ((yystack.valueAt (0)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 55: /* Stmt: FN END  */
#line 106 "grammar.y"
                 { (yyval.Stmt) = new Return(); next = next.link((yyval.Stmt)); }
      break;

    case 56: /* Print: %empty  */
#line 109 "grammar.y"
                 { (yyval.Print) = new NewLine(); }
      break;

    case 57: /* Print: PrintEn  */
#line 110 "grammar.y"
                  { (yyval.Print) = ((yystack.valueAt (0)).PrintEn); }
      break;

    case 58: /* Print: PrintSq PrintEn  */
#line 111 "grammar.y"
                          { (yyval.Print) = ((yystack.valueAt (1)).PrintSq); (yyval.Print).linkLast(((yystack.valueAt (0)).PrintEn)); }
      break;

    case 59: /* PrintSq: PrintSt  */
#line 114 "grammar.y"
                  { (yyval.PrintSq) = ((yystack.valueAt (0)).PrintSt); }
      break;

    case 60: /* PrintSq: PrintSq PrintSt  */
#line 115 "grammar.y"
                          { (yyval.PrintSq).linkLast(((yystack.valueAt (0)).PrintSt)); }
      break;

    case 61: /* PrintSt: Expr PrintTa  */
#line 118 "grammar.y"
                       { (yyval.PrintSt) = new PrintExpr(((yystack.valueAt (1)).Expr)); (yyval.PrintSt).linkLast(((yystack.valueAt (0)).PrintTa)); }
      break;

    case 62: /* PrintSt: STRING Expr PrintTa  */
#line 119 "grammar.y"
                              { (yyval.PrintSt) = new String(((yystack.valueAt (2)).STRING)); (yyval.PrintSt).linkLast(new PrintExpr(((yystack.valueAt (1)).Expr))); (yyval.PrintSt).linkLast(((yystack.valueAt (0)).PrintTa)); }
      break;

    case 63: /* PrintSt: StrExpr SEMICOLON  */
#line 120 "grammar.y"
                            { (yyval.PrintSt) = new PrintString(((yystack.valueAt (1)).StrExpr)); }
      break;

    case 64: /* PrintSt: StrExpr COMMA  */
#line 121 "grammar.y"
                        { (yyval.PrintSt) = new PrintString(((yystack.valueAt (1)).StrExpr)); (yyval.PrintSt).linkLast(new Comma()); }
      break;

    case 65: /* PrintSt: TAB LPAREN Expr RPAREN SEMICOLON  */
#line 122 "grammar.y"
                                           { (yyval.PrintSt) = new PrintTab(((yystack.valueAt (2)).Expr)); }
      break;

    case 66: /* PrintEn: Expr  */
#line 125 "grammar.y"
               { (yyval.PrintEn) = new PrintExpr(((yystack.valueAt (0)).Expr)); (yyval.PrintEn).linkLast(new NewLine()); }
      break;

    case 67: /* PrintEn: STRING Expr  */
#line 126 "grammar.y"
                      { (yyval.PrintEn) = new String(((yystack.valueAt (1)).STRING)); (yyval.PrintEn).linkLast(new PrintExpr(((yystack.valueAt (0)).Expr))); (yyval.PrintEn).linkLast(new NewLine()); }
      break;

    case 68: /* PrintEn: StrExpr  */
#line 127 "grammar.y"
                  { (yyval.PrintEn) = new PrintString(((yystack.valueAt (0)).StrExpr)); (yyval.PrintEn).linkLast(new NewLine()); }
      break;

    case 69: /* PrintEn: PrintSt  */
#line 128 "grammar.y"
                  { (yyval.PrintEn) = ((yystack.valueAt (0)).PrintSt); }
      break;

    case 70: /* PrintTa: COMMA  */
#line 131 "grammar.y"
                { (yyval.PrintTa) = new Comma(); }
      break;

    case 71: /* PrintTa: SEMICOLON  */
#line 132 "grammar.y"
                    { (yyval.PrintTa) = new SemiColon(); }
      break;

    case 72: /* DataSq: Data  */
#line 135 "grammar.y"
               {}
      break;

    case 73: /* DataSq: DataSq COMMA Data  */
#line 136 "grammar.y"
                            {}
      break;

    case 74: /* Data: INTEGER  */
#line 139 "grammar.y"
                  { symtab.installData(cast(double)((yystack.valueAt (0)).INTEGER)); }
      break;

    case 75: /* Data: NUMBER  */
#line 140 "grammar.y"
                 { symtab.installData(((yystack.valueAt (0)).NUMBER)); }
      break;

    case 76: /* Data: MINUS INTEGER  */
#line 141 "grammar.y"
                        { symtab.installData(cast(double)-((yystack.valueAt (0)).INTEGER)); }
      break;

    case 77: /* Data: MINUS NUMBER  */
#line 142 "grammar.y"
                       { symtab.installData(-((yystack.valueAt (0)).NUMBER)); }
      break;

    case 78: /* Data: STRING  */
#line 143 "grammar.y"
                 { symtab.installData(((yystack.valueAt (0)).STRING)); }
      break;

    case 79: /* Data: DATASTRING  */
#line 144 "grammar.y"
                     { symtab.installData(((yystack.valueAt (0)).DATASTRING)); }
      break;

    case 80: /* ReadSq: Read  */
#line 147 "grammar.y"
               {}
      break;

    case 81: /* ReadSq: ReadSq COMMA Read  */
#line 148 "grammar.y"
                            {}
      break;

    case 82: /* Read: IDENT  */
#line 151 "grammar.y"
                { (yyval.Read) = new Read(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Read)); }
      break;

    case 83: /* Read: IDENT LPAREN Expr RPAREN  */
#line 152 "grammar.y"
                                   { (yyval.Read) = new ReadDim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Read)); }
      break;

    case 84: /* Read: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 153 "grammar.y"
                                              { (yyval.Read) = new ReadDim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Read)); }
      break;

    case 85: /* Read: IDENT DOLLAR  */
#line 154 "grammar.y"
                       { (yyval.Read) = new ReadString(((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Read)); }
      break;

    case 86: /* Read: IDENT DOLLAR LPAREN Expr RPAREN  */
#line 155 "grammar.y"
                                          { (yyval.Read) = new ReadDimString(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Read)); }
      break;

    case 87: /* DimSq: Dim  */
#line 158 "grammar.y"
              {}
      break;

    case 88: /* DimSq: DimSq COMMA Dim  */
#line 159 "grammar.y"
                          {}
      break;

    case 89: /* Dim: IDENT LPAREN INTEGER RPAREN  */
#line 162 "grammar.y"
                                      { symtab.initializeDim(((yystack.valueAt (3)).IDENT), true, cast(ushort)((yystack.valueAt (1)).INTEGER)); }
      break;

    case 90: /* Dim: IDENT LPAREN INTEGER COMMA INTEGER RPAREN  */
#line 163 "grammar.y"
                                                    { symtab.initializeDim2(((yystack.valueAt (5)).IDENT), true, cast(ushort)((yystack.valueAt (3)).INTEGER), cast(ushort)((yystack.valueAt (1)).INTEGER)); }
      break;

    case 91: /* Dim: IDENT DOLLAR LPAREN INTEGER RPAREN  */
#line 164 "grammar.y"
                                             { symtab.initializeDimString(((yystack.valueAt (4)).IDENT), true, cast(ushort)((yystack.valueAt (1)).INTEGER)); }
      break;

    case 92: /* IdSq: IDENT  */
#line 167 "grammar.y"
                { int[] i; (yyval.IdSq) = i; (yyval.IdSq) ~= ((yystack.valueAt (0)).IDENT); }
      break;

    case 93: /* IdSq: IdSq COMMA IDENT  */
#line 168 "grammar.y"
                           { (yyval.IdSq) ~= ((yystack.valueAt (0)).IDENT); }
      break;

    case 94: /* ExprSq: Expr  */
#line 171 "grammar.y"
               { Expr[] e; (yyval.ExprSq) = e; (yyval.ExprSq) ~= ((yystack.valueAt (0)).Expr); }
      break;

    case 95: /* ExprSq: ExprSq COMMA Expr  */
#line 172 "grammar.y"
                            { (yyval.ExprSq) ~= ((yystack.valueAt (0)).Expr); }
      break;

    case 96: /* MatPr: MatPrEn  */
#line 175 "grammar.y"
                  { (yyval.MatPr) = ((yystack.valueAt (0)).MatPrEn); }
      break;

    case 97: /* MatPr: MatPrSq MatPrEn  */
#line 176 "grammar.y"
                          { (yyval.MatPr) = ((yystack.valueAt (1)).MatPrSq); (yyval.MatPr).linkLast(((yystack.valueAt (0)).MatPrEn)); }
      break;

    case 98: /* MatPrSq: MatPrSt  */
#line 179 "grammar.y"
                  { (yyval.MatPrSq) = ((yystack.valueAt (0)).MatPrSt); }
      break;

    case 99: /* MatPrSq: MatPrSq MatPrSt  */
#line 180 "grammar.y"
                          { (yyval.MatPrSq).linkLast(((yystack.valueAt (0)).MatPrSt)); }
      break;

    case 100: /* MatPrSt: IDENT COMMA  */
#line 183 "grammar.y"
                      { (yyval.MatPrSt) = new MatPrint(((yystack.valueAt (1)).IDENT)); }
      break;

    case 101: /* MatPrSt: IDENT SEMICOLON  */
#line 184 "grammar.y"
                          { (yyval.MatPrSt) = new MatPrint(((yystack.valueAt (1)).IDENT), true); }
      break;

    case 102: /* MatPrSt: IDENT DOLLAR COMMA  */
#line 185 "grammar.y"
                             { (yyval.MatPrSt) = new MatPrintString(((yystack.valueAt (2)).IDENT)); }
      break;

    case 103: /* MatPrSt: IDENT DOLLAR SEMICOLON  */
#line 186 "grammar.y"
                                 { (yyval.MatPrSt) = new MatPrintString(((yystack.valueAt (2)).IDENT), true); }
      break;

    case 104: /* MatPrEn: IDENT  */
#line 189 "grammar.y"
                { (yyval.MatPrEn) = new MatPrint(((yystack.valueAt (0)).IDENT)); }
      break;

    case 105: /* MatPrEn: IDENT SEMICOLON  */
#line 190 "grammar.y"
                          { (yyval.MatPrEn) = new MatPrint(((yystack.valueAt (1)).IDENT), true); }
      break;

    case 106: /* MatPrEn: IDENT DOLLAR  */
#line 191 "grammar.y"
                       { (yyval.MatPrEn) = new MatPrintString(((yystack.valueAt (1)).IDENT)); }
      break;

    case 107: /* MatPrEn: IDENT DOLLAR SEMICOLON  */
#line 192 "grammar.y"
                                 { (yyval.MatPrEn) = new MatPrintString(((yystack.valueAt (2)).IDENT), true); }
      break;

    case 108: /* MatRdSq: MatRead  */
#line 195 "grammar.y"
                  {}
      break;

    case 109: /* MatRdSq: MatRdSq COMMA MatRead  */
#line 196 "grammar.y"
                                {}
      break;

    case 110: /* MatRead: IDENT LPAREN Expr RPAREN  */
#line 199 "grammar.y"
                                   { (yyval.MatRead) = new MatRead(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.MatRead)); }
      break;

    case 111: /* MatRead: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 200 "grammar.y"
                                              { (yyval.MatRead) = new MatRead2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.MatRead)); }
      break;

    case 112: /* MatRead: IDENT DOLLAR LPAREN Expr RPAREN  */
#line 201 "grammar.y"
                                          { (yyval.MatRead) = new MatReadString(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.MatRead)); }
      break;

    case 113: /* InputSq: Input  */
#line 204 "grammar.y"
                {}
      break;

    case 114: /* InputSq: InputSq COMMA Input  */
#line 205 "grammar.y"
                              {}
      break;

    case 115: /* Input: IDENT  */
#line 208 "grammar.y"
                { (yyval.Input) = new Input(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Input)); }
      break;

    case 116: /* Input: IDENT LPAREN Expr RPAREN  */
#line 209 "grammar.y"
                                   { (yyval.Input) = new InputDim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Input)); }
      break;

    case 117: /* Input: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 210 "grammar.y"
                                              { (yyval.Input) = new InputDim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Input)); }
      break;

    case 118: /* Input: IDENT DOLLAR  */
#line 211 "grammar.y"
                       { (yyval.Input) = new InputString(((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Input)); }
      break;

    case 119: /* Expr: NUMBER  */
#line 214 "grammar.y"
                 { (yyval.Expr) = new Constant(symtab.installConstant(((yystack.valueAt (0)).NUMBER))); }
      break;

    case 120: /* Expr: INTEGER  */
#line 215 "grammar.y"
                  { (yyval.Expr) = new Constant(symtab.installConstant(((yystack.valueAt (0)).INTEGER))); }
      break;

    case 121: /* Expr: IDENT  */
#line 216 "grammar.y"
                { (yyval.Expr) = new Identifier(((yystack.valueAt (0)).IDENT)); }
      break;

    case 122: /* Expr: MATHFN Expr RPAREN  */
#line 217 "grammar.y"
                             { (yyval.Expr) = new MathFn(((yystack.valueAt (2)).MATHFN), ((yystack.valueAt (1)).Expr)); }
      break;

    case 123: /* Expr: FN IDENT LPAREN ExprSq RPAREN  */
#line 218 "grammar.y"
                                        { (yyval.Expr) = new FnCall(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).ExprSq)); }
      break;

    case 124: /* Expr: FN IDENT  */
#line 219 "grammar.y"
                   { (yyval.Expr) = (symtab.edition >= Edition.Fourth) ? new Identifier(symtab.installId("FN" ~ symtab.getId(((yystack.valueAt (0)).IDENT)))) : new FnCall(((yystack.valueAt (0)).IDENT), new Expr[0]); }
      break;

    case 125: /* Expr: IDENT LPAREN Expr RPAREN  */
#line 220 "grammar.y"
                                   { (yyval.Expr) = new Dim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); }
      break;

    case 126: /* Expr: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 221 "grammar.y"
                                              { (yyval.Expr) = new Dim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); }
      break;

    case 127: /* Expr: Expr PLUS Expr  */
#line 222 "grammar.y"
                         { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Add, ((yystack.valueAt (0)).Expr)); }
      break;

    case 128: /* Expr: Expr MINUS Expr  */
#line 223 "grammar.y"
                          { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Sub, ((yystack.valueAt (0)).Expr)); }
      break;

    case 129: /* Expr: Expr TIMES Expr  */
#line 224 "grammar.y"
                          { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Mul, ((yystack.valueAt (0)).Expr)); }
      break;

    case 130: /* Expr: Expr DIVIDE Expr  */
#line 225 "grammar.y"
                           { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Div, ((yystack.valueAt (0)).Expr)); }
      break;

    case 131: /* Expr: Expr EXP Expr  */
#line 226 "grammar.y"
                        { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Exp, ((yystack.valueAt (0)).Expr)); }
      break;

    case 132: /* Expr: MINUS Expr  */
#line 227 "grammar.y"
                                  { (yyval.Expr) = new Operation(((yystack.valueAt (0)).Expr), Op.Neg); }
      break;

    case 133: /* Expr: LPAREN Expr RPAREN  */
#line 228 "grammar.y"
                             { (yyval.Expr) = ((yystack.valueAt (1)).Expr); }
      break;

    case 134: /* Expr: DET  */
#line 229 "grammar.y"
              { (yyval.Expr) = new Identifier(symtab.installId("DET")); }
      break;

    case 135: /* Expr: NUM  */
#line 230 "grammar.y"
              { (yyval.Expr) = new Identifier(symtab.installId("NUM")); }
      break;

    case 136: /* Expr: RND  */
#line 231 "grammar.y"
              { (yyval.Expr) = new MathFn("RND", null); }
      break;

    case 137: /* StrExpr: IDENT DOLLAR  */
#line 234 "grammar.y"
                       { (yyval.StrExpr) = new StringVariable(((yystack.valueAt (1)).IDENT)); }
      break;

    case 138: /* StrExpr: IDENT DOLLAR LPAREN Expr RPAREN  */
#line 235 "grammar.y"
                                          { (yyval.StrExpr) = new StringIndexed(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (1)).Expr)); }
      break;

    case 139: /* StrExpr: STRING  */
#line 236 "grammar.y"
                 { (yyval.StrExpr) = new StringConstant(((yystack.valueAt (0)).STRING)); }
      break;

    case 140: /* GotoThen: GO TO  */
#line 239 "grammar.y"
                {}
      break;

    case 141: /* GotoThen: THEN  */
#line 240 "grammar.y"
               {}
      break;

    case 142: /* GotoSq: INTEGER  */
#line 243 "grammar.y"
                  { int[] l; (yyval.GotoSq) = l; (yyval.GotoSq) ~= ((yystack.valueAt (0)).INTEGER); symtab.registerFlow(cast(ushort)((yystack.valueAt (0)).INTEGER)); }
      break;

    case 143: /* GotoSq: GotoSq COMMA INTEGER  */
#line 244 "grammar.y"
                               { (yyval.GotoSq) ~= ((yystack.valueAt (0)).INTEGER); symtab.registerFlow(cast(ushort)((yystack.valueAt (0)).INTEGER)); }
      break;


#line 1203 "Parser.d"

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
  private static immutable short yypact_ninf_ = -52;

  /* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule which
     number is the opposite.  If YYTABLE_NINF_, syntax error.  */
  private static immutable short yytable_ninf_ = -108;

    /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
private static immutable short[] yypact_ =
[
     -52,    35,   -52,   -52,   270,    -3,    40,     8,     2,    15,
      79,    70,    82,   -52,   -52,    59,    95,   -52,   107,   -52,
      63,   -45,   117,   128,   -52,   109,   120,    80,   -25,   135,
      10,    86,   -52,   -52,   -52,   -52,   -52,    29,    90,   -52,
      26,   120,   -52,   -52,   120,   146,   -52,   -52,    85,   -52,
     120,   120,   -52,     2,    94,   -52,   369,   -51,   147,   -52,
      -4,     3,   111,   -52,   154,   -52,    27,   104,   -52,   118,
     158,   162,   163,   -52,   -52,    38,   115,   -52,   -32,   -52,
     119,    84,   -52,   120,   120,   -24,   134,   120,   121,    40,
     -52,   -52,     8,   120,   129,   369,   211,   130,   120,   265,
     125,    94,   -52,   -52,   -52,   120,   120,   120,   120,   120,
     -52,   -52,   -52,   -52,   120,   120,   101,   101,   120,   -20,
     178,   142,   107,    14,    48,   144,   -52,     1,   -52,   162,
     -52,   -52,   -52,   120,   -52,   117,   197,   175,   177,   -52,
     204,   196,   167,   101,   120,   120,   180,   120,   -52,   -52,
     186,   120,   -52,   -52,   120,   271,   -52,   -41,   -41,   125,
     125,   125,   113,   124,   157,   184,   185,   133,   120,   213,
      57,   212,   -52,     6,   169,   171,   173,   174,   188,   120,
     120,   194,   158,    62,   -52,   179,   -52,   -52,   252,   -52,
     198,   223,   -52,   -52,   183,   209,   120,   -52,   278,   196,
     -52,   120,   284,   -52,   120,   291,    61,   196,   199,   250,
     256,   259,   263,   120,   196,   -52,    72,   -52,   264,   224,
     275,   298,   299,   120,   120,   120,   302,   305,   297,   258,
     120,   -52,   -52,   243,   -52,   120,   -52,   -52,   320,   120,
     304,   294,   310,   -52,   317,   -52,   -52,   120,   -52,   -52,
     -52,   -52,   -52,   141,   307,   306,   255,   -52,   -52,   -52,
     -52,   375,   386,   323,   312,   325,   327,   -52,   120,   330,
     336,   -52,   196,   359,   101,   -52,   -52,   196,   120,   120,
     -52,   -52,   120,   120,   -52,   -52,   -52,   411,   343,   -52,
     -52,   120,   -52,   196,   196,   349,   356,   -52,   -52,   196,
     -52,   -52
];

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
private static immutable short[] yydefact_ =
[
       2,     0,     1,     4,     0,     0,     0,     0,    56,     0,
       0,     0,     0,    24,     5,     0,     0,    22,     0,    23,
       0,    40,     0,     0,    49,     0,     0,     0,     0,     0,
      82,    18,    80,    78,    74,    79,    75,     0,    17,    72,
     121,   139,   120,   119,     0,     0,   134,   135,     0,   136,
       0,     0,     6,     0,    59,    57,    66,    68,     0,   139,
       0,     0,     0,    16,     0,     8,     0,    19,    87,     0,
       0,     0,     0,    51,    50,   115,    41,   113,     0,    55,
     121,     0,     3,     0,     0,     0,     0,     0,    85,     0,
      76,    77,     0,     0,   137,    67,     0,   124,     0,     0,
     132,    60,    58,    70,    71,     0,     0,     0,     0,     0,
      61,    64,    63,     7,     0,     0,     0,     0,     0,    53,
       0,     0,     0,     0,     0,    25,   108,   104,    26,     0,
      98,    96,    39,     0,   118,     0,     0,     0,     0,   141,
       0,     9,     0,     0,     0,     0,     0,     0,    81,    73,
       0,     0,    62,   122,     0,     0,   133,   127,   128,   129,
     130,   131,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    88,     0,    36,    37,    38,     0,     0,     0,
       0,     0,     0,   106,   100,   101,    99,    97,     0,   114,
       0,     0,   140,   142,    46,     0,     0,    42,     0,    54,
      83,     0,     0,   125,     0,     0,     0,    94,     0,     0,
       0,     0,     0,     0,    21,    92,     0,    89,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   109,   102,   103,   116,     0,    48,    47,     0,     0,
       0,     0,     0,    86,     0,   138,   123,     0,    65,    12,
      13,    44,    45,    15,    52,     0,     0,    91,    27,    28,
      29,     0,     0,     0,     0,     0,     0,   110,     0,     0,
       0,   143,    10,     0,     0,    84,   126,    95,     0,     0,
      93,    90,     0,     0,    32,    33,    34,     0,     0,   112,
     117,     0,    43,    14,    20,     0,     0,    35,   111,    11,
      30,    31
];

  /* YYPGOTO[NTERM-NUM].  */
private static immutable short[] yypgoto_ =
[
     -52,   -52,   -52,   -52,   -52,   -52,   365,   370,   332,   -52,
     337,   -52,   339,   -52,   308,   -52,   -52,   -52,   -52,   315,
     316,   -52,   254,   -52,   311,   -10,    -7,   -52,   -52
];

  /* YYDEFGOTO[NTERM-NUM].  */
private static immutable short[] yydefgoto_ =
[
       0,     1,     4,    27,    52,    53,    54,    55,   110,    38,
      39,    31,    32,    67,    68,   216,   206,   128,   129,   130,
     131,   125,   126,    76,    77,    56,    57,   140,   194
];

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
private static immutable short[] yytable_ =
[
      60,   136,    28,    61,   114,   111,   112,    40,    41,    42,
      73,   116,    43,    44,    33,    34,    81,    35,    36,   173,
      74,    83,   143,   137,   107,   108,   168,   109,    84,   144,
      85,    95,    29,   169,    96,     2,    90,    45,     3,    91,
      99,   100,   115,    46,    47,    30,    48,    49,    58,   117,
     174,   175,   176,   177,   178,    50,   183,   184,   185,   105,
     106,   107,   108,    87,   109,    88,    51,   179,    69,   220,
     221,   222,    37,   141,   142,    62,    70,   146,    71,    93,
     120,    94,   121,   150,    40,    59,    42,    63,   155,    43,
      44,   133,    72,   134,    64,   157,   158,   159,   160,   161,
     138,   180,    65,   181,   162,   163,   164,    59,   167,   165,
     166,   217,    66,   218,    45,   246,   139,   247,   232,   233,
      46,    47,    75,   188,    49,    80,   254,    42,   255,    79,
      43,    44,    50,    78,   198,   199,   197,   202,    98,    82,
      86,   205,    89,    51,   207,   209,    92,   105,   106,   107,
     108,    97,   109,   -69,   113,    45,   210,   118,   214,   119,
     122,    46,    47,   124,   123,    49,   213,   127,   132,   228,
     229,   135,    93,    50,   147,   278,   105,   106,   107,   108,
     145,   109,   151,   154,    51,   170,   240,   105,   106,   107,
     108,   242,   109,   109,   244,   171,   105,   106,   107,   108,
     182,   109,   190,   253,   105,   106,   107,   108,   191,   109,
     192,   193,    94,   261,   262,   263,   211,   212,   215,   219,
     269,   195,   223,   196,   224,   270,   225,   226,   237,   272,
     105,   106,   107,   108,   200,   109,   201,   277,  -105,   238,
     203,   227,   204,   105,   106,   107,   108,   230,   109,   105,
     106,   107,   108,   236,   109,   239,   248,   249,   288,   105,
     106,   107,   108,   250,   109,   153,   251,   292,   293,   294,
     252,   256,   295,   296,   105,   106,   107,   108,   257,   109,
     258,   299,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,  -107,   259,   260,    25,   234,   264,   235,   281,
     265,   280,   267,    26,   268,   105,   106,   107,   108,   156,
     109,   105,   106,   107,   108,   208,   109,   271,   105,   106,
     107,   108,   241,   109,   105,   106,   107,   108,   243,   109,
     274,   105,   106,   107,   108,   245,   109,   105,   106,   107,
     108,   266,   109,   279,   105,   106,   107,   108,   273,   109,
     105,   106,   107,   108,   275,   109,   285,   105,   106,   107,
     108,   276,   109,   105,   106,   107,   108,   284,   109,   286,
     105,   106,   107,   108,   289,   109,   105,   106,   107,   108,
     290,   109,   287,   105,   106,   107,   108,   298,   109,   105,
     106,   107,   108,   300,   109,   291,   105,   106,   107,   108,
     301,   109,   105,   106,   107,   108,   297,   109,   101,   105,
     106,   107,   108,   102,   109,   103,   104,   152,   148,   149,
     172,   282,   105,   106,   107,   108,   231,   109,   105,   106,
     107,   108,   283,   109,   186,   187,   189,     0,     0,   105,
     106,   107,   108,     0,   109
];

private static immutable short[] yycheck_ =
[
      10,    33,     5,    10,     8,    56,    57,     5,     6,     7,
      55,     8,    10,    11,     6,     7,    26,     9,    10,     5,
      65,    46,    46,    55,    65,    66,    46,    68,    53,    53,
      55,    41,    35,    53,    44,     0,     7,    35,     3,    10,
      50,    51,    46,    41,    42,     5,    44,    45,    33,    46,
      36,    37,    38,    39,    40,    53,    55,    56,    57,    63,
      64,    65,    66,    53,    68,    55,    64,    53,     5,    63,
      64,    65,    64,    83,    84,     5,    13,    87,    15,    53,
      53,    55,    55,    93,     5,     6,     7,     5,    98,    10,
      11,    53,    29,    55,    35,   105,   106,   107,   108,   109,
      16,    53,     7,    55,   114,   115,     5,     6,   118,   116,
     117,    54,     5,    56,    35,    54,    32,    56,    56,    57,
      41,    42,     5,   133,    45,     5,    54,     7,    56,    20,
      10,    11,    53,     5,   144,   145,   143,   147,    53,    59,
       5,   151,    56,    64,   154,    32,    56,    63,    64,    65,
      66,     5,    68,    59,     7,    35,    32,    46,   168,     5,
      56,    41,    42,     5,    46,    45,    33,     5,     5,   179,
     180,    56,    53,    53,    53,    34,    63,    64,    65,    66,
      46,    68,    53,    53,    64,     7,   196,    63,    64,    65,
      66,   201,    68,    68,   204,    53,    63,    64,    65,    66,
      56,    68,     5,   213,    63,    64,    65,    66,    33,    68,
      33,     7,    55,   223,   224,   225,    32,    32,     5,     7,
     230,    54,    53,    56,    53,   235,    53,    53,     5,   239,
      63,    64,    65,    66,    54,    68,    56,   247,    59,    56,
      54,    53,    56,    63,    64,    65,    66,    53,    68,    63,
      64,    65,    66,    55,    68,    46,    57,     7,   268,    63,
      64,    65,    66,     7,    68,    54,     7,   274,   278,   279,
       7,     7,   282,   283,    63,    64,    65,    66,    54,    68,
       5,   291,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    59,     5,     5,    35,    54,     5,    56,    54,
       5,     5,    54,    43,    56,    63,    64,    65,    66,    54,
      68,    63,    64,    65,    66,    54,    68,     7,    63,    64,
      65,    66,    54,    68,    63,    64,    65,    66,    54,    68,
      46,    63,    64,    65,    66,    54,    68,    63,    64,    65,
      66,    54,    68,    46,    63,    64,    65,    66,    54,    68,
      63,    64,    65,    66,    54,    68,    54,    63,    64,    65,
      66,    54,    68,    63,    64,    65,    66,    54,    68,    54,
      63,    64,    65,    66,    54,    68,    63,    64,    65,    66,
      54,    68,    65,    63,    64,    65,    66,    54,    68,    63,
      64,    65,    66,    54,    68,    46,    63,    64,    65,    66,
      54,    68,    63,    64,    65,    66,     5,    68,    53,    63,
      64,    65,    66,    53,    68,    56,    57,    95,    89,    92,
     122,    56,    63,    64,    65,    66,   182,    68,    63,    64,
      65,    66,    56,    68,   129,   129,   135,    -1,    -1,    63,
      64,    65,    66,    -1,    68
];

  /* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
     state STATE-NUM.  */
private static immutable byte[] yystos_ =
[
       0,    70,     0,     3,    71,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    35,    43,    72,     5,    35,
       5,    80,    81,     6,     7,     9,    10,    64,    78,    79,
       5,     6,     7,    10,    11,    35,    41,    42,    44,    45,
      53,    64,    73,    74,    75,    76,    94,    95,    33,     6,
      94,    95,     5,     5,    35,     7,     5,    82,    83,     5,
      13,    15,    29,    55,    65,     5,    92,    93,     5,    20,
       5,    94,    59,    46,    53,    55,     5,    53,    55,    56,
       7,    10,    56,    53,    55,    94,    94,     5,    53,    94,
      94,    75,    76,    56,    57,    63,    64,    65,    66,    68,
      77,    56,    57,     7,     8,    46,     8,    46,    46,     5,
      53,    55,    56,    46,     5,    90,    91,     5,    86,    87,
      88,    89,     5,    53,    55,    56,    33,    55,    16,    32,
      96,    94,    94,    46,    53,    46,    94,    53,    81,    79,
      94,    53,    77,    54,    53,    94,    54,    94,    94,    94,
      94,    94,    94,    94,     5,    95,    95,    94,    46,    53,
       7,    53,    83,     5,    36,    37,    38,    39,    40,    53,
      53,    55,    56,    55,    56,    57,    88,    89,    94,    93,
       5,    33,    33,     7,    97,    54,    56,    95,    94,    94,
      54,    56,    94,    54,    56,    94,    85,    94,    54,    32,
      32,    32,    32,    33,    94,     5,    84,    54,    56,     7,
      63,    64,    65,    53,    53,    53,    53,    53,    94,    94,
      53,    91,    56,    57,    54,    56,    55,     5,    56,    46,
      94,    54,    94,    54,    94,    54,    54,    56,    57,     7,
       7,     7,     7,    94,    54,    56,     7,    54,     5,     5,
       5,    94,    94,    94,     5,     5,    54,    54,    56,    94,
      94,     7,    94,    54,    46,    54,    54,    94,    34,    46,
       5,    54,    56,    56,    54,    54,    54,    65,    94,    54,
      54,    46,    95,    94,    94,    94,    94,     5,    54,    94,
      54,    54
];

  /* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
private static immutable byte[] yyr1_ =
[
       0,    69,    70,    70,    71,    72,    72,    72,    72,    72,
      72,    72,    72,    72,    72,    72,    72,    72,    72,    72,
      72,    72,    72,    72,    72,    72,    72,    72,    72,    72,
      72,    72,    72,    72,    72,    72,    72,    72,    72,    72,
      72,    72,    72,    72,    72,    72,    72,    72,    72,    72,
      72,    72,    72,    72,    72,    72,    73,    73,    73,    74,
      74,    75,    75,    75,    75,    75,    76,    76,    76,    76,
      77,    77,    78,    78,    79,    79,    79,    79,    79,    79,
      80,    80,    81,    81,    81,    81,    81,    82,    82,    83,
      83,    83,    84,    84,    85,    85,    86,    86,    87,    87,
      88,    88,    88,    88,    89,    89,    89,    89,    90,    90,
      91,    91,    91,    92,    92,    93,    93,    93,    93,    94,
      94,    94,    94,    94,    94,    94,    94,    94,    94,    94,
      94,    94,    94,    94,    94,    94,    94,    95,    95,    95,
      96,    96,    97,    97
];

  /* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
private static immutable byte[] yyr2_ =
[
       0,     2,     0,     4,     1,     1,     2,     3,     2,     4,
       7,     9,     6,     6,     8,     6,     2,     2,     2,     2,
       8,     5,     1,     1,     1,     3,     3,     6,     6,     6,
       9,     9,     7,     7,     7,     8,     4,     4,     4,     3,
       1,     2,     5,     8,     6,     6,     4,     5,     5,     1,
       2,     2,     6,     3,     5,     2,     0,     1,     2,     1,
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

  private static immutable int yylast_ = 454;
  private static immutable int yynnts_ = 29;
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

#line 1927 "Parser.d"

}

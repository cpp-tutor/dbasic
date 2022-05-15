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
  int[] IdSq;                            /* IdSq  */
  string MATHFN;                           /* MATHFN  */
  string FNIDENT;                          /* FNIDENT  */
  ushort LINENO;                           /* LINENO  */

#line 141 "Parser.d"

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
  FNIDENT = 11,
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
  THEN = 30,
  TO = 31,
  STEP = 32,
  ZER = 33,
  CON = 34,
  IDN = 35,
  TRN = 36,
  INV = 37,
  DET = 38,
  NUM = 39,
  ASSIGN = 40,
  EQ = 41,
  NE = 42,
  LT = 43,
  LE = 44,
  GE = 45,
  GT = 46,
  LPAREN = 47,
  RPAREN = 48,
  DOLLAR = 49,
  COMMA = 50,
  SEMICOLON = 51,
  EOL = 52,
  WS = 53,
  BLANKLINE = 54,
  BADLINE = 55,
  PLUS = 56,
  MINUS = 57,
  TIMES = 58,
  DIVIDE = 59,
  UMINUS = 60,
  EXP = 61,
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
    NUMBER = 9,                    /* NUMBER  */
    MATHFN = 10,                   /* MATHFN  */
    FNIDENT = 11,                  /* FNIDENT  */
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
    THEN = 30,                     /* THEN  */
    TO = 31,                       /* TO  */
    STEP = 32,                     /* STEP  */
    ZER = 33,                      /* ZER  */
    CON = 34,                      /* CON  */
    IDN = 35,                      /* IDN  */
    TRN = 36,                      /* TRN  */
    INV = 37,                      /* INV  */
    DET = 38,                      /* DET  */
    NUM = 39,                      /* NUM  */
    ASSIGN = 40,                   /* ASSIGN  */
    EQ = 41,                       /* EQ  */
    NE = 42,                       /* NE  */
    LT = 43,                       /* LT  */
    LE = 44,                       /* LE  */
    GE = 45,                       /* GE  */
    GT = 46,                       /* GT  */
    LPAREN = 47,                   /* LPAREN  */
    RPAREN = 48,                   /* RPAREN  */
    DOLLAR = 49,                   /* DOLLAR  */
    COMMA = 50,                    /* COMMA  */
    SEMICOLON = 51,                /* SEMICOLON  */
    EOL = 52,                      /* EOL  */
    WS = 53,                       /* WS  */
    BLANKLINE = 54,                /* BLANKLINE  */
    BADLINE = 55,                  /* BADLINE  */
    PLUS = 56,                     /* PLUS  */
    MINUS = 57,                    /* MINUS  */
    TIMES = 58,                    /* TIMES  */
    DIVIDE = 59,                   /* DIVIDE  */
    UMINUS = 60,                   /* UMINUS  */
    EXP = 61,                      /* EXP  */
    YYACCEPT = 62,                 /* $accept  */
    Stmts = 63,                    /* Stmts  */
    Stmt = 64,                     /* Stmt  */
    Lineno = 65,                   /* Lineno  */
    Print = 66,                    /* Print  */
    PrintSq = 67,                  /* PrintSq  */
    PrintSt = 68,                  /* PrintSt  */
    PrintEn = 69,                  /* PrintEn  */
    PrintTa = 70,                  /* PrintTa  */
    DataSq = 71,                   /* DataSq  */
    Data = 72,                     /* Data  */
    ReadSq = 73,                   /* ReadSq  */
    Read = 74,                     /* Read  */
    DimSq = 75,                    /* DimSq  */
    Dim = 76,                      /* Dim  */
    IdSq = 77,                     /* IdSq  */
    ExprSq = 78,                   /* ExprSq  */
    MatPr = 79,                    /* MatPr  */
    MatPrSq = 80,                  /* MatPrSq  */
    MatPrSt = 81,                  /* MatPrSt  */
    MatPrEn = 82,                  /* MatPrEn  */
    InputSq = 83,                  /* InputSq  */
    Input = 84,                    /* Input  */
    Expr = 85,                     /* Expr  */
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
  "STRING", "INTEGER", "RELOP", "NUMBER", "MATHFN", "FNIDENT", "LET",
  "READ", "DATA", "PRINT", "GO", "IF", "FOR", "NEXT", "END", "STOP", "DEF",
  "GOSUB", "RETURN", "DIM", "REM", "MAT", "RESTORE", "INPUT", "THEN", "TO",
  "STEP", "ZER", "CON", "IDN", "TRN", "INV", "DET", "NUM", "ASSIGN", "EQ",
  "NE", "LT", "LE", "GE", "GT", "LPAREN", "RPAREN", "DOLLAR", "COMMA",
  "SEMICOLON", "EOL", "WS", "BLANKLINE", "BADLINE", "PLUS", "MINUS",
  "TIMES", "DIVIDE", "UMINUS", "EXP", "$accept", "Stmts", "Stmt", "Lineno",
  "Print", "PrintSq", "PrintSt", "PrintEn", "PrintTa", "DataSq", "Data",
  "ReadSq", "Read", "DimSq", "Dim", "IdSq", "ExprSq", "MatPr", "MatPrSq",
  "MatPrSt", "MatPrEn", "InputSq", "Input", "Expr", null
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
#line 48 "grammar.y"
                 { next = next.link((yyval.Stmt)); }
      break;

    case 5: /* Stmt: STOP EOL  */
#line 50 "grammar.y"
                   { (yyval.Stmt) = new Stop(); next = next.link((yyval.Stmt)); }
      break;

    case 6: /* Stmt: PRINT Print EOL  */
#line 51 "grammar.y"
                          { (yyval.Stmt) = new Print(((yystack.valueAt (1)).Print)); next = next.link((yyval.Stmt)); }
      break;

    case 7: /* Stmt: GO TO INTEGER EOL  */
#line 52 "grammar.y"
                            { symtab.registerFlow(cast(ushort)((yystack.valueAt (1)).INTEGER)); (yyval.Stmt) = new Goto(cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 8: /* Stmt: GOSUB INTEGER EOL  */
#line 53 "grammar.y"
                            { symtab.registerFlow(cast(ushort)((yystack.valueAt (1)).INTEGER)); (yyval.Stmt) = new GoSub(cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 9: /* Stmt: LET IDENT ASSIGN Expr EOL  */
#line 54 "grammar.y"
                                    { (yyval.Stmt) = new Let(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 10: /* Stmt: LET IDENT LPAREN Expr RPAREN ASSIGN Expr EOL  */
#line 55 "grammar.y"
                                                       { (yyval.Stmt) = new LetDim(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 11: /* Stmt: LET IDENT LPAREN Expr COMMA Expr RPAREN ASSIGN Expr EOL  */
#line 56 "grammar.y"
                                                                  { (yyval.Stmt) = new LetDim2(((yystack.valueAt (8)).IDENT), ((yystack.valueAt (6)).Expr), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 12: /* Stmt: IF Expr RELOP Expr THEN INTEGER EOL  */
#line 57 "grammar.y"
                                              { (yyval.Stmt) = new If(((yystack.valueAt (5)).Expr), ((yystack.valueAt (4)).RELOP), ((yystack.valueAt (3)).Expr), cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 13: /* Stmt: IF Expr ASSIGN Expr THEN INTEGER EOL  */
#line 58 "grammar.y"
                                               { (yyval.Stmt) = new If(((yystack.valueAt (5)).Expr), TokenKind.EQ, ((yystack.valueAt (3)).Expr), cast(ushort)((yystack.valueAt (1)).INTEGER)); next = next.link((yyval.Stmt)); }
      break;

    case 14: /* Stmt: FOR IDENT ASSIGN Expr TO Expr STEP Expr EOL  */
#line 59 "grammar.y"
                                                      { (yyval.Stmt) = new For(((yystack.valueAt (7)).IDENT), ((yystack.valueAt (5)).Expr), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 15: /* Stmt: FOR IDENT ASSIGN Expr TO Expr EOL  */
#line 60 "grammar.y"
                                            { (yyval.Stmt) = new For(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr), new Constant(symtab.installConstant(1.0))); next = next.link((yyval.Stmt)); }
      break;

    case 16: /* Stmt: NEXT IDENT EOL  */
#line 61 "grammar.y"
                         { (yyval.Stmt) = new Next(((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 17: /* Stmt: DATA DataSq EOL  */
#line 62 "grammar.y"
                          {}
      break;

    case 18: /* Stmt: READ ReadSq EOL  */
#line 63 "grammar.y"
                          {}
      break;

    case 19: /* Stmt: DIM DimSq EOL  */
#line 64 "grammar.y"
                        {}
      break;

    case 20: /* Stmt: DEF FNIDENT LPAREN IdSq RPAREN ASSIGN Expr EOL  */
#line 65 "grammar.y"
                                                         { foreach(id; ((yystack.valueAt (4)).IdSq)) symtab.initializeId(id); symtab.addFunction(((yystack.valueAt (6)).FNIDENT), SymbolTable.Function(((yystack.valueAt (4)).IdSq), ((yystack.valueAt (1)).Expr))); }
      break;

    case 21: /* Stmt: DEF FNIDENT ASSIGN Expr EOL  */
#line 66 "grammar.y"
                                      { symtab.addFunction(((yystack.valueAt (3)).FNIDENT), SymbolTable.Function(new int[0], ((yystack.valueAt (1)).Expr))); }
      break;

    case 22: /* Stmt: RETURN EOL  */
#line 67 "grammar.y"
                     { (yyval.Stmt) = new Return(); next = next.link((yyval.Stmt)); }
      break;

    case 23: /* Stmt: REM EOL  */
#line 68 "grammar.y"
                  { }
      break;

    case 24: /* Stmt: END EOL  */
#line 69 "grammar.y"
                  { if (For.pop() != -1) symtab.error("FOR WITHOUT NEXT"); symtab.endOfProgram(); }
      break;

    case 25: /* Stmt: MAT READ IDENT LPAREN Expr COMMA Expr RPAREN EOL  */
#line 71 "grammar.y"
                                                           { symtab.initializeMat(((yystack.valueAt (6)).IDENT), true); (yyval.Stmt) = new MatRead(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (2)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 26: /* Stmt: MAT READ IDENT LPAREN Expr RPAREN EOL  */
#line 72 "grammar.y"
                                                { symtab.initializeMat(((yystack.valueAt (4)).IDENT), true); (yyval.Stmt) = new MatRead(((yystack.valueAt (4)).IDENT), ((yystack.valueAt (2)).Expr), new Constant(symtab.installConstant(1))); next = next.link((yyval.Stmt)); }
      break;

    case 27: /* Stmt: MAT PRINT MatPr EOL  */
#line 73 "grammar.y"
                              { (yyval.Stmt) = new MatPrint(((yystack.valueAt (1)).MatPr)); next = next.link((yyval.Stmt)); }
      break;

    case 28: /* Stmt: MAT IDENT ASSIGN IDENT PLUS IDENT EOL  */
#line 74 "grammar.y"
                                                { symtab.initializeMat(((yystack.valueAt (5)).IDENT), true); symtab.initializeMat(((yystack.valueAt (3)).IDENT)); symtab.initializeMat(((yystack.valueAt (1)).IDENT)); (yyval.Stmt) = new MatAdd(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 29: /* Stmt: MAT IDENT ASSIGN IDENT MINUS IDENT EOL  */
#line 75 "grammar.y"
                                                 { symtab.initializeMat(((yystack.valueAt (5)).IDENT), true); symtab.initializeMat(((yystack.valueAt (3)).IDENT)); symtab.initializeMat(((yystack.valueAt (1)).IDENT)); (yyval.Stmt) = new MatSub(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 30: /* Stmt: MAT IDENT ASSIGN IDENT TIMES IDENT EOL  */
#line 76 "grammar.y"
                                                 { symtab.initializeMat(((yystack.valueAt (5)).IDENT), true); symtab.initializeMat(((yystack.valueAt (3)).IDENT)); symtab.initializeMat(((yystack.valueAt (1)).IDENT)); (yyval.Stmt) = new MatMul(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 31: /* Stmt: MAT IDENT ASSIGN ZER LPAREN Expr COMMA Expr RPAREN EOL  */
#line 77 "grammar.y"
                                                                 { symtab.initializeMat(((yystack.valueAt (8)).IDENT), true); (yyval.Stmt) = new MatZerCon(((yystack.valueAt (8)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (2)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 32: /* Stmt: MAT IDENT ASSIGN CON LPAREN Expr COMMA Expr RPAREN EOL  */
#line 78 "grammar.y"
                                                                 { symtab.initializeMat(((yystack.valueAt (8)).IDENT), true); (yyval.Stmt) = new MatZerCon(((yystack.valueAt (8)).IDENT), ((yystack.valueAt (4)).Expr), ((yystack.valueAt (2)).Expr), true); next = next.link((yyval.Stmt)); }
      break;

    case 33: /* Stmt: MAT IDENT ASSIGN IDN LPAREN Expr RPAREN EOL  */
#line 79 "grammar.y"
                                                      { symtab.initializeMat(((yystack.valueAt (6)).IDENT), true); (yyval.Stmt) = new MatIdn(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (2)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 34: /* Stmt: MAT IDENT ASSIGN TRN LPAREN IDENT RPAREN EOL  */
#line 80 "grammar.y"
                                                       { symtab.initializeMat(((yystack.valueAt (6)).IDENT), true); symtab.initializeMat(((yystack.valueAt (2)).IDENT)); (yyval.Stmt) = new MatTrn(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (2)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 35: /* Stmt: MAT IDENT ASSIGN INV LPAREN IDENT RPAREN EOL  */
#line 81 "grammar.y"
                                                       { symtab.initializeMat(((yystack.valueAt (6)).IDENT), true); symtab.initializeMat(((yystack.valueAt (2)).IDENT)); if (symtab.edition >= Edition.Fourth) symtab.initializeId(symtab.installId("DET")); (yyval.Stmt) = new MatInv(((yystack.valueAt (6)).IDENT), ((yystack.valueAt (2)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 36: /* Stmt: MAT IDENT ASSIGN LPAREN Expr RPAREN TIMES IDENT EOL  */
#line 82 "grammar.y"
                                                              { symtab.initializeMat(((yystack.valueAt (7)).IDENT), true); symtab.initializeMat(((yystack.valueAt (1)).IDENT)); (yyval.Stmt) = new MatScalar(((yystack.valueAt (7)).IDENT), ((yystack.valueAt (1)).IDENT), ((yystack.valueAt (4)).Expr)); next = next.link((yyval.Stmt)); }
      break;

    case 37: /* Stmt: MAT IDENT ASSIGN ZER EOL  */
#line 84 "grammar.y"
                                   { symtab.initializeMat(((yystack.valueAt (3)).IDENT), true); (yyval.Stmt) = new MatZerConIdnDim(((yystack.valueAt (3)).IDENT), 0); next = next.link((yyval.Stmt)); }
      break;

    case 38: /* Stmt: MAT IDENT ASSIGN CON EOL  */
#line 85 "grammar.y"
                                   { symtab.initializeMat(((yystack.valueAt (3)).IDENT), true); (yyval.Stmt) = new MatZerConIdnDim(((yystack.valueAt (3)).IDENT), 1); next = next.link((yyval.Stmt)); }
      break;

    case 39: /* Stmt: MAT IDENT ASSIGN IDN EOL  */
#line 86 "grammar.y"
                                   { symtab.initializeMat(((yystack.valueAt (3)).IDENT), true); (yyval.Stmt) = new MatZerConIdnDim(((yystack.valueAt (3)).IDENT), 2); next = next.link((yyval.Stmt)); }
      break;

    case 40: /* Stmt: MAT INPUT IDENT EOL  */
#line 87 "grammar.y"
                              { symtab.initializeDim(((yystack.valueAt (1)).IDENT)); symtab.initializeId(symtab.installId("NUM")); (yyval.Stmt) = new MatInput(((yystack.valueAt (1)).IDENT)); next = next.link((yyval.Stmt)); }
      break;

    case 41: /* Stmt: RESTORE EOL  */
#line 88 "grammar.y"
                      { (yyval.Stmt) = new Restore(); next = next.link((yyval.Stmt)); }
      break;

    case 42: /* Stmt: INPUT InputSq EOL  */
#line 89 "grammar.y"
                            {}
      break;

    case 43: /* Lineno: LINENO  */
#line 92 "grammar.y"
                 { if (symtab.end) symtab.error("STATEMENT AFTER END"); (yyval.Lineno) = new Line(((yystack.valueAt (0)).LINENO)); }
      break;

    case 44: /* Print: %empty  */
#line 95 "grammar.y"
                 { (yyval.Print) = new NewLine(); }
      break;

    case 45: /* Print: PrintEn  */
#line 96 "grammar.y"
                  { (yyval.Print) = ((yystack.valueAt (0)).PrintEn); }
      break;

    case 46: /* Print: PrintSq PrintEn  */
#line 97 "grammar.y"
                          { (yyval.Print) = ((yystack.valueAt (1)).PrintSq); (yyval.Print).linkLast(((yystack.valueAt (0)).PrintEn)); }
      break;

    case 47: /* PrintSq: PrintSt  */
#line 100 "grammar.y"
                  { (yyval.PrintSq) = ((yystack.valueAt (0)).PrintSt); }
      break;

    case 48: /* PrintSq: PrintSq PrintSt  */
#line 101 "grammar.y"
                          { (yyval.PrintSq).linkLast(((yystack.valueAt (0)).PrintSt)); }
      break;

    case 49: /* PrintSt: STRING SEMICOLON  */
#line 104 "grammar.y"
                           { (yyval.PrintSt) = new String(((yystack.valueAt (1)).STRING)); }
      break;

    case 50: /* PrintSt: STRING COMMA  */
#line 105 "grammar.y"
                       { (yyval.PrintSt) = new String(((yystack.valueAt (1)).STRING)); (yyval.PrintSt).linkLast(new Comma()); }
      break;

    case 51: /* PrintSt: Expr PrintTa  */
#line 106 "grammar.y"
                       { (yyval.PrintSt) = new PrintExpr(((yystack.valueAt (1)).Expr)); (yyval.PrintSt).linkLast(((yystack.valueAt (0)).PrintTa)); }
      break;

    case 52: /* PrintSt: STRING Expr PrintTa  */
#line 107 "grammar.y"
                              { (yyval.PrintSt) = new String(((yystack.valueAt (2)).STRING)); (yyval.PrintSt).linkLast(new PrintExpr(((yystack.valueAt (1)).Expr))); (yyval.PrintSt).linkLast(((yystack.valueAt (0)).PrintTa)); }
      break;

    case 53: /* PrintEn: STRING  */
#line 110 "grammar.y"
                 { (yyval.PrintEn) = new String(((yystack.valueAt (0)).STRING)); (yyval.PrintEn).linkLast(new NewLine()); }
      break;

    case 54: /* PrintEn: Expr  */
#line 111 "grammar.y"
               { (yyval.PrintEn) = new PrintExpr(((yystack.valueAt (0)).Expr)); (yyval.PrintEn).linkLast(new NewLine()); }
      break;

    case 55: /* PrintEn: STRING Expr  */
#line 112 "grammar.y"
                      { (yyval.PrintEn) = new String(((yystack.valueAt (1)).STRING)); (yyval.PrintEn).linkLast(new PrintExpr(((yystack.valueAt (0)).Expr))); (yyval.PrintEn).linkLast(new NewLine()); }
      break;

    case 56: /* PrintEn: PrintSt  */
#line 113 "grammar.y"
                  { (yyval.PrintEn) = ((yystack.valueAt (0)).PrintSt); }
      break;

    case 57: /* PrintTa: COMMA  */
#line 116 "grammar.y"
                { (yyval.PrintTa) = new Comma(); }
      break;

    case 58: /* PrintTa: SEMICOLON  */
#line 117 "grammar.y"
                    { (yyval.PrintTa) = new SemiColon(); }
      break;

    case 59: /* DataSq: Data  */
#line 120 "grammar.y"
               {}
      break;

    case 60: /* DataSq: DataSq COMMA Data  */
#line 121 "grammar.y"
                            {}
      break;

    case 61: /* Data: INTEGER  */
#line 124 "grammar.y"
                  { symtab.installData(((yystack.valueAt (0)).INTEGER)); }
      break;

    case 62: /* Data: NUMBER  */
#line 125 "grammar.y"
                 { symtab.installData(((yystack.valueAt (0)).NUMBER)); }
      break;

    case 63: /* Data: MINUS INTEGER  */
#line 126 "grammar.y"
                        { symtab.installData(-((yystack.valueAt (0)).INTEGER)); }
      break;

    case 64: /* Data: MINUS NUMBER  */
#line 127 "grammar.y"
                       { symtab.installData(-((yystack.valueAt (0)).NUMBER)); }
      break;

    case 65: /* ReadSq: Read  */
#line 130 "grammar.y"
               {}
      break;

    case 66: /* ReadSq: ReadSq COMMA Read  */
#line 131 "grammar.y"
                            {}
      break;

    case 67: /* Read: IDENT  */
#line 134 "grammar.y"
                { (yyval.Read) = new Read(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Read)); }
      break;

    case 68: /* Read: IDENT LPAREN Expr RPAREN  */
#line 135 "grammar.y"
                                   { (yyval.Read) = new ReadDim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Read)); }
      break;

    case 69: /* Read: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 136 "grammar.y"
                                              { (yyval.Read) = new ReadDim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Read)); }
      break;

    case 70: /* DimSq: Dim  */
#line 139 "grammar.y"
              {}
      break;

    case 71: /* DimSq: DimSq COMMA Dim  */
#line 140 "grammar.y"
                          {}
      break;

    case 72: /* Dim: IDENT LPAREN INTEGER RPAREN  */
#line 143 "grammar.y"
                                      { symtab.initializeDim(((yystack.valueAt (3)).IDENT), true, cast(ushort)((yystack.valueAt (1)).INTEGER)); }
      break;

    case 73: /* Dim: IDENT LPAREN INTEGER COMMA INTEGER RPAREN  */
#line 144 "grammar.y"
                                                    { symtab.initializeDim2(((yystack.valueAt (5)).IDENT), true, cast(ushort)((yystack.valueAt (3)).INTEGER), cast(ushort)((yystack.valueAt (1)).INTEGER)); }
      break;

    case 74: /* IdSq: IDENT  */
#line 147 "grammar.y"
                { int[] i; (yyval.IdSq) = i; (yyval.IdSq) ~= ((yystack.valueAt (0)).IDENT); }
      break;

    case 75: /* IdSq: IdSq COMMA IDENT  */
#line 148 "grammar.y"
                           { (yyval.IdSq) ~= ((yystack.valueAt (0)).IDENT); }
      break;

    case 76: /* ExprSq: Expr  */
#line 151 "grammar.y"
               { Expr[] e; (yyval.ExprSq) = e; (yyval.ExprSq) ~= ((yystack.valueAt (0)).Expr); }
      break;

    case 77: /* ExprSq: ExprSq COMMA Expr  */
#line 152 "grammar.y"
                            { (yyval.ExprSq) ~= ((yystack.valueAt (0)).Expr); }
      break;

    case 78: /* MatPr: MatPrEn  */
#line 155 "grammar.y"
                  { (yyval.MatPr) = ((yystack.valueAt (0)).MatPrEn); }
      break;

    case 79: /* MatPr: MatPrSq MatPrEn  */
#line 156 "grammar.y"
                          { (yyval.MatPr) = ((yystack.valueAt (1)).MatPrSq); (yyval.MatPr).linkLast(((yystack.valueAt (0)).MatPrEn)); }
      break;

    case 80: /* MatPrSq: MatPrSt  */
#line 159 "grammar.y"
                  { (yyval.MatPrSq) = ((yystack.valueAt (0)).MatPrSt); }
      break;

    case 81: /* MatPrSq: MatPrSq MatPrSt  */
#line 160 "grammar.y"
                          { (yyval.MatPrSq).linkLast(((yystack.valueAt (0)).MatPrSt)); }
      break;

    case 82: /* MatPrSt: IDENT COMMA  */
#line 163 "grammar.y"
                      { symtab.initializeMat(((yystack.valueAt (1)).IDENT)); (yyval.MatPrSt) = new MatFullPrint(((yystack.valueAt (1)).IDENT)); }
      break;

    case 83: /* MatPrSt: IDENT SEMICOLON  */
#line 164 "grammar.y"
                          { symtab.initializeMat(((yystack.valueAt (1)).IDENT)); (yyval.MatPrSt) = new MatFullPrint(((yystack.valueAt (1)).IDENT), true); }
      break;

    case 84: /* MatPrEn: IDENT  */
#line 167 "grammar.y"
                { symtab.initializeMat(((yystack.valueAt (0)).IDENT)); (yyval.MatPrEn) = new MatFullPrint(((yystack.valueAt (0)).IDENT)); }
      break;

    case 85: /* MatPrEn: IDENT SEMICOLON  */
#line 168 "grammar.y"
                          { symtab.initializeMat(((yystack.valueAt (1)).IDENT)); (yyval.MatPrEn) = new MatFullPrint(((yystack.valueAt (1)).IDENT), true); }
      break;

    case 86: /* InputSq: Input  */
#line 171 "grammar.y"
                {}
      break;

    case 87: /* InputSq: InputSq COMMA Input  */
#line 172 "grammar.y"
                              {}
      break;

    case 88: /* Input: IDENT  */
#line 175 "grammar.y"
                { (yyval.Input) = new Input(((yystack.valueAt (0)).IDENT)); next = next.link((yyval.Input)); }
      break;

    case 89: /* Input: IDENT LPAREN Expr RPAREN  */
#line 176 "grammar.y"
                                   { (yyval.Input) = new InputDim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Input)); }
      break;

    case 90: /* Input: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 177 "grammar.y"
                                              { (yyval.Input) = new InputDim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); next = next.link((yyval.Input)); }
      break;

    case 91: /* Expr: NUMBER  */
#line 180 "grammar.y"
                 { (yyval.Expr) = new Constant(symtab.installConstant(((yystack.valueAt (0)).NUMBER))); }
      break;

    case 92: /* Expr: INTEGER  */
#line 181 "grammar.y"
                  { (yyval.Expr) = new Constant(symtab.installConstant(((yystack.valueAt (0)).INTEGER))); }
      break;

    case 93: /* Expr: IDENT  */
#line 182 "grammar.y"
                { (yyval.Expr) = new Identifier(((yystack.valueAt (0)).IDENT)); }
      break;

    case 94: /* Expr: MATHFN Expr RPAREN  */
#line 183 "grammar.y"
                             { (yyval.Expr) = new MathFn(((yystack.valueAt (2)).MATHFN), ((yystack.valueAt (1)).Expr)); }
      break;

    case 95: /* Expr: FNIDENT LPAREN ExprSq RPAREN  */
#line 184 "grammar.y"
                                       { (yyval.Expr) = new FnCall(((yystack.valueAt (3)).FNIDENT), ((yystack.valueAt (1)).ExprSq)); }
      break;

    case 96: /* Expr: FNIDENT  */
#line 185 "grammar.y"
                  { (yyval.Expr) = new FnCall(((yystack.valueAt (0)).FNIDENT), new Expr[0]); }
      break;

    case 97: /* Expr: IDENT LPAREN Expr RPAREN  */
#line 186 "grammar.y"
                                   { (yyval.Expr) = new Dim(((yystack.valueAt (3)).IDENT), ((yystack.valueAt (1)).Expr)); }
      break;

    case 98: /* Expr: IDENT LPAREN Expr COMMA Expr RPAREN  */
#line 187 "grammar.y"
                                              { (yyval.Expr) = new Dim2(((yystack.valueAt (5)).IDENT), ((yystack.valueAt (3)).Expr), ((yystack.valueAt (1)).Expr)); }
      break;

    case 99: /* Expr: Expr PLUS Expr  */
#line 188 "grammar.y"
                         { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Add, ((yystack.valueAt (0)).Expr)); }
      break;

    case 100: /* Expr: Expr MINUS Expr  */
#line 189 "grammar.y"
                          { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Sub, ((yystack.valueAt (0)).Expr)); }
      break;

    case 101: /* Expr: Expr TIMES Expr  */
#line 190 "grammar.y"
                          { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Mul, ((yystack.valueAt (0)).Expr)); }
      break;

    case 102: /* Expr: Expr DIVIDE Expr  */
#line 191 "grammar.y"
                           { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Div, ((yystack.valueAt (0)).Expr)); }
      break;

    case 103: /* Expr: Expr EXP Expr  */
#line 192 "grammar.y"
                        { (yyval.Expr) = new Operation(((yystack.valueAt (2)).Expr), Op.Exp, ((yystack.valueAt (0)).Expr)); }
      break;

    case 104: /* Expr: MINUS Expr  */
#line 193 "grammar.y"
                                  { (yyval.Expr) = new Operation(((yystack.valueAt (0)).Expr), Op.Neg); }
      break;

    case 105: /* Expr: LPAREN Expr RPAREN  */
#line 194 "grammar.y"
                             { (yyval.Expr) = ((yystack.valueAt (1)).Expr); }
      break;

    case 106: /* Expr: DET  */
#line 195 "grammar.y"
              { (yyval.Expr) = new Identifier(symtab.installId("DET")); }
      break;

    case 107: /* Expr: NUM  */
#line 196 "grammar.y"
              { (yyval.Expr) = new Identifier(symtab.installId("NUM")); }
      break;


#line 999 "Parser.d"

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
  private static immutable short yytable_ninf_ = -86;

    /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
private static immutable short[] yypact_ =
[
     -44,   218,   -44,   -44,    -4,    38,    -1,    61,    28,    87,
      68,    82,    43,    69,   109,    73,    72,   123,    77,    -2,
      88,   140,   -44,   -44,     0,    99,    -8,   -44,   -44,   -44,
      56,    86,   -44,   104,     7,   -44,   -44,    87,   107,   -44,
     -44,    87,    87,   128,    61,   138,   -44,   278,   153,    -6,
     148,   144,   -44,   -44,     1,   147,   -44,   142,   111,   -44,
     -44,   161,   197,   198,   205,   -44,   158,   122,   -44,    87,
      87,    87,    38,   -44,   -44,   -44,    -1,   -44,    87,   -44,
     -44,   278,   200,    87,   206,   152,   -44,   138,   -44,   -44,
     -44,    87,    87,    87,    87,    87,   -44,   163,    87,    87,
      87,   -44,    87,   221,   -44,   210,   123,   -44,     2,   181,
     -31,   199,   198,   -44,   -44,   201,    87,   140,   -44,   296,
     108,   120,   -44,   -44,   136,   -44,   -44,    63,    20,   -44,
      51,    51,   152,   152,   152,   -44,    45,    58,    74,   304,
     -44,    89,   137,   -44,   -27,   -43,   -42,    75,   202,   203,
      87,    87,   -44,   214,   -44,   -44,   -44,   -44,   150,   -44,
     -44,   215,    87,   -44,    87,   -44,    87,   -44,    87,   245,
     267,    87,   -44,   235,   271,   -44,   270,   274,   315,   321,
      87,   -44,    87,   -44,    87,   -44,   325,   326,   212,   166,
     -44,    87,    87,   224,   230,   236,    20,   280,   281,    91,
      87,   -44,   292,   289,   290,   291,   -35,   288,   242,   302,
     303,   300,   307,    87,   248,   312,   327,   -44,   -44,   -44,
     -44,    87,   -44,   320,   -44,   -44,   -44,   -44,    87,    87,
     314,   322,   323,   377,   -44,   254,   -44,   -44,    87,   328,
     -44,   260,   266,   -44,   -44,   -44,   331,   338,   336,   -44,
     339,   344,   -44,   -44,   -44,   -44,   -44
];

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
private static immutable byte[] yydefact_ =
[
       2,     0,     1,    43,     0,     0,     0,    44,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     4,     0,    67,     0,    65,    61,    62,
       0,     0,    59,    93,    53,    92,    91,     0,    96,   106,
     107,     0,     0,     0,     0,    47,    45,    54,     0,     0,
       0,     0,    24,     5,     0,     0,    22,     0,     0,    70,
      23,     0,     0,     0,     0,    41,    88,     0,    86,     0,
       0,     0,     0,    18,    63,    64,     0,    17,     0,    50,
      49,    55,     0,     0,     0,   104,     6,    48,    46,    57,
      58,     0,     0,     0,     0,     0,    51,     0,     0,     0,
       0,    16,     0,     0,     8,     0,     0,    19,     0,     0,
      84,     0,     0,    80,    78,     0,     0,     0,    42,     0,
       0,     0,    66,    60,     0,    52,    94,     0,    76,   105,
      99,   100,   101,   102,   103,     7,     0,     0,     0,     0,
      74,     0,     0,    71,     0,     0,     0,     0,     0,     0,
       0,     0,    82,    83,    27,    81,    79,    40,     0,    87,
       9,     0,     0,    68,     0,    97,     0,    95,     0,     0,
       0,     0,    21,     0,     0,    72,     0,     0,     0,     0,
       0,    37,     0,    38,     0,    39,     0,     0,     0,     0,
      89,     0,     0,     0,     0,     0,    77,     0,     0,     0,
       0,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    69,    98,    12,
      13,     0,    15,     0,    73,    28,    29,    30,     0,     0,
       0,     0,     0,     0,    26,     0,    90,    10,     0,     0,
      20,     0,     0,    33,    34,    35,     0,     0,     0,    14,
       0,     0,    36,    25,    11,    31,    32
];

  /* YYPGOTO[NTERM-NUM].  */
private static immutable short[] yypgoto_ =
[
     -44,   -44,   -44,   -44,   -44,   -44,   354,   355,   319,   -44,
     329,   -44,   330,   -44,   295,   -44,   -44,   -44,   -44,   294,
     297,   -44,   286,    -9
];

  /* YYDEFGOTO[NTERM-NUM].  */
private static immutable short[] yydefgoto_ =
[
       0,     1,    22,    23,    43,    44,    45,    46,    96,    31,
      32,    26,    27,    58,    59,   141,   127,   111,   112,   113,
     114,    67,    68,    47
];

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
private static immutable short[] yytable_ =
[
      49,    24,    98,    61,   180,   182,    28,   144,    29,   181,
     183,    62,    33,    63,    35,   228,    36,    37,    38,   152,
     153,    91,    92,    93,    94,    81,    95,    64,    82,   177,
     178,   179,    84,    85,    99,   145,   146,   147,   148,   149,
      69,   102,    72,    25,    73,    39,    40,    70,   103,   150,
      91,    92,    93,    94,    41,    95,    30,    79,    80,    48,
     119,   120,   121,    74,    42,    75,    33,    34,    35,   124,
      36,    37,    38,    50,   128,   169,    91,    92,    93,    94,
      55,    95,   130,   131,   132,   133,   134,    51,   170,   136,
     137,   138,    33,   139,    35,    52,    36,    37,    38,    39,
      40,    91,    92,    93,    94,   171,    95,   158,    41,    93,
      94,   167,    95,   168,    91,    92,    93,    94,    42,    95,
      54,    53,   184,   221,    56,    39,    40,   185,    57,    60,
      91,    92,    93,    94,    41,    95,    76,   173,    77,   174,
      65,   188,   189,   222,    42,    66,    71,    91,    92,    93,
      94,    78,    95,   193,    83,   194,   161,   195,   162,   196,
      97,   106,   199,   107,    91,    92,    93,    94,   163,    95,
     164,   206,   117,   207,   118,   208,    91,    92,    93,    94,
      86,    95,   214,   215,   165,   175,   166,   176,   100,   105,
     -56,   223,    91,    92,    93,    94,   101,    95,   190,   104,
     191,   108,   109,   110,   235,   116,    91,    92,    93,    94,
     115,    95,   239,    95,   212,   135,   213,   142,     2,   241,
     242,     3,    91,    92,    93,    94,   140,    95,   151,   248,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,   126,   186,
     187,   154,   197,   157,   129,   192,    91,    92,    93,    94,
     211,    95,    91,    92,    93,    94,   -85,    95,    91,    92,
      93,    94,   216,    95,   198,   200,   201,   202,   217,   203,
      91,    92,    93,    94,   218,    95,    91,    92,    93,    94,
     230,    95,    91,    92,    93,    94,   236,    95,    91,    92,
      93,    94,   247,    95,    91,    92,    93,    94,   250,    95,
      91,    92,    93,    94,   251,    95,    91,    92,    93,    94,
     204,    95,    91,    92,    93,    94,   205,    95,    89,    90,
     209,   210,   219,   220,    91,    92,    93,    94,   229,    95,
     224,   225,   226,   227,    91,    92,    93,    94,   160,    95,
     231,   232,    91,    92,    93,    94,   172,    95,   233,   234,
      91,    92,    93,    94,   237,    95,   243,   238,    91,    92,
      93,    94,   240,    95,   244,   245,    91,    92,    93,    94,
     249,    95,   246,   252,    91,    92,    93,    94,   254,    95,
     253,   255,    91,    92,    93,    94,   256,    95,    87,    88,
     125,   143,   122,   159,     0,   123,   155,     0,     0,   156
];

private static immutable short[] yycheck_ =
[
       9,     5,     8,     5,    47,    47,     7,     5,     9,    52,
      52,    13,     5,    15,     7,    50,     9,    10,    11,    50,
      51,    56,    57,    58,    59,    34,    61,    29,    37,    56,
      57,    58,    41,    42,    40,    33,    34,    35,    36,    37,
      40,    40,    50,     5,    52,    38,    39,    47,    47,    47,
      56,    57,    58,    59,    47,    61,    57,    50,    51,    31,
      69,    70,    71,     7,    57,     9,     5,     6,     7,    78,
       9,    10,    11,     5,    83,    30,    56,    57,    58,    59,
       7,    61,    91,    92,    93,    94,    95,     5,    30,    98,
      99,   100,     5,   102,     7,    52,     9,    10,    11,    38,
      39,    56,    57,    58,    59,    31,    61,   116,    47,    58,
      59,    48,    61,    50,    56,    57,    58,    59,    57,    61,
      11,    52,    47,    32,    52,    38,    39,    52,     5,    52,
      56,    57,    58,    59,    47,    61,    50,    48,    52,    50,
      52,   150,   151,    52,    57,     5,    47,    56,    57,    58,
      59,    47,    61,   162,    47,   164,    48,   166,    50,   168,
       7,    50,   171,    52,    56,    57,    58,    59,    48,    61,
      50,   180,    50,   182,    52,   184,    56,    57,    58,    59,
      52,    61,   191,   192,    48,    48,    50,    50,    40,    47,
      52,   200,    56,    57,    58,    59,    52,    61,    48,    52,
      50,    40,     5,     5,   213,    47,    56,    57,    58,    59,
       5,    61,   221,    61,    48,    52,    50,     7,     0,   228,
     229,     3,    56,    57,    58,    59,     5,    61,    47,   238,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    48,    47,
      47,    52,     7,    52,    48,    40,    56,    57,    58,    59,
      48,    61,    56,    57,    58,    59,    52,    61,    56,    57,
      58,    59,    48,    61,     7,    40,     5,     7,    48,     5,
      56,    57,    58,    59,    48,    61,    56,    57,    58,    59,
      48,    61,    56,    57,    58,    59,    48,    61,    56,    57,
      58,    59,    48,    61,    56,    57,    58,    59,    48,    61,
      56,    57,    58,    59,    48,    61,    56,    57,    58,    59,
       5,    61,    56,    57,    58,    59,     5,    61,    50,    51,
       5,     5,    52,    52,    56,    57,    58,    59,    50,    61,
      48,    52,    52,    52,    56,    57,    58,    59,    52,    61,
      48,    48,    56,    57,    58,    59,    52,    61,    58,    52,
      56,    57,    58,    59,    52,    61,    52,    40,    56,    57,
      58,    59,    52,    61,    52,    52,    56,    57,    58,    59,
      52,    61,     5,    52,    56,    57,    58,    59,    52,    61,
      52,    52,    56,    57,    58,    59,    52,    61,    44,    44,
      81,   106,    72,   117,    -1,    76,   112,    -1,    -1,   112
];

  /* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
     state STATE-NUM.  */
private static immutable byte[] yystos_ =
[
       0,    63,     0,     3,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    64,    65,     5,     5,    73,    74,     7,     9,
      57,    71,    72,     5,     6,     7,     9,    10,    11,    38,
      39,    47,    57,    66,    67,    68,    69,    85,    31,    85,
       5,     5,    52,    52,    11,     7,    52,     5,    75,    76,
      52,     5,    13,    15,    29,    52,     5,    83,    84,    40,
      47,    47,    50,    52,     7,     9,    50,    52,    47,    50,
      51,    85,    85,    47,    85,    85,    52,    68,    69,    50,
      51,    56,    57,    58,    59,    61,    70,     7,     8,    40,
      40,    52,    40,    47,    52,    47,    50,    52,    40,     5,
       5,    79,    80,    81,    82,     5,    47,    50,    52,    85,
      85,    85,    74,    72,    85,    70,    48,    78,    85,    48,
      85,    85,    85,    85,    85,    52,    85,    85,    85,    85,
       5,    77,     7,    76,     5,    33,    34,    35,    36,    37,
      47,    47,    50,    51,    52,    81,    82,    52,    85,    84,
      52,    48,    50,    48,    50,    48,    50,    48,    50,    30,
      30,    31,    52,    48,    50,    48,    50,    56,    57,    58,
      47,    52,    47,    52,    47,    52,    47,    47,    85,    85,
      48,    50,    40,    85,    85,    85,    85,     7,     7,    85,
      40,     5,     7,     5,     5,     5,    85,    85,    85,     5,
       5,    48,    48,    50,    85,    85,    48,    48,    48,    52,
      52,    32,    52,    85,    48,    52,    52,    52,    50,    50,
      48,    48,    48,    58,    52,    85,    48,    52,    40,    85,
      52,    85,    85,    52,    52,    52,     5,    48,    85,    52,
      48,    48,    52,    52,    52,    52,    52
];

  /* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
private static immutable byte[] yyr1_ =
[
       0,    62,    63,    63,    64,    64,    64,    64,    64,    64,
      64,    64,    64,    64,    64,    64,    64,    64,    64,    64,
      64,    64,    64,    64,    64,    64,    64,    64,    64,    64,
      64,    64,    64,    64,    64,    64,    64,    64,    64,    64,
      64,    64,    64,    65,    66,    66,    66,    67,    67,    68,
      68,    68,    68,    69,    69,    69,    69,    70,    70,    71,
      71,    72,    72,    72,    72,    73,    73,    74,    74,    74,
      75,    75,    76,    76,    77,    77,    78,    78,    79,    79,
      80,    80,    81,    81,    82,    82,    83,    83,    84,    84,
      84,    85,    85,    85,    85,    85,    85,    85,    85,    85,
      85,    85,    85,    85,    85,    85,    85,    85
];

  /* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
private static immutable byte[] yyr2_ =
[
       0,     2,     0,     2,     1,     2,     3,     4,     3,     5,
       8,    10,     7,     7,     9,     7,     3,     3,     3,     3,
       8,     5,     2,     2,     2,     9,     7,     4,     7,     7,
       7,    10,    10,     8,     8,     8,     9,     5,     5,     5,
       4,     2,     3,     1,     0,     1,     2,     1,     2,     2,
       2,     2,     3,     1,     1,     2,     1,     1,     1,     1,
       3,     1,     1,     2,     2,     1,     3,     1,     4,     6,
       1,     3,     4,     6,     1,     3,     1,     3,     1,     2,
       1,     2,     2,     2,     1,     2,     1,     3,     1,     4,
       6,     1,     1,     1,     3,     4,     1,     4,     6,     3,
       3,     3,     3,     3,     2,     3,     1,     1
];




  private static auto yytranslate_ (int t)
  {
    return SymbolKind(t);
  }

  private static immutable int yylast_ = 409;
  private static immutable int yynnts_ = 24;
  private static immutable int yyfinal_ = 2;
  private static immutable int yyntokens_ = 62;

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
#line 33 "grammar.y"

    import Node : Node, Line, Stop, Goto, GoSub, Return, Let, LetDim, LetDim2, Read, ReadDim, ReadDim2, Input, InputDim, InputDim2, If, For, Next, Restore;
    import Expr : Expr, Op, Constant, Identifier, Dim, Dim2, Operation, MathFn, FnCall;
    import LexerImpl : LexerImpl;
    import SymbolTable : SymbolTable, Edition;
    import Print : Print, NewLine, Comma, SemiColon, String, PrintExpr;
    import Mat : MatRead, MatPrint, MatFullPrint, MatAdd, MatSub, MatMul, MatZerCon, MatIdn, MatTrn, MatInv, MatScalar, MatZerConIdnDim, MatInput;

#line 1690 "Parser.d"

}

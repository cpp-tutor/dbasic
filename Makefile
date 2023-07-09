# Makefile for Dartmouth BASIC Compiler implementation (Editions First to Sixth)

BASE = dbasic
DMD = gdc
DMDFLAGS = -Wall --release -O
BISON = bison
OBJS = Parser.o LexerImpl.o SymbolTable.o Node.o Expr.o Print.o Mat.o Driver.o
AUTOGEN = Parser.d

all: $(BASE)

$(AUTOGEN): grammar.y
	$(BISON) grammar.y

%.o: %.d
	$(DMD) $(DMDFLAGS) -c $<

$(BASE): $(AUTOGEN) $(OBJS)
	$(DMD) $(DMDFLAGS) -o $(BASE) $(OBJS)

run: all
	./$(BASE)

clean:
	rm -f $(BASE) $(OBJS) $(AUTOGEN)

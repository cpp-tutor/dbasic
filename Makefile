# Makefile for Dartmouth BASIC Compiler implementation (Editions First to Sixth)

BASE = dbasic
DMD = gdc
DMDFLAGS = --release -O
BISON = bison
OBJS = Parser.o LexerImpl.o Driver.o Node.o Printable.o Expr.o SymbolTable.o
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

# Makefile for Dartmouth BASIC Compiler implementation (Editions First to Sixth)

BASE = dbasic
DMD = gdc
BISON = bison
OBJS = Parser.o LexerImpl.o Driver.o Node.o Printable.o Expr.o SymbolTable.o
AUTOGEN = Parser.d

all: $(BASE)

$(AUTOGEN): grammar.y
	bison grammar.y

%.o: %.d
	$(DMD) -c $<

$(BASE): $(AUTOGEN) $(OBJS)
	$(DMD) -o $(BASE) $(OBJS)

run: all
	./$(BASE)

clean:
	rm -f $(BASE) $(OBJS) $(AUTOGEN)

LEX = flex
YACC = bison
CC = gcc

all: cgpa.exe

cgpa.exe: lex.yy.c parser.tab.c
	$(CC) lex.yy.c parser.tab.c -o cgpa.exe

lex.yy.c: lexer.l parser.tab.h
	$(LEX) lexer.l

parser.tab.c parser.tab.h: parser.y
	$(YACC) -d parser.y

clean:
	del lex.yy.c parser.tab.c parser.tab.h cgpa.exe

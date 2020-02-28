CC=gcc
CFLAGS=
LexerFile=project1a

project1A: lex.yy.c
	$(CC) $(CCFLAGS) -o project1A lex.yy.c

lex.yy.c: $(LexerFile).l
	flex $(LexerFile).l
CC=gcc
CFLAGS=
BaseFileName=project2a
FlexFlags=
BisonFlags= -d

project2a:  $(BaseFileName).tab.c lex.yy.c
	$(CC) $(CCFLAGS) -o prog  $(BaseFileName).tab.c lex.yy.c

$(BaseFileName).tab.c: $(BaseFileName).y
	bison $(BisonFlags) $(BaseFileName).y

lex.yy.c: $(BaseFileName).l
	flex $(FlexFlags) $(BaseFileName).l


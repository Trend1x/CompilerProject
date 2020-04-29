%{

    #include <stdio.h>
    #include <stdlib.h>
    #include "project2a.tab.h"
    char *token;

%}
white       ([\n|\t|' '])
num          ([1-9][0-9]*|0)
boollit     (true|false)
ident       ([A-Z][A-Z0-9]*)
lp          "("
rp          ")"
assg        ":="
sc          ";"
op2         ("*"|"div"|"mod")
op3         ("+"|"-")
op4         ("="|"!="|"<="|">="|"<"|">")
if          ("if")
then        ("then")
else        ("else")
begin       ("begin")
end         ("end")
while       ("while")
do          ("do")
program     ("program")
var         ("var")
as          ("as")
int         ("int")
bool        ("bool")
writeint    ("writeInt")
readint     ("readInt")
comment     (%.*\n)


%%
{white}     {/*White Space ignored*/}
{comment}   {/*Comments ignored*/}

{num}       {//printf("NUM\t\t%s\n", yytext);
                yylval.numVal = atoi(yytext);
                return NUM;
            }

{boollit}   {//printf("BOOLLIT\t\t%s\n", yytext);
                yylval.boolLitVal = yytext;
                return BOOLLIT;
            }

{ident}     {//printf("IDENT\t\t%s\n", yytext);
                yylval.identVal = yytext;
                return IDENT;
            }

{lp}        {//printf("LP\n");
                return LP;}

{rp}        {//printf("RP\n");
                return RP;
            }

{assg}      {//printf("ASGN\n");
                return ASGN;
            }

{sc}        {//printf("SC\n");
                    return SC;
            }

{op2}       {//printf("OP2\t\t%s\n", yytext);
                yylval.op2Val = yytext;
                return OP2;
            }

{op3}       {//printf("OP3\t\t%s\n", yytext);
                yylval.op3Val = yytext;
                return OP3;
            }

{op4}       {//printf("OP4\t\t%s\n", yytext);
                yylval.op4Val = yytext;
                return OP4;
            }

{if}        {//printf("IF\n");
                return IF;
            }

{then}      {//printf("THEN\n");
                return THEN;
            }

{else}      {//printf("ELSE\n");
                return ELSE;
            }

{begin}     {//printf("BEGIN\n");
                return BEGIN_;
            }

{end}       {//printf("END\n");
                return END;
            }

{while}     {//printf("WHILE\n");
                return WHILE;
            }

{do}        {//printf("DO\n");
                return DO;
            }

{program}   {//printf("PROGRAM\n");
                return PROGRAM;
            }

{var}       {//printf("VAR\n");
                return VAR;
            }

{as}        {//printf("AS\n");
                return AS;
            }

{int}       {//printf("INT\n");
                return INT;
            }

{bool}      {//printf("BOOL\n");
                return BOOL;
            }

{writeint}  {//printf("WRITEINT\n");
                return WRITEINT;
            }

{readint}   {//printf("READINT\n");
                return READINT;
            }

%%

int yywrap(){
    return 1;
} 

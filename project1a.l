%{

    #include <stdio.h>
    #include <stdlib.h>
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

{num}       {printf("NUM\t\t%s\n", yytext);}

{boollit}   {printf("BOOLLIT\t\t%s\n", yytext);}

{ident}     {printf("IDENT\t\t%s\n", yytext);}

{lp}        {printf("LP\n");}

{rp}        {printf("RP\n");}

{assg}      {printf("ASGN\n");}

{sc}        {printf("SC\n");}

{op2}       {printf("OP2\t\t%s\n", yytext);}

{op3}       {printf("OP3\t\t%s\n", yytext); }

{op4}       {printf("OP4\t\t%s\n", yytext);}

{if}        {printf("IF\n");}

{then}      {printf("THEN\n");}

{else}      {printf("ELSE\n"); }

{begin}     {printf("BEGIN\n");}

{end}       {printf("END\n");}

{while}     {printf("WHILE\n");}

{do}        {printf("DO\n");}

{program}   {printf("PROGRAM\n");}

{var}       {printf("VAR\n");}

{as}        {printf("AS\n");}

{int}       {printf("INT\n");}

{bool}      {printf("BOOL\n");}

{writeint}  {printf("WRITEINT\n");}

{readint}   {printf("READINT\n");}

%%

int yywrap(){
    return 1;
} 


int main(int argc, char **argv){

    char *ret;
    if( argc == 2){
        yyin = fopen(argv[1], "r");
    }
    else {
        printf("No input file provided.\n");
        return 0;
    }
    
    yylex();
    
    fclose(yyin);
    printf("\n");
    return 0;
}

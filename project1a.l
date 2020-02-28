%{

    #include <stdio.h>
    #include <stdlib.h>


%}
white   ([\n|\t|' '])
num     ([1-9][0-9]*|0)
boollit (true|false)
lp      "("
rp      ")"
assg    ":="
sc      ";"
op2     ("*"|"div"|"mod")
op3     ("+"|"-")
op4     ("="|"!="|"<="|">="|"<"|">")


%%
{white} {/*White Space ignored*/}
{num}   printf("Found a number!\n");
{lp}    printf("Left Paren\n");
{rp}    printf("Right Paren\n");
{assg}  printf("Assignment\n");
{sc}    printf("Semi-Colon\n");
{op2}   printf("Operator 2\n");
{op3}   printf("Operator 3\n");
{op4}   printf("Operator 4\n");

%%

int yywrap(){} 

int main(int argc, char **argv){

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
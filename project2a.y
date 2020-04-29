%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "compilerProject.h"

    extern int yylex();
    extern int yyparse();
    extern FILE *yyin;


    void yyerror(char *s);
%}

%union {
int numVal;
char *boolLitVal;
char *identVal;
char *op2Val;
char *op3Val;
char *op4Val;
};

%token <numVal> NUM
%token <boolLitVal> BOOLLIT
%token <identVal> IDENT
%token LP RP ASGN SC
%token <op2Val> OP2
%token <op3Val> OP3
%token <op4Val> OP4
%token IF THEN ELSE BEGIN_ END WHILE DO PROGRAM VAR AS INT BOOL
%token WRITEINT READINT


%%
prog:
|program
;

program:
PROGRAM declarations BEGIN_ stmt_sequence END
;

declarations:
|VAR IDENT AS type SC declarations
;

type:
INT
|BOOL
;

stmt_sequence:
|stmt SC stmt_sequence
;

stmt:
assignment
|if_stmt
|while_stmt
|writeint
;

assignment:
IDENT ASGN expr
|IDENT ASGN READINT
;

if_stmt:
IF expr THEN stmt_sequence else_clause END
;

else_clause:
|ELSE stmt_sequence
;

while_stmt:
WHILE expr DO stmt_sequence END
;

writeint:
WRITEINT expr
;

expr:
simple_expr
|simple_expr OP4 simple_expr
;

simple_expr:
term OP3 term
|term
;

term:
factor OP2 factor
|factor
;

factor:
IDENT
|NUM
|BOOLLIT
|LP expr RP
;

%%




void yyerror(char *s) {
    fprintf(stdout, "%s\n", s);
    exit(2);
}

int main(int argc, char **argv){

    char *ret;
    if( argc == 2){
        FILE *inputFile = fopen(argv[1], "r");
        if(!inputFile){
            printf("File %s couldn't be opened.\n", argv[1]);
            return 1;
        }

        yyin = inputFile;
        yyparse();
        fclose(inputFile);
        printf("SUCCESS!\n");
        return 0;
    }
    else {
        printf("No input file provided.\n");
        return 1;
    }

    return 0;
}
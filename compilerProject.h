#include <stdbool.h>

typedef struct declarationStruct{
    struct declarationStruct *declaration;
    int numValue;       // number value
    bool boolValue;     // boolean literal value
}declarationType;

typedef struct stmtSequenceStruct{
    struct assignmentType *assignment;
    struct ifStmtType *ifStmt;
    struct whileStmtType *whileStmt;
    struct expressionType *writeInt; //write int only contains an expression
}stmtSequenceType;

typedef struct assignmentStruct{
    char *identValue;   // name of idendifier
    struct expressionType *expr;
}assignmentType;

typedef struct ifStmtStruct {
    struct expressionType *expr;
    struct stmtSequenceType *stmtSequence;
    struct stmtSequenceType *elseClause; // else clause only contains a statement sequence
}ifStmtType;

typedef struct whileStmtStruct{
    struct expressionType *expr;
    struct simpleExpressionType *simpleExpr;
}whileStmtType;

typedef struct expressionStruct{
    struct simpleExpressionType *simpleExpr;
    struct simpleExpressionType *simpleExpr2;
    int operator;           // op4 value
}expressionType;

typedef struct simpleExpressionStruct{
    struct termType *term;
    struct termType *term2;
    int operator;           // op3 value
}simpleExpressionType;

typedef struct termStruct{
    struct factorType *factor;
    struct factorType *factor2;
    int operator;                   //operator value (op2 type)
}termType;

typedef struct factorStruct{
    char *identValue;   // name of idendifier
    int numValue;       // number value
    bool boolValue;     // boolean literal value
    struct expressionType *expr; //LP <expression> RP - only need to save the expression.
}factorType;

factorType *factor(char *ident, int number, bool boolean, expressionType *expr)
{
    factorType *p;

    if((p = malloc(sizeof(factorType))) == NULL){
        yyerror("memory failure");
    }
    if(ident != NULL){
        p->identValue = ident;
    }
    else if (number != NULL){
        p->numValue = number;
    }
    else if (boolean != NULL){
        p->boolValue = boolean;
    }
    else if  (expr != NULL){
        p->expr = expr;
    }
    
}
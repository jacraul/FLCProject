%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
%}

%union {
    double dval;
}

%token <dval> T_FLOAT
%token T_PLUS T_MINUS T_MUL T_DIV T_NEWLINE T_FACTORIAL T_SIN T_COS T_SQRT T_FABS T_SINH T_COSH
%left T_PLUS T_MINUS
%left T_MUL T_DIV
%right T_FACTORIAL

%type <dval> expression

%start calculation

%%

calculation:
    | calculation line
;

line:
    T_NEWLINE
    | expression T_NEWLINE { printf("\tResult: %f\n", $1); }
;

expression:
    T_FLOAT { $$ = $1; }
    | expression T_PLUS expression { $$ = $1 + $3; }
    | expression T_MINUS expression { $$ = $1 - $3; }
    | expression T_MUL expression { $$ = $1 * $3; }
    | expression T_DIV expression { $$ = $3 == 0 ? (yyerror("division by zero"), 0) : $1 / $3; }
    | expression T_FACTORIAL { $$ = tgamma($1 + 1); }
    | T_SIN '(' expression ')' { $$ = sin($3); }
    | T_COS '(' expression ')' { $$ = cos($3); }
    | T_SQRT '(' expression ')' { $$ = sqrt($3); }
    | T_FABS '(' expression ')' { $$ = fabs($3); }
    | T_SINH '(' expression ')' { $$ = sinh($3); }
    | T_COSH '(' expression ')' { $$ = cosh($3); }
;

%%

int main() {
    yyin = stdin;

    do {
        yyparse();
    } while (!feof(yyin));

    return 0;
}

void yyerror(const char* s) {
    fprintf(stderr, "Parse error: %s\n", s);
    exit(1);
}

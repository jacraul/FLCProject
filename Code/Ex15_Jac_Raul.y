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
    float fval;
}

%token <fval> T_FLOAT
%token T_PLUS T_MINUS T_MUL T_DIV T_NEWLINE
%left T_PLUS T_MINUS
%left T_MUL T_DIV

%type <fval> expression

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

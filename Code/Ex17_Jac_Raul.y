%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}

%union {
    int intval;
}

%token <intval> NUMBER
%token ADD SUB MUL DIV

%precedence ADD, SUB
%precedence MUL, DIV

%%
input:
    | input line
    ;

line:
    '\n'
    | expr '\n' { printf("Result: %d\n", $1); }
    ;

expr:
    NUMBER           { $$ = $1; }
    | expr ADD expr  { $$ = $1 + $3; }
    | expr SUB expr  { $$ = $1 - $3; }
    | expr MUL expr  { $$ = $1 * $3; }
    | expr DIV expr  { if ($3 == 0) { yyerror("division by zero"); } else { $$ = $1 / $3; } }
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter a binary expression: ");
    yyparse();
    return 0;
}

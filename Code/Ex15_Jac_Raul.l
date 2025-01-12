%option noyywrap

%{
#include "Ex15_Jac_Raul.tab.h"
%}

%%

[0-9]+(\.[0-9]+)?    { yylval.fval = atof(yytext); return T_FLOAT; }
"+"                  { return T_PLUS; }
"-"                  { return T_MINUS; }
"*"                  { return T_MUL; }
"/"                  { return T_DIV; }
[ \t]                { /* Ignore whitespace */ }
\n                   { return T_NEWLINE; }
.                    { return yytext[0]; }

%%

int yywrap() {
    return 1;
}


%%


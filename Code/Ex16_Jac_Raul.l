%{
#include "Ex16_Jac_Raul.tab.h"
%}

%%

[0-9]+(\.[0-9]+)?    { yylval.dval = atof(yytext); return T_FLOAT; }
"+"                  { return T_PLUS; }
"-"                  { return T_MINUS; }
"*"                  { return T_MUL; }
"/"                  { return T_DIV; }
"!"                  { return T_FACTORIAL; }
"sin"                { return T_SIN; }
"cos"                { return T_COS; }
"sqrt"               { return T_SQRT; }
"fabs"               { return T_FABS; }
"sinh"               { return T_SINH; }
"cosh"               { return T_COSH; }
"("                  { return '('; }
")"                  { return ')'; }
[ \t]                { /* Ignore whitespace */ }
\n                   { return T_NEWLINE; }
.                    { return yytext[0]; }

%%

int yywrap() {
    return 1;
}

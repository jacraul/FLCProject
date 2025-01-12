%{
#include "Ex17_Jac_Raul.tab.h"
%}

%%
[01]+             { yylval.intval = strtol(yytext, NULL, 2); return NUMBER; }
"+"               { return ADD; }
"-"               { return SUB; }
"*"               { return MUL; }
"/"               { return DIV; }
[ \t\n]+          { /* Ignore whitespace */ }
.                 { return yytext[0]; }
%%

int yywrap() {
    return 1;
}

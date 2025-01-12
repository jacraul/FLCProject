%{
#include <stdio.h>
#include <stdlib.h>
%}

DIGIT   [0-9]
NUM     {DIGIT}+(\.{DIGIT}+)?

%%
"+"                 { printf("Add: %f\n", atof(yytext)); }
"-"                 { printf("Subtract: %f\n", atof(yytext)); }
"*"                 { printf("Multiply: %f\n", atof(yytext)); }
"/"                 { printf("Divide: %f\n", atof(yytext)); }
{NUM}               { printf("Number: %f\n", atof(yytext)); }
[ \t\n]+            { /* Ignore whitespace */ }
.                   { printf("Invalid character: %c\n", yytext[0]); }
%%

int main(void)
{
    printf("Enter an expression: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;  // Required by flex, indicates end of input
}

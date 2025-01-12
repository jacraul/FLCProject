%{
#include <stdio.h>
#include <ctype.h>
%}

%%
[0-9]+              printf("Number\n");
[A-Za-z]+           printf("Word\n");
.|\n                printf("Other\n");
%%

int main(void)
{
    printf("Enter a string: ");
    yylex();  // Start the lexer to read from stdin
    return 0;
}

int yywrap() {
    return 1;  // Required by flex, indicates end of input
}

%{
#include <stdio.h>
%}

%%
[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}   printf("Email address\n");
.|\n                                              printf("Not an email address\n");
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

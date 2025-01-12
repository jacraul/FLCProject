%{
#include <stdio.h>
int count = 0;  // Initialize counter
%}

%%
[A-Z][a-zA-Z]*  { count++; }  // Match words starting with a capital letter
[a-zA-Z]+       ;  // Match other words but do nothing
[ \t\n]+        ;  // Ignore whitespace
.               ;  // Ignore other characters
%%

int main(void)
{
    printf("Enter a text: ");
    yylex();  // Start the lexer to read from stdin
    printf("Number of words starting with a capital letter: %d\n", count);
    return 0;
}

int yywrap() {
    return 1;  // Required by flex, indicates end of input
}

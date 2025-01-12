%{
#include <stdio.h>
int capital_letters = 0;
int whitespaces = 0;
int newlines = 0;
int tabs = 0;
%}

%%
[A-Z]           { capital_letters++; }
[ \t\n]         { whitespaces++; if (yytext[0] == '\n') newlines++; if (yytext[0] == '\t') tabs++; }
.               ;  // Ignore other characters
%%

int main(int argc, char **argv)
{
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("Failed to open file");
            return 1;
        }
    } else {
        printf("Please provide a file as an argument.\n");
        return 1;
    }

    yylex();  // Start the lexer to process the file

    printf("Capital letters: %d\n", capital_letters);
    printf("Whitespaces: %d\n", whitespaces);
    printf("Newlines: %d\n", newlines);
    printf("Tabs: %d\n", tabs);

    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;  // Required by flex, indicates end of input
}

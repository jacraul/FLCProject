%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>

int pronoun_count = 0;
int verb_count = 0;
int adjective_count = 0;
int noun_count = 0;
int preposition_count = 0;
int digit_count = 0;
%}

%%
I|you|he|she|it|we|they   { printf("%s is a pronoun.\n", yytext); pronoun_count++; }
run|jump|eat|sleep|study   { printf("%s is a verb.\n", yytext); verb_count++; }
happy|sad|big|small|good   { printf("%s is an adjective.\n", yytext); adjective_count++; }
dog|cat|house|car|book     { printf("%s is a noun.\n", yytext); noun_count++; }
at|in|on|for|with|to       { printf("%s is a preposition.\n", yytext); preposition_count++; }
[0-9]+                     { printf("%s is a digit.\n", yytext); digit_count++; }
.                           { printf("%s is not recognized.\n", yytext); }
%%

int main() {
    printf("Enter words (press Ctrl+D to end input):\n");
    yylex();

    printf("\nCounts:\n");
    printf("Pronouns: %d\n", pronoun_count);
    printf("Verbs: %d\n", verb_count);
    printf("Adjectives: %d\n", adjective_count);
    printf("Nouns: %d\n", noun_count);
    printf("Prepositions: %d\n", preposition_count);
    printf("Digits: %d\n", digit_count);

    return 0;
}

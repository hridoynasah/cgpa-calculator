%{
#include <stdio.h>
%}

%%
"Hello" {printf("%s world!",yytext);}
%%

int yywrap() {
    printf("End of input reached.\n");
    return 1; // Signal that there are no more files to process.
}

int main(int argc, char **argv) {
    yylex();
    return 0;
}
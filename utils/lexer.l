%{
#include "parser.tab.h"
%}

%%
"A+"    { return APLUS; }
"A"     { return A; }
"A-"    { return AMINUS; }
"B+"    { return BPLUS; }
"B"     { return B; }
"B-"    { return BMINUS; }
"C+"    { return CPLUS; }
"C"     { return C; }
"D"     { return D; }
"F"     { return F; }
"t"     { return THEORY; }
"l"     { return LAB; }
"q"     { return QUIT; }

/*
This means when the scanner finds any sequence of spaces, tabs, or newlines, 
it does nothing and simply discards them. This is a common way to ignore whitespace in an input stream.
*/

[ \t\n]+  ;  /* Ignore spaces, tabs, newlines*/

/*
The . rule acts as a default handler, matching any single character that doesn't 
fit a more specific rule, and then it returns that character directly as a token.
*/

.         { return yytext[0]; }
%%

int yywrap() { 
    return 1; 
    }

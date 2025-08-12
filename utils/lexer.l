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
[ \t\n]+  ;  /* Ignore spaces, tabs, newlines*/
.         { return yytext[0]; }
%%

int yywrap() { 
    return 1; 
    }

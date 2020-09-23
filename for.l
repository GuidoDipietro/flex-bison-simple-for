%{
#include "y.tab.h"
#include <string.h>
int yylex();
void yyerror(char* s);
%}

%%

"print"             {return PRINT;}
"times"             {return TIMES;}
\"[a-zA-Z]*\"       {yylval.str=strdup(yytext);return STRING;}
[1-9][0-9]*         {yylval.num=atoi(yytext); return NUMBER;}
[ \t\n]             ;
.               {yyerror("caracter incorrecto");}

%%

int yywrap(void){
    return 1;
}

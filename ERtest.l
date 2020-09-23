%{
#include <stdio.h>
%}
%option noyywrap

%%

"print"				{printf("PRINT\n");}
"times"				{printf("TIMES\n");}
\"[a-zA-Z]*\"		{printf("STRING\n");}
[1-9][0-9]*			{printf("NUMBER\n");}
[ \t\n]				;
.					{printf("Pifiaste");}

%%

int main(){
	yylex();
	return 0;
}
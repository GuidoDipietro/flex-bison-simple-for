%{
#include <stdio.h>
void yyerror(char *s);
extern int yylex();
%}

%union {
	int num;
	char* str;
}

%token PRINT TIMES
%token <str> STRING
%token <num> NUMBER

%%

start	: line
		| start line
;

line	: PRINT STRING NUMBER TIMES             {
				for(int i=0; i<$3; i++) printf("%s\n",$2);
				printf("\n");
			}
;

%%

int main(){
	return yyparse();
}

void yyerror(char* s){
	fprintf(stderr, "%s\n", s);
}

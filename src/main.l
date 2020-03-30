
%{
#include <stdio.h>
%}

CARACTER [a-zA-Z0-9]
PALAVRA {CARACTER}+
PUT [-_.]

%%

{PALAVRA}({PUT}{PALAVRA})*[@]{PALAVRA}({PUT}{PALAVRA})*[.]? { 
     if (yytext[strlen(yytext)-1] == '.') 
	yytext[strlen(yytext)-1] = '\0';
     printf("%s\n", yytext);
};

[[:space:]]+ ;
[[:^space:]]+ ;

%%

int main() {
  yylex();
  return 0;
}

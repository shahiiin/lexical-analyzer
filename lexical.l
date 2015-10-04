%{
#include <stdio.h>
#include "y.tab.h"
%}

%%

[ \t\n]


"|"						return T_OR;
"&"						return T_AND;
"("						return OPEN_PARENTHESES;
")"						return CLOSE_PARENTHESES;
"{"						return OPEN_BRACKET;
"}"						return CLOSE_BRACKET;
"="						return ASSIGN;
"<"						return LESS_THAN;
">"						return GREATER;
"=="					return EQUAL;
"!="					return NOT_EQUAL;
"<="					return LESS_THAN_EQUAL;
">="					return GREATER_THAN_EQUAL;
"-"						return MINUS;
"+"						return PLUS;
"/"						return DIV;
"*"						return MULTIPLY;
"~"						return NOT;
","						return CAMA;
";"						return SEMICOLON;
"$"						return END_OF_INPUT;

"int"					return T_INT;
"char"					return CHARACTER;
"float"					return T_FLOAT;
"long_int"				return T_LONG_INT;
"short_int"				return T_SHORT_INT;
"if"					return T_IF;
"for"					return T_FOR;
"while"					return T_WHILE;
"do"					return T_DO;
"break"					return T_BREAK;
"continue"				return T_CONTINUE;
"else"					return T_ELSE;
"return"				return T_RETURN;


[1-9][0-9]*				return DIGIT;
[a-zA-Z_][a-zA-Z0-9_]*	return ID;
.						return (yytext[0]);


%%
 
int yywrap(void){return 1;}

%{
#include <stdio.h>
#include <stdlib.h>
%}

%start input

%token DIGIT
%token ID
%token T_OR
%token T_AND
%token OPEN_PARENTHESES
%token CLOSE_PARENTHESES
%token OPEN_BRACKET
%token CLOSE_BRACKET
%token ASSIGN
%token LESS_THAN
%token GREATER
%token EQUAL
%token NOT_EQUAL
%token LESS_THAN_EQUAL
%token GREATER_THAN_EQUAL
%token MINUS
%token PLUS
%token DIV
%token MULTIPLY
%token NOT
%token CAMA
%token SEMICOLON
%token END_OF_INPUT
%token T_INT
%token CHARACTER
%token T_FLOAT
%token T_LONG_INT
%token T_SHORT_INT
%token T_IF
%token T_FOR
%token T_WHILE
%token T_DO
%token T_BREAK
%token T_CONTINUE
%token T_ELSE
%token T_RETURN

%% 

input : Statements END_OF_INPUT {printf("Correct input !\n"); exit(0);};

Statements : Statements Statement | Statement;

Statement : DeclareStatement | AssignStatement | ForStatement | WhileStatement | IfStatement |; 

DeclareStatement : Type ID SEMICOLON | Type ID ASSIGN Expressions;

AssignStatement : ID ASSIGN Expressions;

ForStatement : T_FOR OPEN_PARENTHESES DeclareStatement Expressions ForAssign CLOSE_PARENTHESES OPEN_BRACKET Statements CLOSE_BRACKET;

WhileStatement : T_WHILE OPEN_PARENTHESES Expression CLOSE_PARENTHESES OPEN_BRACKET Statements CLOSE_BRACKET | T_DO OPEN_BRACKET Statements CLOSE_BRACKET T_WHILE OPEN_PARENTHESES Expression CLOSE_PARENTHESES SEMICOLON;

IfStatement : T_IF OPEN_PARENTHESES Expression CLOSE_PARENTHESES OPEN_BRACKET Statements CLOSE_BRACKET | T_IF OPEN_PARENTHESES Expression CLOSE_PARENTHESES OPEN_BRACKET Statements CLOSE_BRACKET T_ELSE OPEN_BRACKET Statements CLOSE_BRACKET;

Type : T_INT | CHARACTER | T_FLOAT | T_LONG_INT | T_SHORT_INT;

ForAssign : ID ASSIGN Expression;

Expressions : Expression SEMICOLON;

Expression : E | E RelationalOp E;

RelationalOp : | EQUAL | NOT_EQUAL | LESS_THAN | GREATER | LESS_THAN_EQUAL | GREATER_THAN_EQUAL;

E : T | E T_OR T;
T : F | T T_AND F;
F : A | NOT A;
A : B | A PLUS B | A MINUS B;
B : C | B MULTIPLY C | B DIV C;
C : ID | OPEN_PARENTHESES Expression CLOSE_PARENTHESES | DIGIT;

%%

int main()
{
printf("Input: ");
yyparse();
return(0);
}
yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}






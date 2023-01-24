%{
#include <stdio.h>
%} 

DIGIT [0-9]
ID [a-zA-Z][a-zA-Z0-9]*

	int numInts = 0, numOps = 0, numParen = 0, numEq = 0;
 	int currLine= 1; 
	int currPos= 1;

%%
{DIGIT}+ {printf("%s\n", yytext);++numInts; currPos += yyleng;}
" "|"\t" {}
"\n" {++currLine;currPos = 1;}
"+" {printf("PLUS\n");++numOps; currPos += yyleng;}
"-" {printf("MINUS\n");++numOps; currPos += yyleng;}
"*" {printf("TIMES\n");++numOps;currPos += yyleng;}
"/" {printf("DIVIDES\n");++numOps; currPos += yyleng;}
"(" {printf("BEGIN_PARAMS\n");++numParen; currPos += yyleng;}
")" {printf("END_PARAMS\n");++numParen; currPos += yyleng;}
"=" {printf("EQUALS\n");++numEq; currPos += yyleng;}
"int" {printf("INTEGER\n"); currPos += yyleng;}
"int[]" {printf("ARRAY\n"); currPos += yyleng;}
"##"[^\n]*\n  {printf("COMMENTS\n");++currLine;currPos = 1;}
"get" {printf("GETINPUT\n");currPos += yyleng;}
"out" {printf("GETOUTPUT\n");currPos += yyleng;}
"==" {printf("EQUALITY\n");currPos += yyleng;}
">=" {printf("GREATEREQ\n");currPos += yyleng;}
"<=" {printf("LESSEQ\n");currPos += yyleng;}
"!=" {printf("NOTEQUALITY\n");currPos += yyleng;}
">" {printf("GREATER\n");currPos += yyleng;}
"<" {printf("LESS\n");currPos += yyleng;}
"while" {printf("WHILE\n");currPos += yyleng;}
"if" {printf("IF\n");currPos += yyleng;}
"else" {printf("ELSE\n");currPos += yyleng;}
"define" {printf("FUNCTION\n");currPos += yyleng;}
":" {printf("END_EXPRESSION\n");currPos += yyleng;}
"[" {printf("BEGIN_BODY\n");currPos += yyleng;}
"]" {printf("END_BODY\n");currPos += yyleng;}
"return" {printf("RETURN\n");currPos += yyleng;}
{ID} {printf("ID: %s\n", yytext);currPos += yyleng;}
. {printf("Error: Character not recognized in line %d column %d: unrecognized symbol \"%s\" \n" , currLine,currPos,yytext); YY_FATAL_ERROR("Exiting.\n");}
%%

void main(int argc, char **argv) {
   if(argc > 0){
      yyin = fopen(argv[1], "r");
   }
   yylex();
  // printf("Number of integers: %d\n", numInts);
  // printf("Number of operators: %d\n", numOps);
  // printf("Number of parantheses: %d\n", numParen);
  // printf("Number of equal signs: %d\n", numEq);
   printf("Number of lines: %d\n", currLine);
   if(argc > 0){
      fclose(yyin);
   }
}

%{
#include <stdio.h>
%} 

DIGIT [0-9]
ID [a-zA-Z][a-zA-Z0-9]*

    int numInts = 0, numOps = 0, numParen = 0, numEq = 0;
     int currLine, currPos;

%%
{DIGIT}+ {printf("%s\n", yytext);++numInts;}
" "|"\t" {}
"\n" {++currLine;currPos = 0;}
"+" {printf("PLUS\n");++numOps;}
"-" {printf("MINUS\n");++numOps;}
"" {printf("TIMES\n");++numOps;}
"/" {printf("DIVIDES\n");++numOps;}
"(" {printf("BEGIN_PARAMS\n");++numParen;}
")" {printf("END_PARAMS\n");++numParen;}
"=" {printf("EQUALS\n");++numEq;}
"int" {printf("INTEGER\n");}
"int[]" {printf("ARRAY\n");}
"##"[^\n]\n  {printf("COMMENTS\n");++currLine;currPos = 0;}
"get" {printf("GETINPUT\n");}
"out" {printf("GETOUTPUT\n");}
"==" {printf("EQUALITY\n");}
">=" {printf("GREATEREQ\n");}
"<=" {printf("LESSEQ\n");}
"!=" {printf("NOTEQUALITY\n");}
">" {printf("GREATER\n");}
"<" {printf("LESS\n");}
"while" {printf("WHILE\n");}
"if" {printf("IF\n");}
"else" {printf("ELSE\n");}
"define" {printf("FUNCTION\n");}
":" {printf("END_EXPRESSION\n");}
"[" {printf("BEGIN_BODY\n");}
"]" {printf("END_BODY\n");}
"return" {printf("RETURN\n");}
{ID} {printf("ID: %s\n", yytext);}
. {printf("Error: Character not recognized in line %d\n", currLine); YY_FATAL_ERROR("Exiting.\n");}
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

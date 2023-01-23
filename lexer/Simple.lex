%{
#include <stdio.h>
#include "y.tab.h"
// counts the numbers
int numbers = 0;
// counts the operators
int operators = 0;
// counts the parentheses
int pars = 0;
// counts the equalsigns
int equalsigns = 0;
// number of errors
int errors = 0;
// number of keywords
int keywords = 0;
// line number
int line_num = 1;
%}

DIGIT [0-9]
ID [a-zA-Z][a-zA-Z0-9]*
PLUS [+]
MINUS [-]
MULT [*]
DIV [/]
L_PAREN[(]
R_PAREN[)]
L_BRAC[[]
R_BRAC[]]
EQUAL[=]

%%
{DIGIT}+ {printf("NUMBER: %s\n", yytext);numbers++;return NUM;}
{ID} {printf("ID: %s\n", yytext);return ID;}
"+" {printf("PLUS\n", yytext);operators++;return PLUS;}
"-" {printf("MINUS\n", yytext);operators++;return MINUS;}
"/" {printf("DIV\n", yytext);operators++;return DIV;}
"*" {printf("MULT\n", yytext);operators++;return MULT;}
"(" {printf("BEGIN_PARAMS\n", yytext);pars++;return BEIGN_PARAMS;}
")" {printf("END_PARAMS\n", yytext);pars++;return END_PARAMS;}
"=" {printf("EQUAL\n", yytext);equalsigns++;return EQUAL;}

{DIGIT}*"."{DIGIT}+ {printf("FLOAT: %s\n", yytext);numbers++;return NUM;}
{DIGIT}*"."{DIGIT}+[eE][+-]?{DIGIT}+ {printf("FLOAT: %s\n", yytext);numbers++;return NUM;}
{DIGIT}+[eE][+-]?{DIGIT}+ {printf("FLOAT: %s\n", yytext);numbers++;return NUM;}
"\n" {line_num++;}

">" {printf("GREATER\n", yytext);return GREATER;}
"<" {printf("LESS\n", yytext);return LESS;}
">=" {printf("GREATEREQ\n", yytext);return GREATEREQ;}
"<=" {printf("LESSEQ\n", yytext);return LESSEQ;}
"!=" {printf("NOTEQUALITY\n", yytext);return NOTEQUALITY;}
"==" {printf("EQUALITY\n", yytext);return EQUALITY;}
"int" {printf("INTEGER: %s\n", yytext);keywords++;return INTEGER;}
"get" {printf("GETINPUT\n", yytext);keywords++;return GETINPUT;}
"out" {printf("GETOUTPUT\n", yytext);keywords++;return GETOUTPUT;}
"while" {printf("WHILE\n", yytext);keywords++;return WHILE;}
"if" {printf("IF\n", yytext);keywords++;return IF;}
"else" {printf("ELSE\n", yytext);keywords++;return ELSE;}
"define" {printf("FUNCTION\n", yytext);keywords++;return FUNCTION;}
"return" {printf("RETURN\n", yytext);keywords++;return RETURN;}
"\t" {printf("TAB\n", yytext);return TAB;}
"##."  {}
":" {printf("BEGIN_BODY\n", yytext);return BEGIN_BODY;}
";" {printf("END_BODY\n", yytext);return END_BODY;}
. {printf("Error-\"%s\" symbol not recognized\n", yytext);errors++;yyterminate();return NUM;}


%%
int main(int argc, char **argv)
{
    // if an input file is given use the file
    if (argc > 1)
        yyin = fopen(argv[1], "r");
    else
        yyin = stdin;
    yylex();
    if (errors == 0)
    {
        printf("The summary:\n");
        printf("%d numbers\n", numbers);
        printf("%d operators\n", operators);
        printf("%d parentheses\n", pars);
        printf("%d equal signs\n", equalsigns);
    }
}


int yywrap(){return(1);}

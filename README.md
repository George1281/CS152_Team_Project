# CS152_Team_Project

## Phase 0: Language Specification


Programming language name: Simple

Language file extension: test.simpl

Compiler name: Simple-Comp 


|__Language Feature__ | __Code Example__ |
| ------------------- | ---------------- |
|Integer scalar variables| int num1|\
|                        | int num2|
|One-dimensional array of integers|int[] array|\
|Assignment statements|num1 = 5|\
|                     |num2 = num1|
|Arithmetic operators|num1 = 1 + 2|\
||num1 = 1 - num2|
|| num1 = 1 * 2|
|| num1 = 1 / 2|
|Relational operators|y == 5, y > 5, y < 5,y >= 5,y <= 5, y != 5|\
|While loops|while expr: statement(s)|\
|If-then-else statements|if expr:statement(s)if expr:statement(s)else:statement(s)|\
|Read statements|get|\
|Write statements|out|\
|Comments|##|\
|Functions|define calculate (int num1, int num2):|
||	 return num1+num2;|


### Definitions:

Comments:## to calculate the sum of two integers

Valid identifiers:
Must start with a letter. Can only contain numbers and letters.

Case sensitive: Yes

Whitespaces:Indent code consistently. Indentation specifies code blocks. 

### Token Table:

|__Symbol in Language__ | __Token Name__ |
|---------------------- | -------------- |
|int                    | INTEGER        |
|int[]                  | ARRAY          |
|=                      | EQUALS         |
|+                      | PLUS           |
|-                      | MINUS          |
| *                     | TIMES          |
|/                      | DIVIDES        |
|##                     | COMMENTS       |
|get                    | GETINPUT       |
|out                    | GETOUTPUT      |
|==                     | EQUALITY       |
|>=                     | GREATEREQ      |
|<=                     | LESSEQ         |
|!=                     | NOTEQUALITY    |
|>                      | GREATER        |
|<                      | LESS           |
|while                  | WHILE          |
|if                     | IF             |
|else                   | ELSE           |
|define                 | FUNCTION       |
|(                      | BEGIN_PARAMS   |
|)                      | END_PARAMS     |
|:                      | BEGIN_BODY     |
|;                      | END_BODY       |
|return                 | RETURN         |
|\t                     | TAB            |
|\n                     | NEWLINE        |

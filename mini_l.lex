/*

The constructs of the MINI-L language

Integer scalar variables.
One-dimensional arrays of integers.
Assignment statements.
While and Do-While loops.
Continue statement.
If-then-else statements.
Read and write statements.
Comments.
Functions.


Details:
A comment is introduced by "##" and extends to the end of the current line.
MINI-L is case sensitive. All reserved words are expressed in lower case.
A valid identifier must begin with a letter, may be followed by additional letters, digits, or underscores, and cannot end in an underscore.
Whitespace in MINI-L programs can occur due to regular blank spaces, tabs, or newlines.

*/

%option noyywrap
%{
	#include "parser.tab.h"
	int curLine = 1;
	int curPos = 1;
%}

DIGIT       [0-9]
LETTER      [a-zA-Z]
ALPHANUM_ONLY  [a-zA-Z0-9]
ALPHANUM_UNDERSCORE [0-9A-Z_]
WHITESPACE [\t ]
NEWLINE [\n]
COMMENT ##.*\n
  
%%
"+"		{ curPos += yyleng; return ADD;  }
"-"		{ curPos += yyleng; return SUB;  }
"*"		{ curPos += yyleng; return MULT;  }
"/"		{ curPos += yyleng; return DIV;  }
"%"		{ curPos += yyleng; return MOD;  }

"=="		{ curPos += yyleng; return EQ;  }
"<>"		{ curPos += yyleng; return NEQ;  }
"<"		{ curPos += yyleng; return LT;  }
">"		{ curPos += yyleng; return GT;  }
"<="		{ curPos += yyleng; return LTE;  }
">="		{ curPos += yyleng; return GTE;  }

";"		{ curPos += yyleng; return SEMICOLON;  }
":"		{ curPos += yyleng; return COLON;  }
","		{ curPos += yyleng; return COMMA;  }
"("		{ curPos += yyleng; return L_PAREN;  }
")"		{ curPos += yyleng; return R_PAREN;  }
"["		{ curPos += yyleng; return L_SQUARE_BRACKET;  }
"]"		{ curPos += yyleng; return R_SQUARE_BRACKET;  }
":="		{ curPos += yyleng; return ASSIGN;  }


function	{ curPos += yyleng; return FUNCTION;  }
beginparams	{ curPos += yyleng; return BEGIN_PARAMS;  }
endparams	{ curPos += yyleng; return END_PARAMS;  }
beginlocals	{ curPos += yyleng; return BEGIN_LOCALS;  }
endlocals	{ curPos += yyleng; return END_LOCALS;  }
beginbody	{ curPos += yyleng; return BEGIN_BODY;  }
endbody		{ curPos += yyleng; return END_BODY;  }
integer		{ curPos += yyleng; return INTEGER;  }
array		{ curPos += yyleng; return ARRAY;  }
of		{ curPos += yyleng; return OF;  }
if		{ curPos += yyleng; return IF;  }
then		{ curPos += yyleng; return THEN;  }
endif		{ curPos += yyleng; return ENDIF;  }
else		{ curPos += yyleng; return ELSE;  }
while		{ curPos += yyleng; return WHILE;  }
do		{ curPos += yyleng; return DO;  }
beginloop	{ curPos += yyleng; return BEGINLOOP;  }
endloop		{ curPos += yyleng; return ENDLOOP;  }
continue	{ curPos += yyleng; return CONTINUE;  }
read		{ curPos += yyleng; return READ;  }
write		{ curPos += yyleng; return WRITE;  }
and		{ curPos += yyleng; return AND;  }
or		{ curPos += yyleng; return OR;  }
not		{ curPos += yyleng; return NOT;  }
true		{ curPos += yyleng; return TRUE;  }
false		{ curPos += yyleng; return FALSE;  }
return		{ curPos += yyleng; return RETURN; }


{LETTER}+({ALPHANUM_UNDERSCORE}*{ALPHANUM_ONLY}+)?    { curPos += yyleng;  yylval.strval =strdup(yytext); return IDENTIFIER;  }
{DIGIT}+    { curPos += yyleng; yylval.ival = atoi(yytext); return NUMBER;  }
{COMMENT}   { curLine++;}
{NEWLINE}+  { curLine++; curPos = 1;}

{LETTER}({LETTER}|{DIGIT}|"_")*"_"     {printf("Error at line %d, column %d: identifier \"%s\" cannot end with an underscore\n", curLine, curPos, yytext); }

("_")({LETTER}|_|{DIGIT})*	{printf("Error at line %d, column %d: identifier  \"%s\" must begin with a letter, but an underline \n", curLine, curPos, yytext); }	
({DIGIT})({LETTER}|_|{DIGIT})*	{printf("Error at line %d, column %d: identifier  \"%s\" must begin with a letter, but a digit \n", curLine, curPos, yytext); }

%%



%{
    #include <stdio.h>
    #include <ctype.h>
    #include <math.h>
    #define YYSTYPE double

    extern int yylex(void); // 不加该行可能报错
    void yyerror (char* s); //c语言规范，先声明再实现。函数在后面实现。
%}

%token NUM PLUS MINUS TIMES DIVIDE MOD POWER LEFT RIGHT EOL EXIT
%start input

%%
input       :               
            | input line
            ;
line        : EOL                       { YYACCEPT; }
            | EXIT                      { YYACCEPT; }
            | expr EOL                  { printf("%lf\n", $1); }
            ;
expr        : expr PLUS term            { $$ = $1 + $3; }
            | expr MINUS term           { $$ = $1 - $3; }
            | term
            ;
term        : term TIMES factor         { $$ = $1 * $3; }
            | term DIVIDE factor        { $$ = $1 / $3; }
            | term MOD factor           { $$ = (long)$1 % (long)$3; }
            | factor
            ;
factor      : factor POWER exponent     { $$ = pow($1, $3); }
            | exponent
exponent    : LEFT expr RIGHT           { $$ = $2; }
            | NUM
            ;
%%


#include "lex.yy.c"

int main(void)
{
    yyparse();
    return 0;
}


void yyerror (char* s)
{
    printf ("%s\n", s);
}
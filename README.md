* 参考网上资料，lex 和 yacc 做的某mini 计算器。
* 修复编译错误，可以正常编译的代码demo。

编译步骤:
step 1: lex lex.l 生成 lex.yy.c，
step 2: yacc yacc.y 生成 y.tab.c，会自动include lex.yy.c
step 3: gcc y.tab.c 生成 a.out ，直接运行使用
step 4: run ./a.out

```
Mac:lex_yacc helin$ lex lex.l 
Mac:lex_yacc helin$ yacc yacc.y 
Mac:lex_yacc helin$ gcc y.tab.c 
Mac:lex_yacc helin$ ./a.out 
23+232-23^2
-274.000000

Mac:lex_yacc helin$ ls
README.md a.out     lex.l     lex.yy.c  y.tab.c   yacc.y

```
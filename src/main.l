
%{
#include <stdio.h>
#include <string.h>
int flag = 0;
%}

ALPHANUM  [A-Za-z0-9]
VALID1  {ALPHANUM}+
VALID2  {ALPHANUM}+[_.-]*{ALPHANUM}+
INVALID1  [_.-]{ALPHANUMMAIL}*
INVALID2  {ALPHANUMMAIL}*[_.-]
VALID [{VALID1}{VALID2}]
VALIDMAIL {VALID}@{VALID}
INVALID [{INVALID1}{INVALID2}]
INVALIDMAIL [({INVALID}@{VALID})({VALID}@{INVALID})({INVALID}@{INVALID})]

%%
  /*email invalido*/
  /*e-mails validos*/
{VALIDMAIL} {
  printf("%s\n", yytext);
}



[ \t\n]  ;

. ;

%%

int main() {
  yylex();
  return 0;
}

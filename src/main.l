
%{
#include <stdio.h>
#include <string.h>
%}


ALPHANUM  [A-Za-z0-9]
VALID  {ALPHANUM}+([_.-]*{ALPHANUM}+)*@{ALPHANUM}+([_.-]*{ALPHANUM}+)*
INVALID [_.-]{VALID}
INVALID2 {VALID}[_-]
%%
  /*email invalido*/
{INVALID} ;
{INVALID2}  ;

  /*e-mails validos*/
{VALID} {
  printf("%s\n", yytext);
}

[ \t\n]  ;

. ;

%%

int main() {
  yylex();
  return 0;
}


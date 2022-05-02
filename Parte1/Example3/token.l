%{
    char yylval ;    
%}
%%
[+>;] { return yytext[0]; /* use ASCII code for single-char token */}
"for" { return T_For; }
[0-9]+ { yylval.integerConstant = atoi(yytext);
 return T_IntConstant; }
[a-z]+ { yylval.identifier = strdup(yytext);
 return T_Identifier; }
 
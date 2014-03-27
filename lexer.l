%pointer

%option noyywrap
%option yylineno

D 	[0-9]
L 	[a-zA-Z_]	 				
%{
	/* put C declarations here*/
	#include "proj1.tab.h"
	#include <math.h>
%}

%%

"#".*$	{ /* This is a comment; ignore */ }

"sequence"	{ return SEQUENCE; }
"sum"		{ return SUM: }
"term"		{ return TERM; }
"prime"		{ return PRIME; }
"primes" 	{ return PRIMES; }
"even"
"odd"
"greater than"	{ return GREATER_THAN; }
"less than"		{ return LESS_THAN; }


{L}({L}|{D})*(\[({D}*|{L})\])*	{ return ID; }
-?{D}+							{ return ICONST; }
-?{D}+"."{D}+(E{D}+)?			{ return FCONST; }

"<="	{ return BIN_REL_OP; }
">="	{ return BIN_REL_OP; }
"=="	{ return BIN_REL_OP; }
"!="	{ return BIN_REL_OP; }
"&&"	{ return BIN_REL_OP; }
"||" 	{ return BIN_REL_OP; }
"<"		{ return BIN_REL_OP; }
">"		{ return BIN_REL_OP; }

";"		{ return (';'); }


[ \t\n\r]+   {}
.        { return ERROR; }

%%
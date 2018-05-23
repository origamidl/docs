grammar Origami;

/*
 * Lexer Rules
 */

fragment DIGIT:
  [0-9] ;

fragment LETTER:
  'a'..'z' | 'A'..'Z' ;

WS:
  [ \t]+ -> channel(HIDDEN) ;

COMMENT:
  ';' .*? ~[\r\n]* -> skip ;

POINTSYMBOL:
  '.' ;

LINESYMBOL:
  '--' ;

REGIONSYMBOL:
  '#' ;

IDENTIFIER:
  LETTER (LETTER | DIGIT)* ;

POINT:
  POINTSYMBOL IDENTIFIER ;

LINE:
  LINESYMBOL IDENTIFIER ;

REGION:
  REGIONSYMBOL IDENTIFIER ;

/*
 * Parser Rules
 */
pointconstruction:
  POINTSYMBOL '(' WS? LINE WS LINE WS? ')' ;

lineconstruction:
  LINESYMBOL '(' WS? POINT WS POINT WS? ')' ;


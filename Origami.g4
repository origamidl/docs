grammar Origami;

/*
 * Lexer Rules
 */

fragment DIGIT:
  [0-9] ;

fragment LETTER:
  'a'..'z' | 'A'..'Z' ;

IDENTIFIER:
  LETTER (LETTER | DIGIT)* ;

POINT:
  '.' IDENTIFIER ;

LINE:
  '--' IDENTIFIER ;

REGION:
  '#' IDENTIFIER ;


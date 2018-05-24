grammar Origami;

/*
 * Lexer Rules
 */

fragment LETTER
  : 'a'..'z' | 'A'..'Z'
  ;

fragment DIGIT
  : [0-9]
  ;

fragment A : 'A' | 'a' ;
fragment N : 'N' | 'n' ;
fragment D : 'D' | 'd' ;
fragment O : 'O' | 'o' ;
fragment R : 'R' | 'r' ;

fragment DIGITWITHOUTZERO
  : [1-9]
  ;

NUMBER
  : DIGITWITHOUTZERO DIGIT* 'deg'?
  ;

WS
  : (' ' | [\u000C\t\r\n])+ -> skip
  ;

COMMENT
  : ';' .*? ~[\r\n]* -> skip
  ;

AND
  : A N D
  ;

OR
  : O R
  ;

WITHOUT
  : '\\'
  ;

DIFFERENCE
  : '<>'
  ;

POINTSYMBOL
  : '.'
  ;

LINESYMBOL
  : '--'
  ;

REGIONSYMBOL
  : '#'
  ;

IDENTIFIER
  : LETTER (LETTER | DIGIT)*
  ;

POINT
  : POINTSYMBOL IDENTIFIER
  ;

LINE
  : LINESYMBOL IDENTIFIER
  ;

REGION
  : REGIONSYMBOL IDENTIFIER
  ;

FOLD
  : 'fold'
  ;

UNFOLDMARKER
  : '@'
  ;

/*
 * Parser Rules
 */
constructor
  : lineConstructor
  | pointConstructor
  | regionConstructor
  ;

lineConstructor
  : LINESYMBOL '(' lineConstructorArguments ')'
  ;

lineConstructorArguments
  : POINT POINT
  | POINT LINE NUMBER
  ;

pointConstructor
  : POINTSYMBOL '(' pointConstructorArguments ')'
  ;

pointConstructorArguments
  : LINE LINE
  ;

regionConstructor
  : REGIONSYMBOL '(' regionConstructorArguments ')'
  ;

regionConstructorArguments
  : POINT LINE
  ;

regionCombination
  : REGION AND REGION
  | REGION OR REGION
  | REGION WITHOUT REGION
  | REGION DIFFERENCE REGION
  ;

fold
  : FOLD
  | UNFOLDMARKER FOLD
  ;

assignment
  : POINT ':'
  | LINE ':'
  | REGION ':'
  ;

axiom
  : axiom1
  | axiom2
  | axiom3
  | axiom4
  | axiom5
  | axiom6
  | axiom7
  ;

axiom1
  : fold 'through' POINT 'and' POINT
  ;

axiom2
  : fold POINT 'to' POINT
  ;

axiom3
  : fold LINE 'to' LINE
  ;

axiom4
  : fold LINE 'passing through' POINT
  ;

axiom5
  : fold POINT 'to' LINE 'via' POINT
  ;

axiom6
  : fold POINT 'to' LINE 'and' POINT 'to' LINE
  ;

axiom7
  : fold POINT 'to' LINE 'perpendicular to' LINE
  ;


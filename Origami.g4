grammar Origami;

var
  : varprefix varname
  ;

varprefix
  : POINTSYMBOL
  | LINESYMBOL
  | REGIONSYMBOL
  ;

varname
  : IDENTIFIER
  ;

varassignment
  : var COLON expression
  ;

expression
  : constructor
  | var
  ;

argument
  : expression
  | NUMBER
  ;

constructor
  : constructorprefix LPAREN (argument WS*) + RPAREN
  ;

constructorprefix
  : LINESYMBOL
  | POINTSYMBOL
  | REGIONSYMBOL
  ;

IDENTIFIER
  : [a-zA-Z] [a-zA-Z0-9]*
  ;

NUMBER
  : ('0' .. '9') +
  ;

AND
  : 'AND' | 'and'
  ;

OR
  : 'OR' | 'or'
  ;

WITHOUT
  : '\\'
  ;

DIFFERENCE
  : '<>'
  ;

TO
  : 'TO' | 'to'
  ;

PERPENDICULAR
  : 'PERPENDICULAR' | 'perpendicular'
  ;

VIA
  : 'VIA' | 'via'
  ;

COLON
  : ':'
  ;

LPAREN
  : '('
  ;

RPAREN
  : ')'
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

COMMENT
  : ';' ~ [\r\n] * -> skip
  ;

WS
  : [ \t\r\n] + -> channel (HIDDEN)
  ;


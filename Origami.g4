grammar Origami;

tokens { INDENT, DEDENT }

@lexer::members {
  private var tokens: [Token] = []
  private var indents: [Int] = []
  private var opened = 0
  private var lastToken: Token? = nil

  override func emit(_ token: Token) {
    super.setToken(token)
    tokens.append(token)
  }

  override func nextToken() throws -> Token {
    guard let _input = _input else {
      throw ANTLRError.illegalState(msg: "nextToken requires a non-null input stream.")
    }

    if _input.LA(1) == BufferedTokenStream.EOF && !indents.isEmpty {
      for i in stride(from: tokens.count - 1, to: 0, by: -1) {
        if tokens[i].getType() == EOF {
          tokens.remove(at: i)
        }
      }

      emit(commonToken(OrigamiParser.NEWLINE, "\n"))

      while !indents.isEmpty {
        emit(createDedent())
        indents.removeLast()
      }

      emit(commonToken(OrigamiParser.EOF, "<EOF>"))

      let next = super.nextToken()

      if next.getChannel() == Token.DEFAULT_CHANNEL {
        lastToken = next
      }

      return tokens.isEmpty ? next : tokens.removeFirst()
    }
  }

  private func createDedent() -> Token {
    let dedent = commonToken(OrigamiParser.DEDENT, "")
    dedent.setLine(lastToken.getLine())
    return dedent
  }

  private func commonToken(_ type: Int, _ text: String) -> CommonToken {
    let stop = getCharIndex() - 1
    let start = text.isEmpty ? stop : stop - text.lengthOfBytes(using: .utf8) + 1
    return CommonToken(_tokenFactorySourcePair, type, CommonToken.DEFAULT_CHANNEL, start, stop)
  }

  class func getIndentationCount(_ spaces: String) -> Int {
    var count = 0
    for ch in spaces {
      switch ch {
        case "\t":
          count += 8 - (count % 8)
        default:
          count ++
      }
    }

    return count
  }

  func asStartOfInput() -> Bool {
    return getCharPositionInLine() == 0 && getLine() == 1
  }
}

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

NEWLINE
  : ( {atStartOfInput()}?    SPACES
    | ( '\r'? '\n' | '\r' | '\f' ) SPACES?
    )
    {
      /*
      String newLine = getText().replaceAll("[^\r\n\f]+", "");
      String spaces = getText().replaceAll("[\r\n\f]+", "");
      int next = _input.LA(1);
      if (opened > 0 || next == '\r' || next == '\n' || next == '\f' || next == '#') {
        skip();
      }
      else {
        emit(commonToken(NEWLINE, newLine));
        int indent = getIndentationCount(spaces);
        int previous = indents.isEmpty() ? 0 : indents.peek();
        if (indent == previous) {
          skip();
        }
        else if (indent > previous) {
          indents.push(indent);
          emit(commonToken(OrigamiParser.INDENT, spaces));
        }
        else {
          while (!indents.isEmpty() && indents.peek() > indent) {
            this.emit(createDedent());
            indents.pop();
          }
        }
      }
      */
    }
  ;

fragment SPACES
  : [ \t]+
  ;


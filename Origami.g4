grammar Origami;

tokens { INDENT, DEDENT }

options {
  accessLevel = '';
}

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

    if try! _input.LA(1) == BufferedTokenStream.EOF && !indents.isEmpty {
      for i in stride(from: tokens.count - 1, to: 0, by: -1) {
        if tokens[i].getType() == OrigamiParser.Tokens.EOF.rawValue {
          tokens.remove(at: i)
        }
      }

      emit(commonToken(OrigamiParser.Tokens.NEWLINE, "\n"))

      while !indents.isEmpty {
        emit(createDedent())
        indents.removeLast()
      }

      emit(commonToken(OrigamiParser.Tokens.EOF, "<EOF>"))
    }

    let next = try! super.nextToken()

    if next.getChannel() == OrigamiLexer.DEFAULT_TOKEN_CHANNEL {
      lastToken = next
    }

    return tokens.isEmpty ? next : tokens.removeFirst()
  }

  private func createDedent() -> Token {
    let dedent = commonToken(OrigamiParser.Tokens.DEDENT, "")
    dedent.setLine(lastToken!.getLine())
    return dedent
  }

  private func commonToken(_ type: OrigamiParser.Tokens, _ text: String) -> CommonToken {
    let stop = getCharIndex() - 1
    let start = text.isEmpty ? stop : stop - text.lengthOfBytes(using: .utf8) + 1
    let pair = TokenSourceAndStream(self, _input!)
    return CommonToken(pair, type.rawValue, CommonToken.DEFAULT_CHANNEL, start, stop)
  }

  class func getIndentationCount(_ spaces: String) -> Int {
    var count = 0
    for ch in spaces {
      switch ch {
        case "\t":
          count += 8 - (count % 8)
        default:
          count += 1
      }
    }

    return count
  }

  func atStartOfInput() -> Bool {
    return getCharPositionInLine() == 0 && getLine() == 1
  }
}

variable
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
  : variable COLON expression
  ;

expression
  : constructor
  | variable
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
      let newLine = getText().replacingOccurrences(of: "[^\\r\\n\\f]", with: "", options: [.regularExpression])
      let spaces = getText().replacingOccurrences(of: "[\\r\\n\\f]", with: "", options: [.regularExpression])
      let next = try! String(UnicodeScalar(_input!.LA(1))!)

      if opened > 0 || next == "\\r" || next == "\\n" || next == "\\f" || next == ";" {
        skip()
      } else {
        emit(commonToken(OrigamiParser.Tokens.NEWLINE, newLine))
        let indent = OrigamiLexer.getIndentationCount(spaces)
        let previous = indents.isEmpty ? 0 : indents.first
        if indent == previous {
          skip()
        } else if indent > previous! {
          indents.append(indent)
          emit(commonToken(OrigamiParser.Tokens.INDENT, spaces))
        } else {
          while !indents.isEmpty && indents.first! > indent {
            emit(createDedent())
            indents.removeLast()
          }
        }
      }
    }
  ;

fragment SPACES
  : [ \t]+
  ;

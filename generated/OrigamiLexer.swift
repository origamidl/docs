// Generated from Origami.g4 by ANTLR 4.7.1
import Antlr4

open class OrigamiLexer: Lexer {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = OrigamiLexer._ATN.getNumberOfDecisions()
          for i in 0..<length {
          	    decisionToDFA.append(DFA(OrigamiLexer._ATN.getDecisionState(i)!, i))
          }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	static let IDENTIFIER=1, NUMBER=2, AND=3, OR=4, WITHOUT=5, DIFFERENCE=6, 
            TO=7, PERPENDICULAR=8, VIA=9, COLON=10, LPAREN=11, RPAREN=12, 
            POINTSYMBOL=13, LINESYMBOL=14, REGIONSYMBOL=15, COMMENT=16, 
            WS=17, NEWLINE=18

	public
	static let channelNames: [String] = [
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	]

	public
	static let modeNames: [String] = [
		"DEFAULT_MODE"
	]

	public
	static let ruleNames: [String] = [
		"IDENTIFIER", "NUMBER", "AND", "OR", "WITHOUT", "DIFFERENCE", "TO", "PERPENDICULAR", 
		"VIA", "COLON", "LPAREN", "RPAREN", "POINTSYMBOL", "LINESYMBOL", "REGIONSYMBOL", 
		"COMMENT", "WS", "NEWLINE", "SPACES"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, nil, nil, nil, nil, "'\\'", "'<>'", nil, nil, nil, "':'", "'('", 
		"')'", "'.'", "'--'", "'#'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "IDENTIFIER", "NUMBER", "AND", "OR", "WITHOUT", "DIFFERENCE", "TO", 
		"PERPENDICULAR", "VIA", "COLON", "LPAREN", "RPAREN", "POINTSYMBOL", "LINESYMBOL", 
		"REGIONSYMBOL", "COMMENT", "WS", "NEWLINE"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)


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


	override open
	func getVocabulary() -> Vocabulary {
		return OrigamiLexer.VOCABULARY
	}

	public
	required init(_ input: CharStream) {
	    RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION)
		super.init(input)
		_interp = LexerATNSimulator(self, OrigamiLexer._ATN, OrigamiLexer._decisionToDFA, OrigamiLexer._sharedContextCache)
	}

	override open
	func getGrammarFileName() -> String { return "Origami.g4" }

	override open
	func getRuleNames() -> [String] { return OrigamiLexer.ruleNames }

	override open
	func getSerializedATN() -> String { return OrigamiLexer._serializedATN }

	override open
	func getChannelNames() -> [String] { return OrigamiLexer.channelNames }

	override open
	func getModeNames() -> [String] { return OrigamiLexer.modeNames }

	override open
	func getATN() -> ATN { return OrigamiLexer._ATN }

	override open
	func action(_ _localctx: RuleContext?,  _ ruleIndex: Int, _ actionIndex: Int) throws {
		switch (ruleIndex) {
		case 17:
			NEWLINE_action((_localctx as RuleContext?), actionIndex)

		default: break
		}
	}
	private func NEWLINE_action(_ _localctx: RuleContext?,  _ actionIndex: Int) {
		switch (actionIndex) {
		case 0:

			      let newLine = getText().replacingOccurences(of: "[^\r\n\f]", with: "", options: [.regularExpression])
			      let spaces = getText().replacingOccurences(of: "[\r\n\f]", with: "", options: [.regularExpression])
			      let next = _input.LA(1)

			      if opened > 0 || next == "\r" || next == "\n" || next == "\f" || next == ";" {
			        skip()
			      } else {
			        emit(commonToken(NEWLINE, newLine))
			        let indent = getIndentationCount(spaces)
			        let previous = indents.isEmpty ? 0 : indents.first
			        if indent == previous {
			          skip()
			        } else if indent > previous {
			          indents.append(indent)
			          emit(commonToken(OrigamiParser.INDENT, spaces))
			        } else {
			          while !indents.isEmpty && indents.first > indent {
			            emit(createDedent())
			            indents.removeLast()
			          }
			        }
			      }
			    

		 default: break
		}
	}
	override open
	func sempred(_ _localctx: RuleContext?, _  ruleIndex: Int,_   predIndex: Int) throws -> Bool {
		switch (ruleIndex) {
		case 17:
			return try NEWLINE_sempred(_localctx?.castdown(RuleContext.self), predIndex)
		default: return true
		}
	}
	private func NEWLINE_sempred(_ _localctx: RuleContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 0:return atStartOfInput()
		    default: return true
		}
	}


	public
	static let _serializedATN: String = OrigamiLexerATN().jsonString

	public
	static let _ATN: ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}
// Generated from Origami.g4 by ANTLR 4.7.1
import Antlr4

open class OrigamiParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = OrigamiParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(OrigamiParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, IDENTIFIER = 1, NUMBER = 2, AND = 3, OR = 4, WITHOUT = 5, 
                 DIFFERENCE = 6, TO = 7, PERPENDICULAR = 8, VIA = 9, COLON = 10, 
                 LPAREN = 11, RPAREN = 12, POINTSYMBOL = 13, LINESYMBOL = 14, 
                 REGIONSYMBOL = 15, COMMENT = 16, WS = 17, NEWLINE = 18, 
                 INDENT = 19, DEDENT = 20
	}

	public
	static let RULE_variable = 0, RULE_varprefix = 1, RULE_varname = 2, RULE_varassignment = 3, 
            RULE_expression = 4, RULE_argument = 5, RULE_constructor = 6, 
            RULE_constructorprefix = 7

	public
	static let ruleNames: [String] = [
		"variable", "varprefix", "varname", "varassignment", "expression", "argument", 
		"constructor", "constructorprefix"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, nil, nil, nil, nil, "'\\'", "'<>'", nil, nil, nil, "':'", "'('", 
		"')'", "'.'", "'--'", "'#'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "IDENTIFIER", "NUMBER", "AND", "OR", "WITHOUT", "DIFFERENCE", "TO", 
		"PERPENDICULAR", "VIA", "COLON", "LPAREN", "RPAREN", "POINTSYMBOL", "LINESYMBOL", 
		"REGIONSYMBOL", "COMMENT", "WS", "NEWLINE", "INDENT", "DEDENT"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "Origami.g4" }

	override open
	func getRuleNames() -> [String] { return OrigamiParser.ruleNames }

	override open
	func getSerializedATN() -> String { return OrigamiParser._serializedATN }

	override open
	func getATN() -> ATN { return OrigamiParser._ATN }

	override open
	func getVocabulary() -> Vocabulary {
	    return OrigamiParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,OrigamiParser._ATN,OrigamiParser._decisionToDFA, OrigamiParser._sharedContextCache)
	}

	public class VariableContext: ParserRuleContext {
			open
			func varprefix() -> VarprefixContext? {
				return getRuleContext(VarprefixContext.self, 0)
			}
			open
			func varname() -> VarnameContext? {
				return getRuleContext(VarnameContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OrigamiParser.RULE_variable
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.enterVariable(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.exitVariable(self)
			}
		}
	}
	@discardableResult
	 open func variable() throws -> VariableContext {
		var _localctx: VariableContext = VariableContext(_ctx, getState())
		try enterRule(_localctx, 0, OrigamiParser.RULE_variable)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(16)
		 	try varprefix()
		 	setState(17)
		 	try varname()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VarprefixContext: ParserRuleContext {
			open
			func POINTSYMBOL() -> TerminalNode? {
				return getToken(OrigamiParser.Tokens.POINTSYMBOL.rawValue, 0)
			}
			open
			func LINESYMBOL() -> TerminalNode? {
				return getToken(OrigamiParser.Tokens.LINESYMBOL.rawValue, 0)
			}
			open
			func REGIONSYMBOL() -> TerminalNode? {
				return getToken(OrigamiParser.Tokens.REGIONSYMBOL.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OrigamiParser.RULE_varprefix
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.enterVarprefix(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.exitVarprefix(self)
			}
		}
	}
	@discardableResult
	 open func varprefix() throws -> VarprefixContext {
		var _localctx: VarprefixContext = VarprefixContext(_ctx, getState())
		try enterRule(_localctx, 2, OrigamiParser.RULE_varprefix)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(19)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, OrigamiParser.Tokens.POINTSYMBOL.rawValue,OrigamiParser.Tokens.LINESYMBOL.rawValue,OrigamiParser.Tokens.REGIONSYMBOL.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VarnameContext: ParserRuleContext {
			open
			func IDENTIFIER() -> TerminalNode? {
				return getToken(OrigamiParser.Tokens.IDENTIFIER.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OrigamiParser.RULE_varname
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.enterVarname(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.exitVarname(self)
			}
		}
	}
	@discardableResult
	 open func varname() throws -> VarnameContext {
		var _localctx: VarnameContext = VarnameContext(_ctx, getState())
		try enterRule(_localctx, 4, OrigamiParser.RULE_varname)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(21)
		 	try match(OrigamiParser.Tokens.IDENTIFIER.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VarassignmentContext: ParserRuleContext {
			open
			func variable() -> VariableContext? {
				return getRuleContext(VariableContext.self, 0)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(OrigamiParser.Tokens.COLON.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OrigamiParser.RULE_varassignment
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.enterVarassignment(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.exitVarassignment(self)
			}
		}
	}
	@discardableResult
	 open func varassignment() throws -> VarassignmentContext {
		var _localctx: VarassignmentContext = VarassignmentContext(_ctx, getState())
		try enterRule(_localctx, 6, OrigamiParser.RULE_varassignment)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(23)
		 	try variable()
		 	setState(24)
		 	try match(OrigamiParser.Tokens.COLON.rawValue)
		 	setState(25)
		 	try expression()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpressionContext: ParserRuleContext {
			open
			func constructor() -> ConstructorContext? {
				return getRuleContext(ConstructorContext.self, 0)
			}
			open
			func variable() -> VariableContext? {
				return getRuleContext(VariableContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OrigamiParser.RULE_expression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.enterExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.exitExpression(self)
			}
		}
	}
	@discardableResult
	 open func expression() throws -> ExpressionContext {
		var _localctx: ExpressionContext = ExpressionContext(_ctx, getState())
		try enterRule(_localctx, 8, OrigamiParser.RULE_expression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(29)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,0, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(27)
		 		try constructor()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(28)
		 		try variable()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ArgumentContext: ParserRuleContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func NUMBER() -> TerminalNode? {
				return getToken(OrigamiParser.Tokens.NUMBER.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OrigamiParser.RULE_argument
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.enterArgument(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.exitArgument(self)
			}
		}
	}
	@discardableResult
	 open func argument() throws -> ArgumentContext {
		var _localctx: ArgumentContext = ArgumentContext(_ctx, getState())
		try enterRule(_localctx, 10, OrigamiParser.RULE_argument)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(33)
		 	try _errHandler.sync(self)
		 	switch (OrigamiParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .POINTSYMBOL:fallthrough
		 	case .LINESYMBOL:fallthrough
		 	case .REGIONSYMBOL:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(31)
		 		try expression()

		 		break

		 	case .NUMBER:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(32)
		 		try match(OrigamiParser.Tokens.NUMBER.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ConstructorContext: ParserRuleContext {
			open
			func constructorprefix() -> ConstructorprefixContext? {
				return getRuleContext(ConstructorprefixContext.self, 0)
			}
			open
			func LPAREN() -> TerminalNode? {
				return getToken(OrigamiParser.Tokens.LPAREN.rawValue, 0)
			}
			open
			func RPAREN() -> TerminalNode? {
				return getToken(OrigamiParser.Tokens.RPAREN.rawValue, 0)
			}
			open
			func argument() -> [ArgumentContext] {
				return getRuleContexts(ArgumentContext.self)
			}
			open
			func argument(_ i: Int) -> ArgumentContext? {
				return getRuleContext(ArgumentContext.self, i)
			}
			open
			func WS() -> [TerminalNode] {
				return getTokens(OrigamiParser.Tokens.WS.rawValue)
			}
			open
			func WS(_ i:Int) -> TerminalNode? {
				return getToken(OrigamiParser.Tokens.WS.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return OrigamiParser.RULE_constructor
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.enterConstructor(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.exitConstructor(self)
			}
		}
	}
	@discardableResult
	 open func constructor() throws -> ConstructorContext {
		var _localctx: ConstructorContext = ConstructorContext(_ctx, getState())
		try enterRule(_localctx, 12, OrigamiParser.RULE_constructor)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(35)
		 	try constructorprefix()
		 	setState(36)
		 	try match(OrigamiParser.Tokens.LPAREN.rawValue)
		 	setState(44) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(37)
		 		try argument()
		 		setState(41)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == OrigamiParser.Tokens.WS.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(38)
		 			try match(OrigamiParser.Tokens.WS.rawValue)


		 			setState(43)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}


		 		setState(46); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, OrigamiParser.Tokens.NUMBER.rawValue,OrigamiParser.Tokens.POINTSYMBOL.rawValue,OrigamiParser.Tokens.LINESYMBOL.rawValue,OrigamiParser.Tokens.REGIONSYMBOL.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())
		 	setState(48)
		 	try match(OrigamiParser.Tokens.RPAREN.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ConstructorprefixContext: ParserRuleContext {
			open
			func LINESYMBOL() -> TerminalNode? {
				return getToken(OrigamiParser.Tokens.LINESYMBOL.rawValue, 0)
			}
			open
			func POINTSYMBOL() -> TerminalNode? {
				return getToken(OrigamiParser.Tokens.POINTSYMBOL.rawValue, 0)
			}
			open
			func REGIONSYMBOL() -> TerminalNode? {
				return getToken(OrigamiParser.Tokens.REGIONSYMBOL.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OrigamiParser.RULE_constructorprefix
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.enterConstructorprefix(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OrigamiListener {
				listener.exitConstructorprefix(self)
			}
		}
	}
	@discardableResult
	 open func constructorprefix() throws -> ConstructorprefixContext {
		var _localctx: ConstructorprefixContext = ConstructorprefixContext(_ctx, getState())
		try enterRule(_localctx, 14, OrigamiParser.RULE_constructorprefix)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(50)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, OrigamiParser.Tokens.POINTSYMBOL.rawValue,OrigamiParser.Tokens.LINESYMBOL.rawValue,OrigamiParser.Tokens.REGIONSYMBOL.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public
	static let _serializedATN = OrigamiParserATN().jsonString

	public
	static let _ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}
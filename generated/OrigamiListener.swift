// Generated from Origami.g4 by ANTLR 4.7.1
import Antlr4

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link OrigamiParser}.
 */
public protocol OrigamiListener: ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link OrigamiParser#variable}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVariable(_ ctx: OrigamiParser.VariableContext)
	/**
	 * Exit a parse tree produced by {@link OrigamiParser#variable}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVariable(_ ctx: OrigamiParser.VariableContext)
	/**
	 * Enter a parse tree produced by {@link OrigamiParser#varprefix}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVarprefix(_ ctx: OrigamiParser.VarprefixContext)
	/**
	 * Exit a parse tree produced by {@link OrigamiParser#varprefix}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVarprefix(_ ctx: OrigamiParser.VarprefixContext)
	/**
	 * Enter a parse tree produced by {@link OrigamiParser#varname}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVarname(_ ctx: OrigamiParser.VarnameContext)
	/**
	 * Exit a parse tree produced by {@link OrigamiParser#varname}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVarname(_ ctx: OrigamiParser.VarnameContext)
	/**
	 * Enter a parse tree produced by {@link OrigamiParser#varassignment}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVarassignment(_ ctx: OrigamiParser.VarassignmentContext)
	/**
	 * Exit a parse tree produced by {@link OrigamiParser#varassignment}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVarassignment(_ ctx: OrigamiParser.VarassignmentContext)
	/**
	 * Enter a parse tree produced by {@link OrigamiParser#expression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpression(_ ctx: OrigamiParser.ExpressionContext)
	/**
	 * Exit a parse tree produced by {@link OrigamiParser#expression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpression(_ ctx: OrigamiParser.ExpressionContext)
	/**
	 * Enter a parse tree produced by {@link OrigamiParser#argument}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterArgument(_ ctx: OrigamiParser.ArgumentContext)
	/**
	 * Exit a parse tree produced by {@link OrigamiParser#argument}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitArgument(_ ctx: OrigamiParser.ArgumentContext)
	/**
	 * Enter a parse tree produced by {@link OrigamiParser#constructor}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterConstructor(_ ctx: OrigamiParser.ConstructorContext)
	/**
	 * Exit a parse tree produced by {@link OrigamiParser#constructor}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitConstructor(_ ctx: OrigamiParser.ConstructorContext)
	/**
	 * Enter a parse tree produced by {@link OrigamiParser#constructorprefix}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterConstructorprefix(_ ctx: OrigamiParser.ConstructorprefixContext)
	/**
	 * Exit a parse tree produced by {@link OrigamiParser#constructorprefix}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitConstructorprefix(_ ctx: OrigamiParser.ConstructorprefixContext)
}
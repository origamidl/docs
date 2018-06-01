//
//  Origami.swift
//  Origami
//
//  Created by Christopher Mühl on 01.06.18.
//


import Foundation
import Antlr4

public class Origami {

    public init(stream: InputStream) {
        let stream = UnbufferedCharStream(stream)
        let lexer = OrigamiLexer(stream)
        let tokens = CommonTokenStream(lexer)

        do {
            try tokens.fill()
            for token in tokens.getTokens() {
                print(token.getType())
            }
        } catch {
            print("Could not tokenize.")
        }
    }

}

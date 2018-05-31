# Origami
Origami is a programming language designed for the automatic generation of Origami instructions.

See [Issue #1](https://github.com/padarom/origami/issues/1) for more information.

### Library
The ultimate goal of Origami is to be embedded in an iOS application for Origami instructions. As such, the default language parser is written in Swift and (more specifically) implemented as an iOS Static Library.

#### Requirements
This library relies on ANTLR 4.7.1 for generating the lexer and parser and therefore expects that `/usr/local/lib/antlr-4.7.1-complete.jar` exists.

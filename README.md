# Origami
Origami is a programming language designed for the automatic generation of Origami instructions.

See [Issue #1](https://github.com/padarom/origami/issues/1) for more information.

### ANTLR
The syntax and grammar of _Origami_ is defined in ANTLRv4. This allows me to focus on the implementation of _Origami_ rather than on writing a parser for it.

#### Build instructions
ANTLR can autogenerate the Lexer and Parser for us. To do so, run `antlr4 -Dlanguage=Swift Origami.g4` in your command line.


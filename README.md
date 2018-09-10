# Origami Definition Language (_Origami_)
Origami Definition Language is a design-specific language created to textually define Origami folding instructions and is designed to be easily parseable by both human and machine.

**The language is still being specified. Please have a look at the issues (and especially [Issue #1](https://github.com/padarom/origami/issues/1)) if you want to know more or contribute.**

To distinguish Origami (the art of paper folding) from _Origami_ (the Origami Definition Language), the latter will be written in cursive for the purposes of this and other documents relating to the language.

## Introduction
All Origami operations (i.e. folds) can be described by the seven [Huzita-Hatori axioms](https://en.wikipedia.org/wiki/Huzita%E2%80%93Hatori_axioms). _Origami_ makes use of this by having seven language constructs to specify folds, one for each of the axioms.

A very simple example written in _Origami_ could start like this:
```origami
# paper: square

rotate -45
step:
  --d1: @fold .a to .c
  --d2: @fold .d to .b

step:
  flip
  @fold .c to .b
  @fold .a to .b
  .center: .(--^1 --^2)   ; The result of the last and second to last instruction

; ...
```

## Parts
This project consists of multiple parts:
- The _Origami Definition Language_
- An _Origami_ lexer and parser
- An _Origami_ runtime which generates instructions and preview images

#### Licenses
The _Origami Definition Language_ is licensed under MIT. The lexers, parsers and runtimes within this repository are licensed under Creative Commons BY-NC 3.0.

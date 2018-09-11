# Origami Definition Language Specification
This document specifies the syntax and semantics of the Origami Definition Language (_Origami_ for short).

[[toc]]

## 1. Overview
Origami is a statically-typed, domain-specific language. It is not intended to be a turing-complete language and should be considered as a description language, rather than a programming language.

## 2. Notation
::: warning
This description of the notation is currently taken from ECMA-408. We should write our own.
:::

Grammar productions are given in Extended Backus-Naur-Form (EBNF). The left hand side of a production ends with a colon. On the right hand side, alternation is represented by vertical bars, and sequencing by spacing. Alternation gives priority to the left. Optional elements of a production are suffixed by a question mark. Appending a star to an element of a production means it may be repeated zero or more times. Parantheses are used for grouping. Negation is represented by prefixing an element of a production with a tilde.

An example:

```ebnf
AProduction:
  AnAlternative |
  AnotherAlternative |
  OneThing After Another |
  ZeroOrMoreThings* |
  OneOrMoreThings+ |
  AnOptionalThing? |
  (Some Grouped Things) |
  ~NotAThing
;
```

## 2. Variables
Variables are storage locations in memory.

A variable needs to be initialized upon definition.

## 3. Instructions
Instructions return lines. Temporary variables are created for each instruction.  
`--^1`, `--^2`, ..., `--^9`.

## 4. Functions
# Origami Definition Language (_Origami_)
Origami Definition Language is a design-specific language created to textually define Origami folding instructions and is designed to be easily parseable by both human and machine.

**The language is still being specified. Please have a look at the issues (and especially [Issue #1](https://github.com/padarom/origami/issues/1)) if you want to know more or contribute.**

To distinguish Origami (the art of paper folding) from _Origami_ (the Origami Definition Language), the latter will be written in cursive for the purposes of this and other documents relating to the language.

### Example
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
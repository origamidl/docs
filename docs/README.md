# Origami Definition Language (_OrigamiDL_)
Origami Definition Language is a design-specific language created to textually define Origami folding instructions and is designed to be easily parseable by both human and machine.

## Introduction
All Origami operations (i.e. folds) can be described by the seven [Huzita-Hatori axioms](https://en.wikipedia.org/wiki/Huzita%E2%80%93Hatori_axioms). OrigamiDL makes use of this by having seven language constructs to specify folds, one for each of the axioms.

These are all instructions currently available in OrigamiDL:
```origami
# paper: square
; Specifies the type of paper used

# front: #fa00fa
# back: texture("texture.png")
; Specifies paper color and/or texture

# mark: "Flip the paper over and fold the edges to the center."
; A breakpoint for the runtime

# hide: --ab
# highlight: .a
; TBD

fold .landmark over --(.a .b)
; Huzita-Hatori 1: Two points (.a, .b) define a fold through them

fold .a to .b
; Huzita-Hatori 2: There is a unique fold that places .a onto .b

fold --a to --b
; Huzita-Hatori 3: There is a unique fold that places --a onto --b

fold --l passing through .p
; Huzita-Hatori 4: 
;     Given a point .p and line --l, there is a unique fold
;     perpendicular to --l that passes through .p

fold .a to --l via .b
; Huzita-Hatori 5: 
;     Given two points .a and .b and a line --l, there is a unique fold 
;     that places .a onto --l and passes through .b

fold .a to --l and .b to --r
; Huzita-Hatori 6: 
;     Given two points .a and .b and lines --l and --r,
;     there is a unique fold that places .a onto --l and .b onto --r

fold .p to --l perpendicular to --r
; Huzita-Hatori 7: 
;     Given a point .p and lines --l and --r, there is a unique fold
;     that places .p onto --l and is perpendicular to --r

.point: .(--lineA --lineB)      ; Constructs a new point from the intersection of two lines
.point: .(--line .point 20%)    ; 
--line: --(--line .point 15°)   ; 

; Define a new part under the namespace "triangle"
triangle: part ->
    # paper: square
    --line: fold .a to .b
    --namedLine: fold .b to .c

    export --line
    export renamedLine: --namedLine
    ; Exports --line and --namedLine to a global context

--line::triangle
--renamedLine::triangle

box: import 'box' ; Imports the file "./box.origami" under the namespace "box"
.point::box
; The exports defined in the file "./box.origami" are now available
```

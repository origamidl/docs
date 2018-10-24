---
example.a: |
    # paper: square
    # front: #000000
    # back: texture("origami_tutor_4.jpg")
    
    --line: --(.a .b)

    step:
        fold --line to --(.c .d)
        # export: nothing
---

# Examples

<LivePreview :code="$page.frontmatter['example.a']" />
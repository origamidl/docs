---
example.a: |
    --line: --(.a .b)

    step:
        fold --line to --(.c .d)
        # export: nothing
---

# Examples

<LivePreview :code="$page.frontmatter['example.a']" />
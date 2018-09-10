const Prism = require('prismjs')
const escapeHtml = require('escape-html')

function wrap (code, lang) {
    if (lang === 'text') {
        code = escapeHtml(code)
    }
    return `<pre v-pre class="language-${lang}"><code>${code}</code></pre>`
}

const OrigamiGrammar = {
    builtin: /#.+$/m,
    comment: /;.+$/m,
    variable: /[(:\(\)]/,
}

module.exports = function (md) {
    let originalHighlighter = md.options.highlight;

    md.options.highlight = function (str, lang) {
        if (lang == 'origami') {
            const code = Prism.highlight(str, OrigamiGrammar, lang)
            return wrap(code, lang)
        }
        
        return originalHighlighter(str, lang)
    }
    
    return md
}

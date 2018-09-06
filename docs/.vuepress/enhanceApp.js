const prism = require('prismjs')

export default ({
    Vue,
    options,
    router,
    siteData
}) => {
    prism.languages.ebnf = {
        'comment': /./  
    };
    console.log(prism.languages)
}
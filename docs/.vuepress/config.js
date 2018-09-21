module.exports = {
    title: 'Origami Definition Language',
    description: 'Documentation and Specification of the Origami Definition Language',
    markdown: {
        config: md => require('./highlight')(md)
    },
    plugins: [
        '@vuepress/plugin-register-components'
    ],
    themeConfig: {
        repo: 'origamidl/origami',
        docsDir: 'docs',
        editLinks: true,
        editLinkText: 'Edit this page on GitHub',
        lastUpdated: 'Last updated',
        sidebar: [
            ['/', 'Start'],
            {
                title: 'Guide',
                collapsable: false,
                children: [
                    ['examples', 'Examples']
                ]
            },
            {
                title: 'Specification',
                collapsable: false,
                children: [
                    ['/specification/semantics', 'Semantics'],
                    '/specification/pragmatics'
                ]
            }
        ]
    }
}


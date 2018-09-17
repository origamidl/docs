module.exports = {
    title: 'Origami Definition Language',
    description: 'Documentation and Getting Started guide of the Origami Definition Language',
    markdown: {
        config: md => require('./highlight')(md)
    },
    plugins: [
        '@vuepress/plugin-register-components'
    ],
    themeConfig: {
        repo: 'origami-dsl/origami',
        editLinks: true,
        editLinkText: 'Edit this page on GitHub',
        lastUpdated: 'Last updated',
        sidebar: [
            ['/', 'Start'],
            ['specification', 'Specification'],
            {
                title: 'Guide',
                collapsable: true,
                children: [
                    ['/examples', 'Examples']
                ]
            },
            {
                title: 'Pragmatics',
                collapsable: true,
                children: [
                ]
            }
        ]
    }
}


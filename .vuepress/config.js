module.exports = {
    title: 'Origami Definition Language',
    description: 'Documentation and Getting Started guide of the Origami Definition Language',
    markdown: {
        config: md => require('./highlight')(md)
    },
    themeConfig: {
        repo: 'origami-dsl/origami',
        editLinks: true,
        editLinkText: 'Edit this page on GitHub',
        lastUpdated: 'Last updated',
        sidebar: [
            ['/', 'Start'],
            ['specification', 'Specification'],
            {
                title: 'Syntax',
                collapsable: true,
                children: [
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


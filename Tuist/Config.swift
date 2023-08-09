import ProjectDescription

let config = Config(
    plugins: [
        .local(path: .relativeToRoot("Plugins/HampPlugin"))
    ]

    /*
     Remote에서 가져오려면 url과 tag 또는 sha(commit)으로 가져올 수 있습니다.
     url과 tag 또는 sha(commit)으로 가져올 수 있습니다.
     .git(url: "https://url/to/TuistPlugin", tag: "1.0.0")
     */
)

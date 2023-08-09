import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "TuistSample",
    platform: .iOS,
    product: .app,
    dependencies: [
        .Projcet.Feature
    ],
    resources: ["Resources/**"],
    infoPlist: .file(path: "Support/Info.plist") // info.plist는 자동완성 되지 않기 때문에 미리 생성한 후 해당 경로를 넣어줌
)


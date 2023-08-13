import ProjectDescription

public extension Project {
    static func makeModule(
        name: String, // 모듈이름
        platform: Platform = .iOS, // 플랫폼
        product: Product, // app, appClips, staticFramework, framework, unitTest
        organizationName: String = "Hamp", //organ 이름
        packages: [Package] = [], // Xcode의 SPM
        deploymentTarget: DeploymentTarget? = .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]), // 배포타겟을 설정
        dependencies: [TargetDependency] = [], // Target의 의존성에 대한 것입니다. 라이브러리나 다른 모듈을 의존성으로 넣을 때 씁니다.
        sources: SourceFilesList = ["Sources/**"], //소스 코드의 경로
        resources: ResourceFileElements? = nil, // 리소스들이 어디에 있는지에 대한 경로입니다
        infoPlist: InfoPlist = .default, // Info.plist를 정의합니다. 기본으로 제공되는 것을 쓸 수도 있고 key 값에 따라 value를 넣어주면 커스텀으로 추가적으로 값을 넣어줄 수 있습니다. 또는 미리 Info.plist를 넣어놓고 경로를 줄 수도 있습니다.
        scripts: [TargetScript] = [.SwiftLintShell]
    ) -> Project {
        let settings: Settings = .settings(
            base: [:],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ], defaultSettings: .recommended)
        //  defaultSettings은 .recommended로 했는데 혹시 xcconfig를 쓴다면 .none으로 해놓는게 편할 수도 있습니다.

        let appTarget = Target(
            name: name,
            platform: platform,
            product: product,
            bundleId: "\(organizationName).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            scripts: scripts,
            dependencies: dependencies
        )

        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "\(organizationName).\(name)Tests",
            deploymentTarget: deploymentTarget,
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [.target(name: name)]
        )

        let schemes: [Scheme] = [.makeScheme(target: .debug, name: name)]

        let targets: [Target] = [appTarget, testTarget]

        return Project(
            name: name,
            organizationName: organizationName,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes
        )
    }
}

extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
}

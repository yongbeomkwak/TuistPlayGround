// Tuist/Dependencies.swift 에 파일이 위치 해 있어야 작동합니다.
//Tuist의 Dependencies에서 SwiftPackageManager를 사용하는 방법입니다. Xcode의 SPM은 Package를 직접 사용하는데,
//Tuist는 Package를 resolve하고 framework로 구성해서 쓰는 방식입니다.
//Dependencies의 SPM에 Package를 추가(Local 또는 Remote) 하고 dependencies에서 .external로 등록합니다.

import ProjectDescription


let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: SwiftPackageManagerDependencies([
        .remote(url: "https://github.com/ReactiveX/RxSwift.git",requirement: .upToNextMajor(from: "6.5.0"))
    ],
    baseSettings: .settings(
        configurations: [
            .debug(name: .debug),
            .release(name: .release)
        ]
    )),
    
    platforms: [.iOS]
)



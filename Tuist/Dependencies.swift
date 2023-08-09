// Tuist/Dependencies.swift 에 파일이 위치 해 있어야 작동합니다.
//Tuist의 Dependencies에서 SwiftPackageManager를 사용하는 방법입니다. Xcode의 SPM은 Package를 직접 사용하는데,
//Tuist는 Package를 resolve하고 framework로 구성해서 쓰는 방식입니다.
//Dependencies의 SPM에 Package를 추가(Local 또는 Remote) 하고 dependencies에서 .external로 등록합니다.

import ProjectDescription
import HampPlugin

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: SwiftPackageManagerDependencies([
        .remote(url: "https://github.com/ReactiveX/RxSwift.git",requirement: .upToNextMajor(from: "6.5.0")),
        .remote(url: "https://github.com/airbnb/lottie-ios.git", requirement: .upToNextMajor(from: "3.5.0")),
        .remote(url: "https://github.com/uber/needle.git", requirement: .upToNextMajor(from: "0.19.0")),
        .remote(url: "https://github.com/Moya/Moya.git", requirement: .upToNextMajor(from: "15.0.3")),
        .remote(url: "https://github.com/Quick/Nimble.git", requirement: .upToNextMajor(from: "10.0.0")),
        .remote(url: "https://github.com/Quick/Quick.git", requirement: .upToNextMajor(from: "5.0.0"))
    ],
    baseSettings: .settings(
        configurations: [
            .debug(name: .dev),
            .debug(name: .stage),
            .release(name: .prod)
        ]
    )),
    
    platforms: [.iOS]
)



import ProjectDescription

public extension TargetDependency {
    enum Framework {}
}

extension TargetDependency.Framework {
    static let RxSwift = TargetDependency.framework(path: "Framework/RxSwift.framework")
}

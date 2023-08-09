import ProjectDescription

public extension TargetDependency {
    enum Carthage {}
}

public extension TargetDependency.Carthage {
    static let RxSwift = TargetDependency.external(name: "RxSwift")
}

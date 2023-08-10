import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Test", // --name Attribute로 받은 값
    product: .staticLibrary
)

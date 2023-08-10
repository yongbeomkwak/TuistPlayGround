//
//  HampTemplate.swift
//  ProjectDescriptionHelpers
//
//  Created by yongbeomkwak on 2023/08/10.
//

import ProjectDescription

// tuist scaffold hampTemplate  --name 이름값 , --<attribute명> <값>

let nameAttribute = Template.Attribute.required("name")

let template = Template(
    description: "A template for new module",
       attributes: [
           nameAttribute,
       ],
    items: [
            .string(
                path: "Source.swift",
                contents: "// Source contents of name \(nameAttribute)"
            ),
            .file(
                path: "Project.swift",
                templatePath: "project.stencil"
            ),
            .directory(
                path: "destination",
                sourcePath: "source"
            )
        ]
)
/*
 description: 템플릿의 설명입니다. 평소에는 딱히 볼일은 없긴하지만 tuist scaffold list를 하면 표시됩니다.
 attributes: scaffold 커맨드가 실행될때 받을 attribute리스트를 넣으면 됩니다.
 items: 여기에 넣어준 아이템을 기반으로 결과물이 나옵니다. 타입은 string, file, directory 3종류를 만들어 낼 수 있습니다.

 
 directory는 그냥 보면 디렉토리를 만드는건가, 싶지만 사실 디렉토리는 만드는 것이 아니라 sourcePath의 디렉토리를 내용물채로 복사해서 옮겨줍니다.
 파일을 만드는것은 string과 file이 있는데 이 둘의 차이는 string은 직접 문자열 "" 안에 내용물을 작성하는 것이고, file은 stencil 이라고하는 Swift를
 위한 템플릿 언어를 사용하여 만드는 것입니다.
 
 */

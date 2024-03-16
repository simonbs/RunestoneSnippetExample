// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Languages",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "RunestoneJavaScriptLanguage", targets: ["RunestoneJavaScriptLanguage"])
    ],
    dependencies: [
        .package(url: "https://github.com/simonbs/Runestone", branch: "feature/stringsyntaxhighlighter")
    ],
    targets: [
        .target(
            name: "RunestoneJavaScriptLanguage",
            dependencies: [
                "TreeSitterJavaScript",
                "Runestone"
            ],
            resources: [
                .copy("highlights.scm"),
                .copy("injections.scm")
            ]
        ),
        .target(name: "TreeSitterJavaScript", cSettings: [.headerSearchPath("src")])
    ]
)

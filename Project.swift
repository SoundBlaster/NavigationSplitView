import ProjectDescription

let project = Project(
    name: "NavigationSplitViewKit",
    targets: [
        .target(
            name: "NavigationSplitViewKit",
            destinations: [.iPhone, .iPad, .mac],
            product: .framework,
            bundleId: "com.example.NavigationSplitViewKit",
            deploymentTargets: .multiplatform(
                iOS: "17.0",
                macOS: "14.0"
            ),
            infoPlist: .default,
            sources: ["Sources/NavigationSplitViewKit/**"],
            resources: [],
            dependencies: []
        ),
        .target(
            name: "NavigationSplitViewKitTests",
            destinations: [.iPhone, .iPad, .mac],
            product: .unitTests,
            bundleId: "com.example.NavigationSplitViewKitTests",
            deploymentTargets: .multiplatform(
                iOS: "17.0",
                macOS: "14.0"
            ),
            infoPlist: .default,
            sources: ["Tests/NavigationSplitViewKitTests/**"],
            dependencies: [
                .target(name: "NavigationSplitViewKit")
            ]
        ),
    ]
)

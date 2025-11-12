import ProjectDescription

let project = Project(
    name: "NavigationSplitViewDemo",
    targets: [
        .target(
            name: "NavigationSplitViewDemo",
            destinations: [.iPhone, .iPad, .mac],
            product: .app,
            bundleId: "com.example.NavigationSplitViewDemo",
            deploymentTargets: .multiplatform(
                iOS: "17.0",
                macOS: "14.0"
            ),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [:],
                    "UISupportedInterfaceOrientations": [
                        "UIInterfaceOrientationPortrait",
                        "UIInterfaceOrientationLandscapeLeft",
                        "UIInterfaceOrientationLandscapeRight",
                    ],
                    "UISupportedInterfaceOrientations~ipad": [
                        "UIInterfaceOrientationPortrait",
                        "UIInterfaceOrientationPortraitUpsideDown",
                        "UIInterfaceOrientationLandscapeLeft",
                        "UIInterfaceOrientationLandscapeRight",
                    ],
                ]
            ),
            sources: ["NavigationSplitViewDemo/**"],
            resources: ["NavigationSplitViewDemo/Assets.xcassets"],
            dependencies: [
                .project(target: "NavigationSplitViewKit", path: "..")
            ]
        )
    ]
)

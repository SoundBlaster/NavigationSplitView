@Metadata {
    @Title("NavigationSplitView Repository Overview")
}

# NavigationSplitViewOverview

Explore the sample code contained in the NavigationSplitView repository and learn how each component contributes to a responsive, multi-column SwiftUI experience. The project demonstrates:

- Modeling data with identifiable domain types and sample fixtures.
- Managing navigation state with `@State` and `@Binding` to keep selections in sync.
- Presenting sidebars, content views, and inspectors that adapt gracefully across iPadOS, macOS, and iOS.
- Customizing layouts with `NavigationSplitView` modifiers such as `columnVisibility` and `detail` to refine the experience.

## Getting Started

1. Open the **XcodeProject/NewNav.xcodeproj** workspace in Xcode 15 or newer.
2. Build and run the **NewNav** target on an iPad, Mac, or visionOS simulator to inspect the baseline behavior.
3. Browse the SwiftUI views inside **XcodeProject/NewNav/NewNav** to see how the models, view models, and views cooperate to populate the split view columns.

## Related Tutorials

To learn how to introduce a similar setup into your own project, follow the ``NavigationSplitViewImplementation`` tutorial bundled with this documentation.

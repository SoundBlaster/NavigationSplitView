# Adapting to Window Sizes

`NavigationSplitView` supports navigation across compact and wide scenes. The same app can run in a folded or unfolded phone layout, an iPad multitasking window, or a resizable Mac window, so base layout decisions on the space available to the view.

## Let the split view adapt

Use the system's column behavior first. Bind `preferredCompactColumn` when the app needs a stable choice for the visible column in compact navigation. `columnVisibility` controls regular split layouts and does not replace compact navigation state.

```swift
@State private var navigationModel = NavigationModel()

var body: some View {
    @Bindable var model = navigationModel

    NavigationSplitView(
        columnVisibility: $model.columnVisibility,
        preferredCompactColumn: $model.preferredCompactColumn
    ) {
        sidebar
            .navigationSplitViewColumnWidth(min: 180, ideal: 240, max: 320)
    } content: {
        content
    } detail: {
        detail
    }
}
```

## Read the right size signal

`horizontalSizeClass` is useful for broad compact and regular navigation changes. It is not a direct measurement of a Mac window: macOS reports a regular horizontal size class even when a window becomes narrow. When one pane needs a different composition at a particular width, make that decision from the pane's local proposed size with a tool such as `ViewThatFits` or `GeometryReader`.

If an environment value is unavailable, choose a useful fallback layout. Do not substitute device idiom, screen size, or orientation when the real question is how much room the current view has.

## Preserve the user's place

Keep navigation state with the window. Reconcile a selected child when its parent changes or the item is removed, but retain a valid selection as the scene collapses and expands. Avoid opening or closing an inspector solely because the size class changed; let the user control optional secondary content and keep the main task available without it.

## Check representative windows

- iPhone folded and unfolded layouts
- iPad narrow and wide windows, multitasking, and rotation
- Mac narrow and wide windows with user-resizable columns
- Empty selections, Dynamic Type, and accessibility in the layouts that changed

The current public SwiftUI navigation guidance centers on adaptive scene and container size. Check current SDK documentation before relying on any device-specific fold posture or hinge API.

## References

- [NavigationSplitView](https://developer.apple.com/documentation/SwiftUI/NavigationSplitView)
- [Horizontal size class](https://developer.apple.com/documentation/SwiftUI/EnvironmentValues/horizontalSizeClass)
- [Human Interface Guidelines: Split Views](https://developer.apple.com/design/human-interface-guidelines/split-views)
- [Technical Note 3192: Migrating from `UIRequiresFullScreen`](https://developer.apple.com/documentation/technotes/tn3192-migrating-your-app-from-the-deprecated-uirequiresfullscreen-ui)

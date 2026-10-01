---
name: navigationsplitview-swiftui
description: Design, implement, or debug adaptive SwiftUI NavigationSplitView interfaces for iPhone, iPad, Mac, and resizable or foldable-device windows. Use for split navigation, synchronized selections, compact-column behavior, and inspectors; general SwiftUI screens without split navigation are out of scope.
---

# SwiftUI NavigationSplitView

Use this skill for sidebar/content/detail navigation that must remain useful as a scene or window changes size. The repository is an example implementation, not a mandatory dependency: recommend `NavigationSplitViewKit` only when its API and platform requirements fit the host project.

## Inspect the host project

- Read the navigation entry point, selection model, scene ownership, and deployment targets before changing state or API availability.
- Check current Apple documentation when behavior depends on an OS release. Do not infer availability from this repository's package minimums (iOS 17 and macOS 14).
- For this repository's implementation, consult `Sources/NavigationSplitViewKit/Models/NavigationModel.swift`, `XcodeProject/NewNav/ContentView.swift`, and the DocC article [Adapting to window sizes](../../../../Sources/NavigationSplitViewKit/NavigationSplitViewKit.docc/AdaptiveWindowSizes.md).

## Adapt to available space

- Prefer `NavigationSplitView`'s native column collapsing and platform behavior. In compact contexts it can present columns as a navigation stack; bind `preferredCompactColumn` when the app needs to preserve or control which column appears in that stack.
- Use `@Environment(\.horizontalSizeClass)` in a `View` for broad compact/regular composition changes. Handle a missing size class with an intentional fallback; never return an empty screen just because the value is `nil`.
- A size class is not a window-width measurement. In particular, macOS reports a regular horizontal size class at narrow and wide window widths. When an individual pane must change composition at a width threshold, measure that pane's proposed space with a local layout tool such as `ViewThatFits` or `GeometryReader` and choose a threshold appropriate to its content.
- Give sidebar and content columns sensible minimum, ideal, and maximum widths with `navigationSplitViewColumnWidth` when useful. Let people resize or hide panes and keep the detail view usable when adjacent panes are hidden.
- Do not branch layout on device idiom or orientation when the actual decision concerns available space. Avoid `UIDevice.current.userInterfaceIdiom`, screen dimensions, and assumptions that folded and unfolded states map to fixed device categories.
- Treat iPhone Duo and other foldable states as changing available scene space. Do not assume a public hinge/posture API; verify the current SDK documentation before using any device-specific API.

When a request is specifically to enable iOS 27 scene resizing, inspect the target's launch-screen configuration, supported iPad orientations, and `UIRequiresFullScreen` settings before changing project configuration. Do not remove or add a full-screen compatibility key as a side effect of a layout fix; verify resizing by running the app and changing its window size.

## Keep navigation state stable

- Keep selection, column visibility, preferred compact column, and inspector presentation state with the relevant scene/window. Avoid a process-global model when multiple windows need independent navigation.
- Reconcile a child selection when its parent changes or the selected item disappears. Do not clear valid selection merely because the scene became compact or expanded; preserving it lets the layout transition continue the user's current task.
- Make empty and invalid selection states explicit in the detail UI instead of force-unwrapping navigation state.
- Use typed, stable navigation values and value-based `NavigationLink`/`List(selection:)` bindings where selection should be visible.
- Treat an inspector as optional secondary content. Keep its toggle accessible, retain the user's presentation preference across resizing, and ensure the primary workflow remains complete when the inspector is hidden or unavailable.

## Verify a layout change

Review the actual target platforms and provide a representative matrix for the requested change:

| Platform/context | Check |
|---|---|
| iPhone, including Duo folded | Compact navigation, back path, and retained selection |
| iPhone Duo unfolded | Wider composition without device-idiom assumptions |
| iPad | Narrow and wide windows, multitasking, rotation, and pane visibility |
| Mac | Narrow and wide resizable windows, column resizing, and inspector behavior |

Also consider Dynamic Type, accessibility labels, empty data, and restoration when they affect the changed views. A successful build does not establish that every window size works; use previews or simulator/device runs when visual behavior is part of the task.

## Repository example

The package supports iOS 17 and macOS 14, but a host app can have different deployment targets. Preserve the host's architecture, deep links, restoration, and window model. Avoid copying the example wholesale when those contracts differ.

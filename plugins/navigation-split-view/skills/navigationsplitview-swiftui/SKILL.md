---
name: navigationsplitview-swiftui
description: Design, implement, or debug SwiftUI interfaces built around NavigationSplitView, including synchronized column selections, compact and regular layouts, and inspectors. Use for multi-column navigation work; general SwiftUI screens without split navigation are out of scope.
---

# SwiftUI NavigationSplitView

Use this skill when a task involves a sidebar/content/detail flow, adaptive split-view behavior, or an inspector connected to that flow. Ground recommendations in the target app's deployment targets and existing navigation model. The repository hosting this skill is an example implementation, not a mandatory dependency: recommend `NavigationSplitViewKit` only when its API and platform requirements fit the project.

## Start from the target project

- Inspect the existing navigation entry point, model identity, deployment targets, and whether the app supports multiple windows before changing its state model.
- Check the current Apple API documentation when behavior depends on OS version; SwiftUI navigation behavior and available modifiers vary by platform and release.
- For this repository's implementation details, consult `Sources/NavigationSplitViewKit/Models/NavigationModel.swift`, `XcodeProject/NewNav/ContentView.swift`, and the DocC tutorial at `Sources/NavigationSplitViewKit/NavigationSplitViewKit.docc/NavigationSplitViewImplementation.tutorial`.
- The package currently declares iOS 17 and macOS 14 minimums. Do not transfer that constraint to a host app unless it chooses to depend on the package.

## State and selection

- Keep each selection typed to its model and make navigation values stable and identifiable. Prefer value-based `NavigationLink` and `List(selection:)` bindings where the user should see a selected row.
- Keep selection and column visibility in state owned by the relevant scene/window. With Observation, a `@State`-owned `@Observable` model can expose bindings through a local `@Bindable` in `body`; use the host project's existing state approach when it differs.
- When a parent selection changes, reconcile child selections against the new parent's contents. Clear stale child selections or choose a valid default according to the product's compact/regular navigation behavior.
- Make empty and invalid selection states explicit in the detail UI rather than force-unwrapping navigation state.

## Adaptation and inspector

- Treat compact and regular layouts as different navigation experiences, not merely narrower versions of the same three visible columns. In the repository example, regular width can show a selected child in the detail column; compact width clears that selection and pushes a destination from the content list.
- Read the horizontal size class from the environment and react to changes, including rotation and window resizing. Account for an unavailable size class instead of assuming it is always compact or regular.
- Use the system `.inspector(isPresented:)` when the secondary information belongs in an inspector. Connect its visibility to the navigation state, provide an accessible toolbar control, and ensure the content remains useful when the inspector is hidden or unavailable on a compact device.
- Prefer native `NavigationSplitView` column behavior and platform conventions before introducing custom width/visibility rules.

## Implement and review

1. Map the sidebar, content, and detail responsibilities and list the valid selection transitions.
2. Bind selection and column visibility at the split-view boundary; keep child views focused on rendering their input and emitting user intent.
3. Define compact navigation and empty-selection behavior explicitly, then connect any inspector to the same scene-level state.
4. Review each supported platform and size class for stale selections, back navigation, empty data, and inspector dismissal. Use previews or a simulator when visual behavior is part of the request.

Avoid copying the sample wholesale when the host app uses a different navigation architecture, older deployment targets, deep links, restoration, or document-based state. Preserve those existing contracts and adapt only the relevant pattern.

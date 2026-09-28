import Observation
import SwiftUI

/// Centralizes selection, column visibility, and inspector state so the split view can
/// remain synchronized across size classes and windows.
@Observable
public final class NavigationModel {
    public var selectedCategory: CustomColorCategory?
    public var selectedColor: CustomColor?
    public var columnVisibility: NavigationSplitViewVisibility = .doubleColumn
    public var preferredCompactColumn: NavigationSplitViewColumn = .sidebar
    public var showInspector = false

    public init() {}

    public func bootstrap(
        using categories: [CustomColorCategory], sizeClass: UserInterfaceSizeClass?
    ) {
        guard selectedCategory == nil else { return }
        selectedCategory = categories.first
        syncSelection(for: sizeClass)
        showInspector = sizeClass == .regular
    }

    public func handleCategoryChange(sizeClass: UserInterfaceSizeClass?) {
        syncSelection(for: sizeClass)
    }

    public func handleSizeClassChange(_ sizeClass: UserInterfaceSizeClass?) {
        // Keep the current selection and inspector preference while the system
        // collapses or expands the split view. Reconcile only when regular
        // space becomes available and there is no valid child selection.
        guard sizeClass == .regular else { return }
        syncSelection(for: sizeClass)
    }

    private func syncSelection(for sizeClass: UserInterfaceSizeClass?) {
        guard let category = selectedCategory else {
            selectedColor = nil
            return
        }

        if let selection = selectedColor, category.colors.contains(selection) {
            return
        }

        guard sizeClass != .compact else {
            selectedColor = nil
            return
        }

        selectedColor = category.colors.first
    }
}

import SwiftUI
import Observation

/// Centralizes selection, column visibility, and inspector state so the split view can
/// remain synchronized across size classes and windows.
@Observable
final class NavigationModel {
    var selectedCategory: CustomColorCategory?
    var selectedColor: CustomColor?
    var columnVisibility: NavigationSplitViewVisibility = .doubleColumn
    var preferredCompactColumn: NavigationSplitViewColumn = .sidebar
    var showInspector = false

    func bootstrap(using categories: [CustomColorCategory], sizeClass: UserInterfaceSizeClass?) {
        guard selectedCategory == nil else { return }
        selectedCategory = categories.first
        syncSelection(for: sizeClass)
        showInspector = sizeClass == .regular
    }

    func handleCategoryChange(sizeClass: UserInterfaceSizeClass?) {
        syncSelection(for: sizeClass)
    }

    func handleSizeClassChange(_ sizeClass: UserInterfaceSizeClass?) {
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

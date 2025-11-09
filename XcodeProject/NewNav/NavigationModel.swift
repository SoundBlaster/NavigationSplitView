import SwiftUI
import Observation

/// Centralizes selection, column visibility, and inspector state so the split view can
/// remain synchronized across size classes and windows.
@Observable
final class NavigationModel {
    var selectedCategory: CustomColorCategory?
    var selectedColor: CustomColor?
    var columnVisibility: NavigationSplitViewVisibility = .doubleColumn
    var showInspector = false

    func bootstrap(using categories: [CustomColorCategory], sizeClass: UserInterfaceSizeClass?) {
        guard selectedCategory == nil else { return }
        selectedCategory = categories.first
        syncSelection(for: sizeClass)
        showInspector = sizeClass != .compact
    }

    func handleCategoryChange(sizeClass: UserInterfaceSizeClass?) {
        syncSelection(for: sizeClass)
    }

    func handleSizeClassChange(_ sizeClass: UserInterfaceSizeClass?) {
        showInspector = sizeClass != .compact
        syncSelection(for: sizeClass)
    }

    private func syncSelection(for sizeClass: UserInterfaceSizeClass?) {
        guard sizeClass != .compact else {
            selectedColor = nil
            return
        }

        guard let category = selectedCategory else {
            selectedColor = nil
            return
        }

        if let selection = selectedColor, category.colors.contains(selection) {
            return
        }

        selectedColor = category.colors.first
    }
}

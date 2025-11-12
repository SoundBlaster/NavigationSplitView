import SwiftUI
import Observation

@Observable
final class NavigationModel {
    var selectedCategory: CustomColorCategory?
    var selectedColor: CustomColor?
    var columnVisibility: NavigationSplitViewVisibility = .doubleColumn
    var showInspector = false

    func bootstrap(with categories: [CustomColorCategory]) {
        selectedCategory = categories.first
        selectedColor = categories.first?.colors.first
        showInspector = true
    }
}

import SwiftUI

final class NavigationModel: ObservableObject {
    @Published var selectedCategory: CustomColorCategory?
    @Published var selectedColor: CustomColor?
    @Published var columnVisibility: NavigationSplitViewVisibility = .doubleColumn
    @Published var showInspector = false

    func bootstrap(with categories: [CustomColorCategory]) {
        selectedCategory = categories.first
        selectedColor = categories.first?.colors.first
        showInspector = true
    }
}

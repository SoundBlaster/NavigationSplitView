import SwiftUI

/// Displays a category of colors with appropriate layout based on size class.
public struct CategoryView: View {

    public var category: CustomColorCategory?
    @Binding public var selection: CustomColor?

    public init(category: CustomColorCategory?, selection: Binding<CustomColor?>) {
        self.category = category
        self._selection = selection
    }

    public var body: some View {
        SizeClassAdaptiveView {
            ColorsSelectionList(
                colors: category?.colors ?? [],
                selection: $selection
            )
        } compact: {
            ColorsSelectionList(colors: category?.colors ?? [], selection: $selection)
                .navigationDestination(for: CustomColor.self) { color in
                    DetailView(color: .constant(color))
                }
        }
        .navigationTitle(category?.name ?? "")
    }
}

#Preview {
    let category = CustomColorCategory(colors: [CustomColor.red], name: "Red")
    return CategoryView(
        category: category,
        selection: .constant(CustomColor.red)
    )
}

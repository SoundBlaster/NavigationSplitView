import SwiftUI

struct CategoryView: View {
    
    var category: CustomColorCategory?
    @Binding var selection: CustomColor?
    
    var body: some View {
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
        .navigationSplitViewColumnWidth(min: 220, ideal: 280, max: 360)
    }
    
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let category = CustomColorCategory(colors: [CustomColor.red], name: "Red")
            CategoryView(
                category: category,
                selection: .constant(CustomColor.red)
            )
        }
        .previewLayout(.fixed(width: 375, height: 600))
    }
}

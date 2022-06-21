import SwiftUI

struct CategoryView: View {
    
    let horizontalSizeClass: UserInterfaceSizeClass?
    var category: CustomColorCategory?
    @Binding var selection: CustomColor?
    
    var body: some View {
        SizeClassAdaptiveView(sizeClass: horizontalSizeClass) {
            ColorsSelectionList(colors: category?.colors ?? [],
                                selection: $selection,
                                useSelection: true)
        } compact: {
            ColorsSelectionList(colors: category?.colors ?? [])
                .navigationDestination(for: CustomColor.self) { color in
                    DetailView(color: color)
                }
        }
        .navigationTitle(category?.name ?? "")
    }
    
}
struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let category = CustomColorCategory(colors: [CustomColor.red], name: "Red")
            CategoryView(horizontalSizeClass: .regular,
                category: category,
                selection: .constant(CustomColor.red))
        }
        .previewLayout(.fixed(width: 375, height: 600))
    }
}

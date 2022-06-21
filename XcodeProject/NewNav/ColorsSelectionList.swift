import SwiftUI

struct ColorsSelectionList: View {
    
    let colors: [CustomColor]
    @Binding var selection: CustomColor?
    let useSelection: Bool
    
    init(colors: [CustomColor],
         selection: Binding<CustomColor?>? = nil,
         useSelection: Bool = false) {
        self.colors = colors
        self._selection = selection ?? .constant(nil)
        self.useSelection = useSelection
    }
    
    var body: some View {
        if useSelection {
            List(colors, selection: $selection) { row($0) }
        } else {
            List(colors) { row($0) }
        }
    }
    
    @ViewBuilder
    private func row(_ color: CustomColor) -> some View {
        NavigationLink(value: color) {
            HStack {
                Rectangle()
                    .fill(color.color)
                    .frame(width: 20, height: 20)
                Text(color.name)
            }
        }
    }
}

struct ColorsSelectionList_Previews: PreviewProvider {
    static var previews: some View {
        ColorsSelectionList(colors: [.red, .green, .blue],
                            selection: .constant(nil),
                            useSelection: true)
        .previewLayout(.fixed(width: 375, height: 600))
    }
}

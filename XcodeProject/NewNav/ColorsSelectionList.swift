import SwiftUI

struct ColorsSelectionList: View {
    
    let colors: [CustomColor]
    @Binding var selection: CustomColor?
    
    init(colors: [CustomColor],
         selection: Binding<CustomColor?>) {
        self.colors = colors
        self._selection = selection
    }
    
    var body: some View {
        List(colors, selection: $selection) { color in
            NavigationLink(value: color) {
                rowContent(color)
            }
        }
    }
    
    @ViewBuilder
    private func rowContent(_ color: CustomColor) -> some View {
        HStack {
            Rectangle()
                .fill(color.color)
                .frame(width: 20, height: 20)
            Text(color.name)
        }
    }
}

struct ColorsSelectionList_Previews: PreviewProvider {
    static var previews: some View {
        ColorsSelectionList(colors: [.red, .green, .blue],
                            selection: .constant(.red)
        )
        .previewLayout(.fixed(width: 375, height: 600))
    }
}

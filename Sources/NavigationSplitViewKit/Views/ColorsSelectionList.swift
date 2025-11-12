import SwiftUI

/// A list view that displays colors with selection support.
public struct ColorsSelectionList: View {

    public let colors: [CustomColor]
    @Binding public var selection: CustomColor?

    public init(
        colors: [CustomColor],
        selection: Binding<CustomColor?>
    ) {
        self.colors = colors
        self._selection = selection
    }

    public var body: some View {
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

#Preview {
    ColorsSelectionList(
        colors: [.red, .green, .blue],
        selection: .constant(.red)
    )
}

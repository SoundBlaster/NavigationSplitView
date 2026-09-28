import SwiftUI

/// Displays detailed information about a selected color.
public struct DetailView: View {

    @Binding public var color: CustomColor?

    public init(color: Binding<CustomColor?>) {
        self._color = color
    }

    public var body: some View {
        VStack {
            if let color {
                Rectangle()
                    .fill(color.color)
                    .aspectRatio(1, contentMode: .fit)
                    .frame(maxWidth: 240)
                Text(color.name)
            } else {
                ColorPlaceholder()
            }
        }
        .navigationTitle(color?.name ?? "")
    }
}

#Preview {
    DetailView(color: .constant(CustomColor.red))
}

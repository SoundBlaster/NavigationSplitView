import SwiftUI

/// A view that adapts its content based on the horizontal size class.
public struct SizeClassAdaptiveView<RegularContent: View, CompactContent: View>: View {

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    let regular: () -> RegularContent
    let compact: () -> CompactContent

    public init(
        @ViewBuilder regular: @escaping () -> RegularContent,
        @ViewBuilder compact: @escaping () -> CompactContent
    ) {
        self.regular = regular
        self.compact = compact
    }

    public var body: some View {
        Group {
            if horizontalSizeClass == nil {
                EmptyView()
            } else if horizontalSizeClass == .regular {
                regular()
            } else {
                compact()
            }
        }
    }
}

#Preview {
    SizeClassAdaptiveView {
        Text("Regular")
    } compact: {
        Text("Compact")
    }
}

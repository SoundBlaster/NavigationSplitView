import SwiftUI

struct SizeClassAdaptiveView<RegularContent: View, CompactContent: View>: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    let regular: () -> RegularContent
    let compact: () -> CompactContent
    
    init(@ViewBuilder regular: @escaping () -> RegularContent,
         @ViewBuilder compact: @escaping () -> CompactContent) {
        self.regular = regular
        self.compact = compact
    }
    
    var body: some View {
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
struct HorizontalSizeClassAdaptiveView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SizeClassAdaptiveView {
                Text("Regular")
            } compact: {
                Text("Compact")
            }
            SizeClassAdaptiveView {
                Text("Regular")
            } compact: {
                Text("Compact")
            }
        }
        .previewLayout(.fixed(width: 375, height: 600))
    }
}

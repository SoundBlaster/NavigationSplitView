import SwiftUI

struct SizeClassAdaptiveView<RegularContent: View, CompactContent: View>: View {
    private let id = UUID()
    
    let sizeClass: UserInterfaceSizeClass?
    let regular: () -> RegularContent
    let compact: () -> CompactContent
    
    init(sizeClass: UserInterfaceSizeClass? = nil,
         @ViewBuilder regular: @escaping () -> RegularContent,
         @ViewBuilder compact: @escaping () -> CompactContent) {
        self.sizeClass = sizeClass
        self.regular = regular
        self.compact = compact
    }
    
    var body: some View {
        Group {
            if sizeClass == nil {
                EmptyView()
            } else if sizeClass == .regular {
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
            SizeClassAdaptiveView(sizeClass: .regular) {
                Text("Regular")
            } compact: {
                Text("Compact")
            }
            SizeClassAdaptiveView(sizeClass: .compact) {
                Text("Regular")
            } compact: {
                Text("Compact")
            }
        }
        .previewLayout(.fixed(width: 375, height: 600))
    }
}

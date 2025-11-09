import SwiftUI
#if os(iOS)
import UIKit
#endif

struct InspectorPanel: View {
    let color: CustomColor?
    var onDismiss: (() -> Void)?

    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            if let onDismiss, shouldShowCloseButton {
                Button {
                    onDismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .accessibilityLabel("Close Inspector")
                }
                .padding([.top, .trailing], 12)
            }

            if let color {
                ScrollView {
                    // Inspector content
                }
            } else {
                ColorPlaceholder()
            }
        }
    }

    private var shouldShowCloseButton: Bool {
        #if os(iOS)
        return UIDevice.current.userInterfaceIdiom == .phone && horizontalSizeClass == .regular
        #else
        return false
        #endif
    }
}

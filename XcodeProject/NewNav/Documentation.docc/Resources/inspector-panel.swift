import SwiftUI

struct InspectorPanel: View {
    let color: CustomColor?
    var onDismiss: (() -> Void)?

    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            if let onDismiss {
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

}

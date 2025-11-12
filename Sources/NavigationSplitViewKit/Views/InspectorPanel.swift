import SwiftUI

#if os(iOS)
    import UIKit
#endif

/// A placeholder view shown when no color is selected.
public struct ColorPlaceholder: View {
    public init() {}

    public var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "eye.slash")
                .font(.system(size: 32))
                .foregroundColor(.secondary)

            Text("No Color Selected")
                .font(.headline)

            Text("Select a color from the list to see its properties")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

/// An inspector panel that displays detailed information about a color.
public struct InspectorPanel: View {

    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    public let color: CustomColor?
    public var onDismiss: (() -> Void)? = nil

    public init(color: CustomColor?, onDismiss: (() -> Void)? = nil) {
        self.color = color
        self.onDismiss = onDismiss
    }

    public var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            if let onDismiss, shouldShowCloseButton {
                Button {
                    onDismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .symbolRenderingMode(.hierarchical)
                        .foregroundColor(.secondary)
                        .accessibilityLabel("Close Inspector")
                }
                .padding(.top, 12)
                .padding(.trailing, 12)
            }

            Group {
                if let color {
                    ScrollView {
                        inspectorContent(for: color)
                            .padding()
                    }
                } else {
                    ColorPlaceholder()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

    @ViewBuilder
    private func inspectorContent(for color: CustomColor) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Color Preview")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .textCase(.uppercase)
                    .foregroundColor(.secondary)

                HStack(spacing: 12) {
                    Rectangle()
                        .fill(color.color)
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(color.name)
                            .font(.body)
                            .fontWeight(.semibold)

                        Text("ID: \(color.id.uuidString.prefix(8))...")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }

            Divider()

            VStack(alignment: .leading, spacing: 12) {
                Text("Information")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .textCase(.uppercase)
                    .foregroundColor(.secondary)

                HStack {
                    Text("Name:")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(color.name)
                        .fontWeight(.semibold)
                }

                HStack {
                    Text("Type:")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("SwiftUI Color")
                        .fontWeight(.semibold)
                }
            }

            Spacer(minLength: 0)
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

#Preview("With Color") {
    InspectorPanel(color: CustomColor.red)
}

#Preview("No Color") {
    InspectorPanel(color: nil)
}

import SwiftUI

struct InspectorPanel: View {
    let color: CustomColor?

    var body: some View {
        if let color {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Color Preview Section
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

                    // Color Information Section
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

                    Spacer()
                }
                .padding()
            }
        } else {
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
}

struct InspectorPanel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InspectorPanel(color: CustomColor.red)
                .previewDisplayName("With Color")

            InspectorPanel(color: nil)
                .previewDisplayName("No Color Selected")
        }
        .previewLayout(.fixed(width: 300, height: 400))
    }
}

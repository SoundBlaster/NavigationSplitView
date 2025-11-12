import SwiftUI

/// A custom color representation with an identifier and name.
public struct CustomColor: Identifiable, Hashable {
    public var id = UUID()

    public let color: Color
    public let name: String

    public init(color: Color, name: String) {
        self.color = color
        self.name = name
    }

    public static let red = CustomColor(color: .red, name: "red")
    public static let blue = CustomColor(color: .blue, name: "blue")
    public static let green = CustomColor(color: .green, name: "green")
    public static let yellow = CustomColor(color: .yellow, name: "yellow")
    public static let cyan = CustomColor(color: .cyan, name: "cyan")
    public static let mint = CustomColor(color: .mint, name: "mint")
    public static let accent = CustomColor(color: .accentColor, name: "accent")
}

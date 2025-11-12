import Foundation

/// A category that groups multiple custom colors together.
public struct CustomColorCategory: Identifiable, Hashable, Equatable {
    public var id = UUID()

    public let colors: [CustomColor]
    public let name: String

    public init(colors: [CustomColor], name: String) {
        self.colors = colors
        self.name = name
    }
}

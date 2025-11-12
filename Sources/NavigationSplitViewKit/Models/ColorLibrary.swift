import Foundation

/// Provides sample color categories that feed the navigation hierarchy.
public struct ColorLibrary {
    public let categories: [CustomColorCategory]

    public init(
        categories: [CustomColorCategory] = [
            CustomColorCategory(
                colors: [
                    CustomColor.red,
                    CustomColor.blue,
                    CustomColor.yellow,
                ],
                name: "Common"
            ),
            CustomColorCategory(
                colors: [
                    CustomColor.cyan,
                    CustomColor.mint,
                    CustomColor.accent,
                ],
                name: "Specific"
            ),
        ]
    ) {
        self.categories = categories
    }
}

import Foundation

/// Provides sample color categories that feed the navigation hierarchy.
struct ColorLibrary {
    let categories: [CustomColorCategory]

    init(categories: [CustomColorCategory] = [
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
    ]) {
        self.categories = categories
    }
}

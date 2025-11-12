import XCTest

@testable import NavigationSplitViewKit

final class NavigationSplitViewKitTests: XCTestCase {

    func testCustomColorCreation() {
        let color = CustomColor(color: .red, name: "Test Red")
        XCTAssertEqual(color.name, "Test Red")
    }

    func testCustomColorCategoryCreation() {
        let colors = [CustomColor.red, CustomColor.blue]
        let category = CustomColorCategory(colors: colors, name: "Test Category")
        XCTAssertEqual(category.name, "Test Category")
        XCTAssertEqual(category.colors.count, 2)
    }

    func testColorLibraryDefaults() {
        let library = ColorLibrary()
        XCTAssertEqual(library.categories.count, 2)
        XCTAssertEqual(library.categories[0].name, "Common")
        XCTAssertEqual(library.categories[1].name, "Specific")
    }

    func testNavigationModelInitialization() {
        let model = NavigationModel()
        XCTAssertNil(model.selectedCategory)
        XCTAssertNil(model.selectedColor)
        XCTAssertFalse(model.showInspector)
    }

    func testNavigationModelBootstrap() {
        let model = NavigationModel()
        let library = ColorLibrary()

        model.bootstrap(using: library.categories, sizeClass: .regular)

        XCTAssertNotNil(model.selectedCategory)
        XCTAssertNotNil(model.selectedColor)
        XCTAssertTrue(model.showInspector)
    }
}

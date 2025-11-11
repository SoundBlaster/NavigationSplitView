import SwiftUI

struct AppContentView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State private var navigationModel = NavigationModel()
    private let library = ColorLibrary()

    var body: some View {
        @Bindable var model = navigationModel

        NavigationSplitView(columnVisibility: $model.columnVisibility) {
            List(library.categories, selection: $model.selectedCategory) { category in
                Text(category.name)
                    .tag(category)
            }
            .navigationTitle("Categories")
        } content: {
            CategoryView(
                category: model.selectedCategory,
                selection: $model.selectedColor
            )
        } detail: {
            DetailView(color: $model.selectedColor)
        }
        .inspector(isPresented: $model.showInspector) {
            InspectorPanel(color: model.selectedColor) {
                model.showInspector = false
            }
        }
        .task {
            model.bootstrap(using: library.categories, sizeClass: horizontalSizeClass)
        }
    }
}

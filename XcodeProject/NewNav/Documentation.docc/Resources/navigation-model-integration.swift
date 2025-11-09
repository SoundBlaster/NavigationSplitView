import SwiftUI

struct AppContentView: View {
    @StateObject private var navigationModel = NavigationModel()

    var body: some View {
        NavigationSplitView(columnVisibility: columnVisibilityBinding) {
            List(dataSource.colorsCategories, selection: selectedCategoryBinding) { category in
                Text(category.name)
                    .tag(category)
            }
            .navigationTitle("Categories")
        } content: {
            CategoryView(
                category: navigationModel.selectedCategory,
                selection: selectedColorBinding
            )
        } detail: {
            DetailView(color: selectedColorBinding)
        }
        .inspector(isPresented: inspectorBinding) {
            InspectorPanel(color: navigationModel.selectedColor)
        }
        .task {
            if navigationModel.selectedCategory == nil {
                navigationModel.bootstrap(with: dataSource.colorsCategories)
            }
        }
    }

    private var columnVisibilityBinding: Binding<NavigationSplitViewVisibility> {
        Binding(
            get: { navigationModel.columnVisibility },
            set: { navigationModel.columnVisibility = $0 }
        )
    }

    private var selectedCategoryBinding: Binding<CustomColorCategory?> {
        Binding(
            get: { navigationModel.selectedCategory },
            set: { navigationModel.selectedCategory = $0 }
        )
    }

    private var selectedColorBinding: Binding<CustomColor?> {
        Binding(
            get: { navigationModel.selectedColor },
            set: { navigationModel.selectedColor = $0 }
        )
    }

    private var inspectorBinding: Binding<Bool> {
        Binding(
            get: { navigationModel.showInspector },
            set: { navigationModel.showInspector = $0 }
        )
    }
}

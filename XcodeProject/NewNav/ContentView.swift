import SwiftUI

struct ContentView: View {

    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    private let library = ColorLibrary()
    @State private var navigationModel = NavigationModel()
    
    var body: some View {
        @Bindable var model = navigationModel
        
        NavigationSplitView(columnVisibility: $model.columnVisibility) {
            List(library.categories, selection: $model.selectedCategory) { category in
                NavigationLink(value: category) {
                    Text(category.name)
                }
            }
            .navigationTitle("Categories")
        } content: {
            CategoryView(
                category: model.selectedCategory,
                selection: $model.selectedColor
            )
        } detail: {
            DetailView(color: $model.selectedColor)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            model.showInspector.toggle()
                        } label: {
                            Label("Inspector", systemImage: "sidebar.right")
                        }
                    }
                }
        }
        .navigationSplitViewStyle(.automatic)
        .inspector(isPresented: $model.showInspector) {
            InspectorPanel(color: model.selectedColor) {
                model.showInspector = false
            }
        }
        .task {
            model.bootstrap(using: library.categories, sizeClass: horizontalSizeClass)
        }
        .onChange(of: horizontalSizeClass) { _, newValue in
            model.handleSizeClassChange(newValue)
        }
        .onChange(of: model.selectedCategory) { _, _ in
            model.handleCategoryChange(sizeClass: horizontalSizeClass)
        }
    }
}

#Preview(traits: .fixedLayout(width: 1024, height: 768)) {
    ContentView()
}

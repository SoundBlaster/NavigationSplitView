@State private var navigationModel = NavigationModel()
private let library = ColorLibrary()

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
    }
}

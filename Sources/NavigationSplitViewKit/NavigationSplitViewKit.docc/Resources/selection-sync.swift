@Environment(\.horizontalSizeClass) private var horizontalSizeClass
@State private var navigationModel = NavigationModel()

var body: some View {
    @Bindable var model = navigationModel

    // ...
    .onChange(of: model.selectedCategory) { _, _ in
        model.handleCategoryChange(sizeClass: horizontalSizeClass)
    }
}

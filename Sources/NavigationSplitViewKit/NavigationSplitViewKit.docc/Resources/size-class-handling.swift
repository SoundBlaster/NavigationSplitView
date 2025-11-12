@Environment(\.horizontalSizeClass) private var horizontalSizeClass
@State private var navigationModel = NavigationModel()
private let library = ColorLibrary()

var body: some View {
    @Bindable var model = navigationModel

    // ...
    .task {
        model.bootstrap(using: library.categories, sizeClass: horizontalSizeClass)
    }
    .onChange(of: horizontalSizeClass) { _, newValue in
        model.handleSizeClassChange(newValue)
    }
}

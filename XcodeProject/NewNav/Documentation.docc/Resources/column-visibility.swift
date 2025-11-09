@State private var navigationModel = NavigationModel()

var body: some View {
    @Bindable var model = navigationModel

    NavigationSplitView(columnVisibility: $model.columnVisibility) {
        // sidebar
    } content: {
        // content
    } detail: {
        // detail
    }
}

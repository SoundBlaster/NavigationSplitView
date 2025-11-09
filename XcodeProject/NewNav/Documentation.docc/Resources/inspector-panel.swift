@State private var navigationModel = NavigationModel()

var body: some View {
    @Bindable var model = navigationModel

    NavigationSplitView(columnVisibility: $model.columnVisibility) {
        // sidebar + content
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
    .inspector(isPresented: $model.showInspector) {
        InspectorPanel(color: model.selectedColor)
    }
}

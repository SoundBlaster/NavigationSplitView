@State private var showInspector = false

NavigationSplitView(columnVisibility: $columnVisibility) {
    // sidebar and content
} detail: {
    DetailView(color: $selectedColor)
}
.inspector(isPresented: $showInspector) {
    InspectorPanel(color: selectedColor)
}

@State private var columnVisibility = NavigationSplitViewVisibility.doubleColumn

Button("Show All Columns") {
    columnVisibility = .all
}
Button("Automatic") {
    columnVisibility = .automatic
}

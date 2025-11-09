@Environment(\.horizontalSizeClass) var horizontalSizeClass
@State private var showInspector = false

.onAppear {
    showInspector = horizontalSizeClass != .compact
}
.onChange(of: horizontalSizeClass) { _, newValue in
    showInspector = newValue != .compact
}

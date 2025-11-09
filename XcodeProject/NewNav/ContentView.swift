import SwiftUI

struct Data {
    var colorsCategories: [CustomColorCategory] = [
        CustomColorCategory(
            colors: [
                CustomColor.red,
                CustomColor.blue,
                CustomColor.yellow,
            ], name: "common"),
        CustomColorCategory(
            colors: [
                CustomColor.cyan,
                CustomColor.mint,
                CustomColor.accent,
            ], name: "specific"),
    ]
}

let dataSource = Data()

struct ContentView: View {

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State private var selectedCategory: CustomColorCategory? = dataSource.colorsCategories.first
    @State private var selectedColor: CustomColor? = dataSource.colorsCategories.first?.colors.first
    @State private var columnVisibility = NavigationSplitViewVisibility.doubleColumn
    @State private var pathCategory: NavigationPath = NavigationPath()
    @State private var pathColor: NavigationPath = NavigationPath()
    @State private var showInspector = false
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(dataSource.colorsCategories, selection: $selectedCategory) { category in
                NavigationLink(value: category) {
                    Text(category.name)
                }
            }
            .navigationTitle("Categories")
        } content: {
            CategoryView(
                category: selectedCategory,
                selection: $selectedColor
            )
        } detail: {
            DetailView(color: $selectedColor)
        }
        .navigationSplitViewStyle(.automatic)
        .inspector(isPresented: $showInspector) {
            InspectorPanel(color: selectedColor)
        }
        .onAppear {
            print("debug ContentView onAppear \(String(describing: horizontalSizeClass))")
            // Initialize inspector visibility based on size class
            showInspector = horizontalSizeClass != .compact
        }
        .onChange(of: selectedCategory) { oldValue, newValue in
            // Only auto-select first color in regular width to avoid skipping the list in compact mode
            if horizontalSizeClass != .compact {
                selectedColor = selectedCategory?.colors.first
            } else {
                selectedColor = nil
            }
        }
        .onChange(of: horizontalSizeClass) { oldValue, newValue in
            print(
                "debug ContentView onChange \(String(describing: oldValue)) -> \(String(describing: newValue))"
            )
            // Update inspector visibility based on size class
            // Auto-show in regular width, auto-hide in compact width
            showInspector = newValue != .compact
        }
    }
}

#Preview(traits: .fixedLayout(width: 1024, height: 768)) {
    ContentView()
}

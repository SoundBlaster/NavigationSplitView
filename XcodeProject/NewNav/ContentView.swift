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
    
    @State private var selectedCategory: CustomColorCategory? = dataSource.colorsCategories[0]
    @State private var selectedColor: CustomColor? = dataSource.colorsCategories[0].colors[0]
    @State private var columnVisibility = NavigationSplitViewVisibility.doubleColumn
    @State private var pathCategory: NavigationPath = NavigationPath()
    @State private var pathColor: NavigationPath = NavigationPath()
    private var showInspector: Bool {
        horizontalSizeClass != .compact
    }
    
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
                selection: $selectedColor,
            )
        } detail: {
            DetailView(color: $selectedColor)
        }
        .navigationSplitViewStyle(.automatic)
        .inspector(isPresented: .constant(showInspector)) {
            InspectorPanel(color: selectedColor)
        }
        .onAppear {
            print("debug ContentView onAppear \(String(describing: horizontalSizeClass))")
        }
        .onChange(of: selectedCategory) { oldValue, newValue in
            selectedColor = selectedCategory?.colors[0]
        }
        .onChange(of: horizontalSizeClass) { oldValue, newValue in
            print(
                "debug ContentView onChange \(String(describing: oldValue)) -> \(String(describing: newValue))"
            )
        }
    }
}

#Preview(traits: .fixedLayout(width: 1024, height: 768)) {
    ContentView()
}

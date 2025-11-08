import SwiftUI

struct ContentView: View {

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
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
    @State var selectedCategory: CustomColorCategory?
    @State var selectedColor: CustomColor?
    @State var pathCategory: NavigationPath = NavigationPath()
    @State var pathColor: NavigationPath = NavigationPath()

    var body: some View {
        Group {
            if horizontalSizeClass == .regular {
                NavigationSplitView {
                    List(
                        colorsCategories,
                        selection: $selectedCategory
                    ) { category in
                        NavigationLink(value: category) {
                            Text(category.name)
                        }
                    }
                    .navigationTitle("Categories")
                } content: {
                    CategoryView(
                        horizontalSizeClass: horizontalSizeClass,
                        category: selectedCategory,
                        selection: $selectedColor)
                } detail: {
                    DetailView(color: selectedColor)
                }
                .navigationSplitViewStyle(.prominentDetail)
            } else {
                NavigationSplitView {
                    List(
                        colorsCategories,
                        selection: $selectedCategory
                    ) { category in
                        NavigationLink(value: category) {
                            Text(category.name)
                        }
                    }
                    .navigationTitle("Categories")
                } detail: {
                    NavigationStack {
                        CategoryView(
                            horizontalSizeClass: horizontalSizeClass,
                            category: selectedCategory,
                            selection: $selectedColor)
                    }
                }
            }
        }
        .onAppear {
            print("debug ContentView onAppear \(String(describing: horizontalSizeClass))")
        }
        .onChange(
            of: selectedCategory,
            { oldValue, newValue in
                selectedColor = nil
            }
        )
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

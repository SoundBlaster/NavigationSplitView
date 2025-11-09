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

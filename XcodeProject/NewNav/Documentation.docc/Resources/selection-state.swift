@State private var selectedCategory: CustomColorCategory? = dataSource.colorsCategories.first
@State private var selectedColor: CustomColor? = dataSource.colorsCategories.first?.colors.first
@State private var columnVisibility = NavigationSplitViewVisibility.doubleColumn

.onChange(of: selectedCategory) { _, _ in
    if horizontalSizeClass != .compact {
        selectedColor = selectedCategory?.colors.first
    } else {
        selectedColor = nil
    }
}

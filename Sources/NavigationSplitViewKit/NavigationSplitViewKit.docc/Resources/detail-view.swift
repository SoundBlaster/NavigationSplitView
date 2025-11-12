struct DetailView: View {
    @Binding var color: CustomColor?

    var body: some View {
        VStack {
            if let color {
                Rectangle()
                    .fill(color.color)
                    .frame(width: 200, height: 200)
                Text(color.name)
            } else {
                ColorPlaceholder()
            }
        }
        .navigationTitle(color?.name ?? "")
    }
}

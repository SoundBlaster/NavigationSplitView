import SwiftUI

struct DetailView: View {
    
    @Binding var color: CustomColor?

    var body: some View {
        VStack {
            if let color {
                Rectangle()
                    .fill(color.color)
                    .aspectRatio(1, contentMode: .fit)
                    .frame(maxWidth: 240)
                Text(color.name)
            } else {
                ColorPlaceholder()
            }
        }
        .navigationTitle(color?.name ?? "")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailView(color: .constant(CustomColor.red))
        }
        .previewLayout(.fixed(width: 768, height: 768))
    }
}

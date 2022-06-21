import SwiftUI

struct DetailView: View {
    let color: CustomColor?
    
    var body: some View {
        VStack {
            if let color {
                Rectangle()
                    .fill(color.color)
                    .frame(width: 200, height: 200)
                Text(color.name)
            } else {
                EmptyView()
            }
        }
        .navigationTitle(color?.name ?? "")
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailView(color: CustomColor.red)
        }
        .previewLayout(.fixed(width: 768, height: 768))
    }
}

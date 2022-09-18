import SwiftUI

struct DetailView: View {
    let color: CustomColor?
    let showTabs = false
    
    var body: some View {
        Group {
            if showTabs {
                TabView {
                    List(0..<100) { index in
                        Text(color?.name ?? "color name \(index)")
                    }
                    
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                    }
                    
                    Form {
                        Section(header: Text("Section header")) {
                            Text(color?.name ?? "color name")
                        }
                    }
                    .tabItem {
                        Label("Order", systemImage: "square.and.pencil")
                    }
                    
                }
            } else {
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

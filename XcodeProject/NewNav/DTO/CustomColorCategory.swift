import Foundation

struct CustomColorCategory: Identifiable, Hashable, Equatable {
    var id = UUID()
    
    let colors: [CustomColor]
    let name: String
}

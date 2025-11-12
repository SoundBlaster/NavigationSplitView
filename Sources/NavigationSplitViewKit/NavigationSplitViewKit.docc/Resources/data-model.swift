import SwiftUI

struct CustomColor: Identifiable, Hashable {
    var id = UUID()
    let color: Color
    let name: String
}

struct CustomColorCategory: Identifiable, Hashable {
    var id = UUID()
    let colors: [CustomColor]
    let name: String
}

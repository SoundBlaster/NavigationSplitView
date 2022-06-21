import SwiftUI

struct CustomColor: Identifiable, Hashable {
    var id = UUID()
    
    let color: Color
    let name: String
    
    static let red = CustomColor(color: .red, name: "red")
    static let blue = CustomColor(color: .blue, name: "blue")
    static let green = CustomColor(color: .green, name: "green")
    static let yellow = CustomColor(color: .yellow, name: "yellow")
    static let cyan = CustomColor(color: .cyan, name: "cyan")
    static let mint = CustomColor(color: .mint, name: "mint")
    static let accent = CustomColor(color: .accentColor, name: "accent")
}

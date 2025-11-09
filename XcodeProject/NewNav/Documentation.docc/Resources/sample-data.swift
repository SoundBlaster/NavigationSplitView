struct Data {
    var colorsCategories: [CustomColorCategory] = [
        CustomColorCategory(
            colors: [
                CustomColor.red,
                CustomColor.blue,
                CustomColor.yellow,
            ],
            name: "common"
        ),
        CustomColorCategory(
            colors: [
                CustomColor.cyan,
                CustomColor.mint,
                CustomColor.accent,
            ],
            name: "specific"
        )
    ]
}

let dataSource = Data()

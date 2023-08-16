//
//  ContentRowViewModel.swift
//  CalculatorSwiftUI
//
//  Created by Raphael Henrique on 16/08/23.
//

import SwiftUI

struct ContentRowButtonsModel: Hashable {
    let buttons: [ButtonModel]
    let style: RowStyle
}

struct ButtonModel: Hashable {
    let title: String
    let backgroundColor: Color
}

enum RowStyle {
    case fourButtons
    case threeButtons
}

//
//  CalculatorMock.swift
//  CalculatorSwiftUI
//
//  Created by Raphael Henrique on 16/08/23.
//

let row0ButtonModel: ContentRowButtonsModel = .init(
    buttons: [
        ButtonModel(title: "AC", backgroundColor: .gray),
        ButtonModel(title: "+/-", backgroundColor: .gray),
        ButtonModel(title: "%", backgroundColor: .gray),
        ButtonModel(title: "/", backgroundColor: .orange),
    ],
    style: .fourButtons
)

let row1ButtonModel: ContentRowButtonsModel = .init(
    buttons: [
        ButtonModel(title: "7", backgroundColor: .gray),
        ButtonModel(title: "8", backgroundColor: .gray),
        ButtonModel(title: "9", backgroundColor: .gray),
        ButtonModel(title: "x", backgroundColor: .orange),
    ],
    style: .fourButtons
)

let row2ButtonModel: ContentRowButtonsModel = .init(
    buttons: [
        ButtonModel(title: "4", backgroundColor: .gray),
        ButtonModel(title: "5", backgroundColor: .gray),
        ButtonModel(title: "6", backgroundColor: .gray),
        ButtonModel(title: "-", backgroundColor: .orange),
    ],
    style: .fourButtons
)

let row3ButtonModel: ContentRowButtonsModel = .init(
    buttons: [
        ButtonModel(title: "1", backgroundColor: .gray),
        ButtonModel(title: "2", backgroundColor: .gray),
        ButtonModel(title: "3", backgroundColor: .gray),
        ButtonModel(title: "+", backgroundColor: .orange),
    ],
    style: .fourButtons
)

let row4ButtonModel: ContentRowButtonsModel = .init(
    buttons: [
        ButtonModel(title: "0", backgroundColor: .gray),
        ButtonModel(title: ",", backgroundColor: .gray),
        ButtonModel(title: "=", backgroundColor: .orange),
    ],
    style: .threeButtons
)

let contentViewModel: [ContentRowButtonsModel] = [
    row0ButtonModel,
    row1ButtonModel,
    row2ButtonModel,
    row3ButtonModel,
    row4ButtonModel
]

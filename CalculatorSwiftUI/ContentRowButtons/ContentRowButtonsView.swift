//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Raphael Henrique on 16/08/23.
//

import SwiftUI

struct ContentRowButtonsView: View {
    
    private let model: ContentRowButtonsModel
    
    init(model: ContentRowButtonsModel) {
        self.model = model
    }
    
    var body: some View {
        switch model.style {
        case .threeButtons:
            GeometryReader { geometry in
                HStack(spacing: 1) {
                    Button {
                        print("/")
                    } label: {
                        Text("0")
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                    .padding()
                    .frame(minWidth: geometry.size.width / 2)
                    .background(Color.gray)
                    
                    Button {
                        print("/")
                    } label: {
                        Text(",")
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray)
                    
                    Button {
                        print("/")
                    } label: {
                        Text("=")
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                }
            }.foregroundColor(Color.white)
            
        case .fourButtons:
            HStack(spacing: 1) {
                ForEach(model.buttons, id: \.self) { button in
                    Button {
                        print("/")
                    } label: {
                        Text(button.title)
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(button.backgroundColor)
                }
            }.foregroundColor(Color.white)
        }
    }
}

struct ContentRowButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentRowButtonsView(model: row4ButtonModel)
    }
}

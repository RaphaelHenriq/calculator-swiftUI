//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Raphael Henrique on 16/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var result: String = "abc"
    
    private let model: [ContentRowButtonsModel] = contentViewModel
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 1) {
            Text(result)
                .padding()
                .font(.largeTitle)
                .frame(height: 80)
                .background(Color.black)
                .foregroundColor(Color.white)
            ForEach(model, id: \.self) { model in
                ContentRowButtonsView(model: model)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.black)
        .foregroundColor(Color.white)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

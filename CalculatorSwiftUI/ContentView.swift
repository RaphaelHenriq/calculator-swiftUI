//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Raphael Henrique on 16/08/23.
//

import SwiftUI

enum OperationType {
    case sum
    case subtraction
    case division
    case multiplication
    case equal
    case percentage
    case invert
    case none
}

struct ContentView: View {
    
    @State private var values = "0"
    @State private var previousResult = 0.0
    @State private var result = 0.0
    @State private var decimal = 0.0
    
    @State private var operation: OperationType = .none
    @State private var previousOperation: OperationType = .none
    
    private func process(digit: Int) {
        if operation != .none {
            result = 0
            previousOperation = operation
            operation = .none
        }
        
        if decimal > 0.0 {
            result = result + Double(truncating: NSNumber(value: (Double(digit) / decimal)))
            decimal = decimal * 10
            values = "\(values)\(digit)"
        } else {
            result = (result * 10) + Double(digit)
            values = removeZerosFromEnd(value: result)
        }
    }
    
    private func calculate() {
        switch previousOperation {
        case .sum:
            result = previousResult + result
        case .subtraction:
            result = previousResult - result
        case .division:
            result = previousResult / result
        case .multiplication:
            result = previousResult * result
        case .equal:
            result = previousResult + result
        case .percentage:
            result = (previousResult + result) / 100
            return
        case .invert:
            result = result * (-1)
        case .none:
            break
        }
        
        decimal = 0.0
        values = removeZerosFromEnd(value: result)
        previousOperation = .none
        previousResult = result
    }
    
    private func reset() {
        result = 0
        previousResult = 0
        operation = .none
        previousOperation = .none
        decimal = 0
        values = "0"
    }
    
    private func removeZerosFromEnd(value: Double) -> String {
        let number = NSNumber(value: value)
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16
        
        return formatter.string(from: number) ?? ""
    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            Spacer()
            
            HStack {
                Text(values)
                    .padding()
                    .lineLimit(1)
                    .font(.system(size: CGFloat(80 / Int((Double(String(result).count + 10) / 8.0)))))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: true, vertical: false)
            }
            
            HStack(spacing: 0) {
                Button("AC") {
                    reset()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("+/-") {
                    result = result * -1
                    calculate()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("%") {
                    result = result / 100
                    calculate()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("/") {
                    calculate()
                    operation = .division
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(.orange)
            }.foregroundColor(.white)
            
            HStack(spacing: 0) {
                Button("7") {
                    process(digit: 7)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("8") {
                    process(digit: 8)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("9") {
                    process(digit: 9)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("x") {
                    calculate()
                    operation = .multiplication
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(.orange)
            }.foregroundColor(.white)
            
            HStack(spacing: 0) {
                Button("4") {
                    process(digit: 4)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("5") {
                    process(digit: 5)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("6") {
                    process(digit: 6)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("-") {
                    calculate()
                    operation = .subtraction
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(.orange)
            }.foregroundColor(.white)
            
            HStack(spacing: 0) {
                Button("1") {
                    process(digit: 1)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("2") {
                    process(digit: 2)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("3") {
                    process(digit: 3)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("+") {
                    operation = .sum
                    calculate()
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(.orange)
            }.foregroundColor(.white)
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Button("0") {
                        process(digit: 0)
                    }
                    .padding()
                    .frame(minWidth: geometry.size.width / 2)
                    
                    Button(".") {
                        if decimal == 0.0 {
                            decimal = 10.0
                            values = values + "."
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    
                    Button("=") {
                        calculate()
                        operation = .equal
                        previousOperation = .equal
                    }
                    .padding(.vertical, 40)
                    .frame(maxWidth: .infinity)
                    .background(.orange)
                }.foregroundColor(.white)
            }.frame(maxHeight: 92)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

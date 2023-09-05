//
//  NumericKeyboardView.swift
//  CaloteX
//
//  Created by Mateus Marinho on 05/09/23.
//

import SwiftUI

struct NumericKeyboardView: View {
    @Binding var amount: Double
    @State private var enteredAmountString: String = "00,00"
    @State private var displayAmountString: String = ""
    
    private let numbers = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
    ]
    
    var body: some View {
        VStack {
            Text("Valor".uppercased())
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text(toCurrency(amount))
                .font(.title)
                .fontWeight(.bold)
                .onAppear {
                    let formatter = NumberFormatter()
                    formatter.numberStyle = .decimal
                    formatter.minimumFractionDigits = 2
                    formatter.maximumFractionDigits = 2
                    enteredAmountString = formatter.string(from: NSNumber(value: amount))?.replacingOccurrences(of: ".", with: ",") ?? "00,00"
                    updateFormattedAmount()
                }
            
            // Numeric keyboard
            VStack {
                ForEach(0..<3) { i in
                    HStack {
                        ForEach(1..<4) { j in
                            let number = i * 3 + j
                            Button(action: {
                                appendNumber(number)
                            }) {
                                Text("\(number)")
                                    .font(.title)
                                    .frame(width: 60, height: 60)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(30)
                                    .padding(10)
                            }
                        }
                    }
                }
                
                HStack {
                    // Zero Button
                    Button(action: {
                        appendNumber(0)
                    }) {
                        Text("0")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(30)
                            .padding(5)
                    }
                    
                    // Delete Button
                    Button(action: deleteLast) {
                        Image(systemName: "delete.left")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(30)
                            .padding(5)
                    }
                }
            }
        }
    }
    
    private func updateFormattedAmount() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        displayAmountString = formatter.string(from: NSNumber(value: amount)) ?? ""
    }
    
    private func appendNumber(_ number: Int) {
        let commaIndex = enteredAmountString.firstIndex(of: ",")!
        var integerPart = String(enteredAmountString[..<commaIndex])
        let decimalPartIndex = enteredAmountString.index(after: commaIndex)
        var decimalPart = String(enteredAmountString[decimalPartIndex...])

        // Shift the first digit from the decimal part to the integer part
        integerPart += "\(decimalPart.first!)"
        // Shift the last digit from decimal part and add the new number
        decimalPart = String(decimalPart.dropFirst()) + "\(number)"
            
        enteredAmountString = "\(integerPart),\(decimalPart)"
        amount = Double(enteredAmountString.replacingOccurrences(of: ",", with: ".")) ?? 0
        updateFormattedAmount()
        tapHapticalFeedback()
    }

    
    private func deleteLast() {
        let commaIndex = enteredAmountString.firstIndex(of: ",")!
        let integerPart = enteredAmountString[..<commaIndex]
        let decimalPartIndex = enteredAmountString.index(after: commaIndex)
        let decimalPart = enteredAmountString[decimalPartIndex...]

        if decimalPart != "00" {
            let newDecimalPart = "0" + decimalPart.dropLast()
            enteredAmountString = "\(integerPart),\(newDecimalPart)"
        } else if integerPart.count > 1 {
            let newIntegerPart = String(integerPart.dropLast())
            enteredAmountString = "\(newIntegerPart),00"
        } else {
            enteredAmountString = "0,00"
        }
            
        amount = Double(enteredAmountString.replacingOccurrences(of: ",", with: ".")) ?? 0
        updateFormattedAmount()
        tapHapticalFeedback()
    }


}

struct NumberButton: View {
    let number: Int
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text("\(number)")
                .font(.largeTitle)
                .frame(width: 100, height: 90)
            
        })
        .buttonStyle(PlainButtonStyle())
    }
}

struct DeleteButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "delete.left")
                .font(.largeTitle)
                .frame(width: 100, height: 80)
                .foregroundColor(.accentColor)
        })
    }
}


struct NumericKeyboardView_Previews: PreviewProvider {
    @State static private var amount: Double = 0
    
    static var previews: some View {
        NumericKeyboardView(amount: $amount)
    }
}

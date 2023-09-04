//
//  CreateExpense.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import SwiftUI

struct CreateExpense: View {
    @Environment(\.managedObjectContext) private var context
    @Environment(\.dismiss) var dismiss

    var debtor: Debtor
    
    @State var name = ""
    @State var value = "0"
    @State var fixed = false
    @State var date = Date()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Dívida de \(debtor.wName)")
                .font(.largeTitle)
            Section("") {
                TextField("Nome do Gasto", text: $name)
                    .textFieldStyle(.roundedBorder)
                TextField("Nome do Gasto", text: $value)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
            }
            Section("Opcionais") {
                Toggle(isOn: $fixed, label: {Text("Fixo")})
                DatePicker("Dia da Compra", selection: $date, displayedComponents: .date)
                    .datePickerStyle(.compact)
            }
            
            Spacer()
         
            Button("Adicionar", action: handleSaveExpense)
                .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
    
    func handleSaveExpense() {
        do {
            let newExpense = Expense(context: context)
            newExpense.name = name
            newExpense.date = date
            newExpense.value = Double(value) ?? 0
            newExpense.fixed = fixed
            newExpense.owner = debtor
            
            try context.save()
            
            clearState()
            dismiss()
        } catch {
            print("Something Went Wrong Saving the Expense")
        }
    }
    
    func clearState() {
        name = ""
        value = "0"
        fixed = false
    }
}

struct CreateExpense_Previews: PreviewProvider {
    static var previews: some View {
        CreateExpense(debtor: Debtor())
    }
}

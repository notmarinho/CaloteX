//
//  CreateExpense.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import SwiftUI

struct CreateExpense: View {
    @EnvironmentObject var CoreDataVM: CoreDataViewModel
    @Environment(\.dismiss) var dismiss
    
    var debtor: Debtor
    
    @State var name = ""
    @State var value = ""
    @State var fixed = false
    @State var date = Date()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            List {
                Section("Nova dívida de \(debtor.name)") {
                    TextField("Nome do Gasto", text: $name)
                    
                    TextField(text: $value) {
                        Label("Valor", systemImage: "dollarsign")
                    }
                    
                }
                
                Section("Opcionais") {
                    Toggle(isOn: $fixed, label: {Text("Fixo")})
                    DatePicker("Dia da Compra", selection: $date, displayedComponents: .date)
                        .datePickerStyle(.compact)
                }
            }
            Spacer()
            
            Button {
                handleSaveExpense()
            }
        label: {
            Text("Cadastrar")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .tint(Color(.systemBlue))
        .padding(.horizontal)
            
        }
    }
    
    func handleSaveExpense() {
        CoreDataVM.addExpense(title: name, value: value, date: date, debtor: debtor)

        clearState()
        dismiss()
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

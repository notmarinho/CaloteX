//
//  CreateExpense.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import SwiftUI

enum FocusedField {
       case title
}

struct CreateExpense: View {
    @EnvironmentObject var CoreDataVM: CoreDataViewModel
    @EnvironmentObject var NavigationVM: NavigationViewModel

    @Environment(\.dismiss) var dismiss
    
    var debtor: Debtor
    
    @State var name = ""
    @State var value: Double = 0
    @State var fixed = false
    @State var date = Date()
    
    @State var isFirstFocus = true
    @State var showNumericKeyboard = true
    @FocusState private var focusedField: FocusedField?

    var body: some View {
        VStack(alignment: .leading) {
            Form {
                
                TextField("Título", text: $name)
                    .focused($focusedField, equals: .title)
                LabeledContent("Valor", value: toCurrency(value))
                    .onTapGesture {
                        showNumericKeyboard = true
                    }
                LabeledContent("Devedor", value: debtor.name)
    
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
        .sheet(isPresented: $showNumericKeyboard) {
            Spacer()
            NumericKeyboardView(amount: $value)
            Spacer()
            Button("Pronto") {
                showNumericKeyboard = false
                
                if isFirstFocus {
                    focusedField = .title
                    isFirstFocus = false
                }
            }
        }
        .navigationTitle("Adicionar Gasto")
        .onAppear {
            NavigationVM.hideTabBar()
        }
        .onDisappear {
            NavigationVM.showTabBar()
        }
    }
    
    func handleSaveExpense() {
        CoreDataVM.addExpense(title: name, value: value, date: date, debtor: debtor)
        
        clearState()
        dismiss()
    }
    
    func clearState() {
        name = ""
        value = 0
        fixed = false
    }
}

struct CreateExpense_Previews: PreviewProvider {
    static var previews: some View {
        CreateExpense(debtor: Debtor())
    }
}

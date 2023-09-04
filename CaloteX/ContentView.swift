//
//  ContentView.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var context
    
    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var debtors: FetchedResults<Debtor>
    
    @State var showingDebtorSheet = false
    @State var showingExpenseSheet = false
    @State var debtorName = ""
    
    @State var editingDebtor: Debtor? = nil
    
    var body: some View {
        VStack {
            Button("Adicionar Devedor") {
                showingDebtorSheet.toggle()
            }
            List {
                ForEach(debtors) { debtor in
                    Section(debtor.wName) {
                        Button {
                            editingDebtor = debtor
                        } label: {
                            Label("Adicionar Gasto", systemImage: "plus")
                        }
                        
                        ForEach(debtor.expenseArray) { expense in
                            HStack {
                                Text(expense.wName)
                                    .font(.body)
                                Spacer()
                                Text(expense.currencyValue)
                            }
                            .swipeActions {
                                Label("Pagar", systemImage: "plus")
                            }
                        }
                        
                        HStack {
                            Text("Total")
                                .fontWeight(.bold)
                            Spacer()
                            Text(debtor.totalCurrenyValue)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .fontWeight(.bold)
                        }
                        
                    }
                }
            }
            .sheet(isPresented: $showingDebtorSheet) {
                VStack {
                    TextField("Nome do Devedor", text: $debtorName)
                    Spacer()
                    Button(action: handleSaveNewDebtor) {
                        Text("Adicionar Devedor")
                    }.disabled(debtorName.isEmpty)
                }
            }
            .sheet(item: $editingDebtor) { debtor in
                CreateExpense(debtor: debtor)
            }
            .navigationTitle("Dashboard")
        }
    }
    
    func handleSaveNewDebtor() {
        let newDebtor = Debtor(context: context)
        newDebtor.name = debtorName
        
        do {
            try context.save()
            debtorName = ""
            showingDebtorSheet = false
        } catch {
            print("Error saving debtor: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}

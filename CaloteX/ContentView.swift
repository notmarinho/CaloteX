//
//  ContentView.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var CoreDataVM: CoreDataViewModel
    
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
                    
                    Section {
                        ForEach(debtor.expenseArray) { expense in
                            HStack {
                                Text(expense.title)
                                    .font(.body)
                                Spacer()
                                Text(expense.currencyValue)
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                let expenseToDelete = debtor.expenseArray[index]
                                expenseToDelete.delete()
                            }
                        }
                    } header: {
                        NavigationLink(destination: CreateExpense(debtor: debtor)) {
                            HStack {
                                Text(debtor.name)
                                Spacer()
                                HStack {
                                    Label("Adicionar Gasto", systemImage: "dollarsign.circle.fill")
                                }
                            }
                        }
                        .buttonStyle(.plain)
                    } footer: {
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
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
            .navigationTitle("Dashboard")
        }
    }
    
    func handleSaveNewDebtor() {
        CoreDataVM.addDebtor(name: debtorName)
        
        debtorName = ""
        showingDebtorSheet = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}

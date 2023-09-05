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
        
    var body: some View {
        VStack {
            List {
                ForEach(debtors) { debtor in
                    
                    Section {
                        ForEach(debtor.expenseArray) { expense in
                            HStack {
                                HStack {
                                    if expense.isPaid {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(Color(.systemGreen))

                                    }
                                    Text(expense.title)
                                        .font(.body)
                                }
                               
                                Spacer()
                                Text(expense.currencyValue)
                            }
                            .swipeActions(edge: .leading) {
                                Button {
                                    // @TODO - Function to toggle is paid.
                                } label: {
                                    Label("Pago", systemImage: "checkmark.circle.fill")
                                }
                                .tint(.green)

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
            .navigationTitle("Devedores")
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

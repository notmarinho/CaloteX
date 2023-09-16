//
//  Dashboard.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import SwiftUI

struct Dashboard: View {
    @EnvironmentObject var CoreDataVM: CoreDataViewModel
    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var debtors: FetchedResults<Debtor>
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Label("Período", systemImage: "calendar")
                    .font(.title3)
                Spacer()
                Button(dateFormatter(CoreDataVM.period, format: "MMM yyyy")) {
                    
                }
            }
            .padding()
            .background(.regularMaterial)
            .cornerRadius(6)
            .padding(.horizontal)
            
            Text("Devedores")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.leading)
                
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(debtors) { debtor in
                        NavigationLink(destination: DebtorDetailView(debtor: debtor)) {
                            VStack(alignment: .leading) {
                                Text(debtor.name)
                                    .font(.title3)
                                Text(debtor.totalCurrenyValue)
                                    .font(.subheadline)
                                    .foregroundColor(Color.secondary)
                                NavigationLink(destination: CreateExpense(debtor: debtor)) {
                                    HStack {
                                        Label("Novo Gasto", systemImage: "dollarsign.circle.fill")
                                    }
                                    .padding()
                                    .background(Color(.tertiarySystemBackground))
                                    .cornerRadius(12)
                                }
                            }
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(6)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            
            Text("Meus Gastos")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.leading)
            
            Spacer()
        }
        .padding(.top)
        .navigationTitle("Dashboard")
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmptyView()
        }
      
    }
}

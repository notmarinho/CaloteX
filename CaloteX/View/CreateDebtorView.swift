//
//  CreateDebtorView.swift
//  CaloteX
//
//  Created by Mateus Marinho on 04/09/23.
//

import SwiftUI

struct CreateDebtorView: View {
    @EnvironmentObject var CoreDataVM: CoreDataViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var debtorName = ""
    
    var body: some View {
        VStack {
            TextField("Nome do Devedor", text: $debtorName)
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Spacer()
            Button(action: handleSaveNewDebtor) {
                
                Label("Adicionar", systemImage: "plus.circle.fill")
            }
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            
            .controlSize(.large)
            .tint(Color(.systemBlue))
            .padding(.horizontal)
            .disabled(debtorName.isEmpty)
        }
        .navigationTitle("Adicionar Devedor")
        .padding()
    }
    
    func handleSaveNewDebtor() {
        CoreDataVM.addDebtor(name: debtorName)
        
        debtorName = ""
        dismiss()
    }
}

struct CreateDebtorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateDebtorView()
        }
    }
}

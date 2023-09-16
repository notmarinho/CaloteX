//
//  DebtorDetailView.swift
//  CaloteX
//
//  Created by Mateus Marinho on 05/09/23.
//

import SwiftUI

struct DebtorDetailView: View {
    var debtor: Debtor
    var body: some View {
        VStack {
            ForEach(debtor.expenseArray) { expense in
                LabeledContent(expense.title, value: expense.currencyValue)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(6)
                    .padding(.horizontal)
            }
            Spacer()
        }
        .navigationTitle("Mateus")
    }
}

//struct DebtorDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            DebtorDetailView(debtor: Debtor())
//        }
//    }
//}

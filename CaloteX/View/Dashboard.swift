//
//  Dashboard.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import SwiftUI

struct Dashboard: View {
    @EnvironmentObject var CoreDataVM: CoreDataViewModel
    
    var body: some View {
        VStack {
            HStack {
                Label("Período", systemImage: "calendar")
                    .font(.title3)
                Spacer()
                Button(dateFormatter(CoreDataVM.period, format: "MMM yyyy")) {
                    
                }
            }
            .padding()
            .background(.regularMaterial)
            .cornerRadius(10)
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top)
        .navigationTitle("Dashboard")
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Dashboard()
        }
      
    }
}

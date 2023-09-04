//
//  Dashboard.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        VStack {
            HStack {
                Label("Período", systemImage: "calendar")
                    .font(.title3)
                Spacer()
                Button("02/2023") {
                    
                }
            }
            .padding()
            .background(.regularMaterial)
            .cornerRadius(10)
            .padding(.horizontal)
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}

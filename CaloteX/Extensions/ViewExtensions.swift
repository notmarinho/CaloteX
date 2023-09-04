//
//  ViewExtensions.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import SwiftUI

extension View {
    func withEnviromentObjects() -> some View {
        let persistenceController = PersistenceController.instace

        return self
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .environmentObject(AppStateViewModel())
    }
    
    func cardView() -> some View {
        self.modifier(CardView())
    }
}


struct CardView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 18)
            .padding(.vertical, 24)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
    }
}

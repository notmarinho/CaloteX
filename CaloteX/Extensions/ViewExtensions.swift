//
//  ViewExtensions.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import SwiftUI

extension View {
    func previewWithEnviromentObjects() -> some View {
        return self
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

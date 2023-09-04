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
        //            .environmentObject(AppStateViewModel())
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

struct AppButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        //            .buttonStyle(.borderedProminent)
        //            .controlSize(.large)
        //            .tint(Color(.systemBlue))
        //            .padding(.horizontal)
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}

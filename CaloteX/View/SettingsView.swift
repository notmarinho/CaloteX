//
//  SettingsView.swift
//  CaloteX
//
//  Created by Mateus Marinho on 04/09/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            NavigationLink(destination: CreateDebtorView()) {
                Text("Criar Devedor")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

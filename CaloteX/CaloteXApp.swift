//
//  CaloteXApp.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import SwiftUI

@main
struct CaloteXApp: App {
    let persistenceController = PersistenceController.instace
    
    @State private var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ZStack {
                    VStack {
                        TabView(selection: $selectedTab) {
                            ContentView()
                                .tag(Tab.house)
                            
                            Text("Novo Gasto")
                                .tag(Tab.dollar)
                            
                            Text("Configurações")
                                .tag(Tab.gearshape)
                        }
                    }
                    VStack {
                        Spacer()
                        CustomTabBar(selectedTab: $selectedTab)
                    }
                }
                .withEnviromentObjects()
            }
        }
    }
}

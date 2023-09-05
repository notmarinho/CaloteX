//
//  CaloteXApp.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import SwiftUI

@main
struct CaloteXApp: App {
    @State private var selectedTab: Tab = .house
    @StateObject var CoreDataVM = CoreDataViewModel()
    @StateObject var NavigationVM = NavigationViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                VStack {
                    TabView(selection: $selectedTab) {
                        NavigationView {
                            Dashboard()
                        }
                        .tag(Tab.house)
                        
                        NavigationView {
                            ContentView()
                                .navigationBarHidden(true)
                        }
                        .tag(Tab.dollar)
                        
                        NavigationView {
                            SettingsView()
                        }
                        .tag(Tab.gearshape)
                    }
                }
                VStack {
                    Spacer()
                    if NavigationVM.showingTabBar {
                        CustomTabBar(selectedTab: $selectedTab)
                    }
                }
            }
            .environmentObject(CoreDataVM)
            .environmentObject(NavigationVM)
            .environment(\.managedObjectContext, CoreDataVM.context)
        }
    }
}

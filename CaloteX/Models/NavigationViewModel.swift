//
//  NavigationViewModel.swift
//  CaloteX
//
//  Created by Mateus Marinho on 05/09/23.
//

import Foundation

class NavigationViewModel: ObservableObject {
    @Published var showingTabBar: Bool = true
    
    func hideTabBar() {
        showingTabBar = false
    }
    
    func showTabBar() {
        showingTabBar = true
    }
}

//
//  AppState.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import Foundation

class AppStateViewModel: ObservableObject {
    @Published var period: Date = Date()
    
    func updatePeriod(newPeriod: Date) {
        period = newPeriod
    }
}

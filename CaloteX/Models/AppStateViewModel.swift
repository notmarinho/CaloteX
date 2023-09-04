//
//  AppState.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import Foundation
import CoreData

class AppStateViewModel: ObservableObject {
    let persistenceController = PersistenceController.instace
    
    @Published var period: Date = Date()
    
    func updatePeriod(newPeriod: Date) {
        period = newPeriod
    }
}

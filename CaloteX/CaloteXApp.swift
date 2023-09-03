//
//  CaloteXApp.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import SwiftUI

@main
struct CaloteXApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

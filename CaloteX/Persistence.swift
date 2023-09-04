//
//  Persistence.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import CoreData

struct PersistenceController {
    static let instace = PersistenceController()

    let container: NSPersistentContainer
    let context: NSManagedObjectContext

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CaloteX")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Something went wrong while reading data persistent \(error)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
        } catch let error {
            print("Persistence.swift Erro: \(error.localizedDescription)")
        }
    }
}

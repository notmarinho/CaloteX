//
//  CoreDataViewModel.swift
//  CaloteX
//
//  Created by Mateus Marinho on 04/09/23.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CaloteX")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Something went wrong while reading data persistent \(error)")
            } else {
                print("Data Successfuly Loaded ✅")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        context = container.viewContext
    }
    
    func addExpense(title: String, value: String, date: Date, debtor: Debtor) {
        let newExpense = Expense(context: context)
        newExpense.title = title
        newExpense.value = Double(value) ?? 0
        newExpense.date = date
        newExpense.owner = debtor
        
        save()
    }
    
    func addDebtor(name: String) {
        let newDebtor = Debtor(context: context)
        newDebtor.name = name
        
        save()
    }
    
    func save() {
        do {
            try context.save()
        } catch let error {
            print("Something went wrong while saving on CoreData \(error)")
        }
    }
}

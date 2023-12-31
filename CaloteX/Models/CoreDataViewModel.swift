//
//  CoreDataViewModel.swift
//  CaloteX
//
//  Created by Mateus Marinho on 04/09/23.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    @Published var period: Date = Date()
    
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
    
    func updatePeriod(_ to: Date) {
        period = to
    }
    
    func addExpense(title: String, value: Double, date: Date, debtor: Debtor) {
        let newExpense = Expense(context: context)
        newExpense.title = title
        newExpense.value = value
        newExpense.date = date
        newExpense.owner = debtor
        
        save()
    }
    
    func deleteExpense(offsets: IndexSet, expenses: FetchedResults<Expense>) {
        withAnimation {
            offsets.map {
                expenses[$0]
            }.forEach(context.delete)
        }
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

//
//  Debtor+CoreDataClass.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//
//

import Foundation
import CoreData

@objc(Debtor)
public class Debtor: NSManagedObject {
    public var wName: String {
        self.name ?? "Devedor Desconhecido"
    }
    
    public var expenseArray: [Expense] {
        let set = expense as? Set<Expense> ?? []
        
        return set.sorted {
            $0.wDate < $1.wDate
        }
    }
    
    public var totalDue: Int {
        Int(self.expenseArray.reduce(0) { partialResult, expense in
            partialResult + expense.value
        })
    }
}

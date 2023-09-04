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
    var name: String {
        get { self.name_ ?? "Devedor Desconhecido" }
        set { self.name_ = newValue }
    }
    
    var expenseArray: [Expense] {
        let set = expense as? Set<Expense> ?? []
        
        return set.sorted {
            $0.date < $1.date
        }
    }
    
    var totalCurrenyValue: String {
        let totalAmount = self.expenseArray.reduce(0) {
            $0 + $1.value
        }
        
        return toCurrency(totalAmount)
    }
}

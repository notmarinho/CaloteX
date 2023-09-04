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
    var wName: String {
        self.name ?? "Devedor Desconhecido"
    }
    
    var expenseArray: [Expense] {
        let set = expense as? Set<Expense> ?? []
        
        return set.sorted {
            $0.wDate < $1.wDate
        }
    }
    
    var totalCurrenyValue: String {
        let totalAmount = self.expenseArray.reduce(0) {
            $0 + $1.value
        }
        
        return toCurrency(totalAmount)
    }
}

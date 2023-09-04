//
//  Expense+CoreDataClass.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//
//

import Foundation
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {
    var wName: String {
        self.name ?? "Gasto Desconhecido"
    }
    
    var wDate: Date {
        self.date ?? Date()
    }
    
    var currencyValue: String {
        toCurrency(self.value)
    }
}

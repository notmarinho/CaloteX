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
    var title: String {
        get { self.title_ ?? "Gasto Desconhecido" }
        set { self.title_ = newValue }
    }
    
    var date: Date {
        get { self.date_ ?? Date() }
        set { self.date_ = newValue }
    }
    
    var currencyValue: String {
        toCurrency(self.value)
    }
}

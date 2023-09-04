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
    public var wDate: Date {
        self.date ?? Date()
    }
    
    public var wName: String {
        self.name ?? "Gasto Desconhecdio"
    }
}

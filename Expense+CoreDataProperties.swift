//
//  Expense+CoreDataProperties.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var value: Int64
    @NSManaged public var name: String?
    @NSManaged public var date: Date?
    @NSManaged public var fixed: Bool
    @NSManaged public var paid: Bool
    @NSManaged public var owner: Debtor?

}

extension Expense : Identifiable {

}

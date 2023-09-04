//
//  Debtor+CoreDataProperties.swift
//  CaloteX
//
//  Created by Mateus Marinho on 04/09/23.
//
//

import Foundation
import CoreData


extension Debtor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Debtor> {
        return NSFetchRequest<Debtor>(entityName: "Debtor")
    }

    @NSManaged public var name_: String?
    @NSManaged public var expense: NSSet?

}

// MARK: Generated accessors for expense
extension Debtor {

    @objc(addExpenseObject:)
    @NSManaged public func addToExpense(_ value: Expense)

    @objc(removeExpenseObject:)
    @NSManaged public func removeFromExpense(_ value: Expense)

    @objc(addExpense:)
    @NSManaged public func addToExpense(_ values: NSSet)

    @objc(removeExpense:)
    @NSManaged public func removeFromExpense(_ values: NSSet)

}

extension Debtor : Identifiable {

}

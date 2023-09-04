//
//  Expense+CoreDataProperties.swift
//  CaloteX
//
//  Created by Mateus Marinho on 04/09/23.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var date_: Date?
    @NSManaged public var fixed: Bool
    @NSManaged public var title_: String?
    @NSManaged public var isPaid: Bool
    @NSManaged public var value: Double
    @NSManaged public var owner: Debtor?

}

extension Expense : Identifiable {

}

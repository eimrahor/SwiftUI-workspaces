//
//  Transaction+CoreDataClass.swift
//  09-BudgetsApp
//
//  Created by Emirhan İmrahor on 14.02.2025.
//

import Foundation
import CoreData

@objc(Transaction)
public class Transaction: NSManagedObject {
    public override func awakeFromInsert() {
        self.dateCreated = Date()
    }
}

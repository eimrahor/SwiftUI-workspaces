//
//  BudgetCategory+CoreDataClass.swift
//  09-BudgetsApp
//
//  Created by Emirhan İmrahor on 13.02.2025.
//

import Foundation
import CoreData

@objc(BudgetCategory)
public class BudgetCategory: NSManagedObject {
    public override func awakeFromInsert() {
        self.dateCreated = Date()
    }
    
    var overSpent: Bool {
        remainingBudgetTotal < 0
    }
    
    var transactionsTotal: Double {
        transactionsArray.reduce(0) { $0 + $1.total }
    }
    
    var remainingBudgetTotal: Double {
        self.total - transactionsTotal
    }
    
    private var transactionsArray: [Transaction] {
        guard let transactions = self.transaction else { return [] }
        let allTransactions = (transactions.allObjects as? [Transaction]) ?? []
        return allTransactions.sorted { t1, t2 in
            t1.dateCreated! > t2.dateCreated!
        }
    }
    
    static func byId(_ id: NSManagedObjectID) -> BudgetCategory {
        let vc = CoreDataManager.shared.viewContext
        guard let budgetCategory = vc.object(with: id) as? BudgetCategory else {
            fatalError("Id not found")
        }
        return budgetCategory
    }
    
    static func transactionByCategoryRequest(_ budgetCategory: BudgetCategory) -> NSFetchRequest<Transaction> {
        
        let request = Transaction.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "dateCreated", ascending: false)]
        request.predicate = NSPredicate(format: "category == %@", budgetCategory)
        return request
    }
}


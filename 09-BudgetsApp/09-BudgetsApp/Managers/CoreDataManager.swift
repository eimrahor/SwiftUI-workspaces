//
//  CoreDataManager.swift
//  09-BudgetsApp
//
//  Created by Emirhan İmrahor on 13.02.2025.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private var persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "BudgetModel")
        persistentContainer.loadPersistentStores { desc, err in
            if let err {
                fatalError("Unable to initialize Core Data stack \(err)")
            }
        }
    }
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
}

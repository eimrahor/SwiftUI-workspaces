//
//  _9_BudgetsAppApp.swift
//  09-BudgetsApp
//
//  Created by Emirhan İmrahor on 13.02.2025.
//

import SwiftUI

@main
struct _9_BudgetsAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}

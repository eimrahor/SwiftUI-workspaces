//
//  BudgetSummaryView.swift
//  09-BudgetsApp
//
//  Created by Emirhan İmrahor on 18.02.2025.
//

import SwiftUI

struct BudgetSummaryView: View {
    
    @ObservedObject var budgetCategory: BudgetCategory
    
    var body: some View {
        VStack {
            Text("\(budgetCategory.overSpent ? "Overspent" : "Remaining") \(Text(budgetCategory.remainingBudgetTotal as NSNumber, formatter: NumberFormatter.currency))")
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .foregroundStyle(budgetCategory.overSpent ? .red : .green)
        }
    }
}

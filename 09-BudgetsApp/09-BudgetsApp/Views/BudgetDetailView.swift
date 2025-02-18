//
//  BudgetDetailView.swift
//  09-BudgetsApp
//
//  Created by Emirhan İmrahor on 14.02.2025.
//

import SwiftUI
import CoreData

struct BudgetDetailView: View {
    let budgetCategory: BudgetCategory
    @State private var title: String = ""
    @State private var total: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    
    var isFormValid: Bool {
        guard let totalAsDouble = Double(total) else { return false }
        return !title.isEmpty && totalAsDouble > 0
    }
    
    private func saveTransaction() {
        do {
            let transaction = Transaction(context: viewContext)
            transaction.title = title
            transaction.total = Double(total)!
            
            budgetCategory.addToTransaction(transaction)
            try viewContext.save()
            
            title = ""
            total = ""
        } catch {
            print(error)
        }
    }
    
    private func deleteTransaction(_ transaction: Transaction) {
        viewContext.delete(transaction)
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(budgetCategory.title ?? "")
                        .font(.largeTitle)
                    HStack {
                        Text("Budget:")
                        Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                    }.fontWeight(.bold)
                }.padding()
                Spacer()
            }
            
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Total", text: $total)
                } header: {
                    Text("Add Transaction")
                }
                
                HStack {
                    Spacer()
                    Button("Save Transaction") {
                        saveTransaction()
                    }.disabled(!isFormValid)
                    Spacer()
                }
            }
            
            VStack {
                BudgetSummaryView(budgetCategory: budgetCategory)
                
                TransactionListView(request: BudgetCategory.transactionByCategoryRequest(budgetCategory), onDeleteTransaction: deleteTransaction)
            }
            
            Spacer()
        }.padding()
    }
}

//
//  AddBudgetCategoryView.swift
//  09-BudgetsApp
//
//  Created by Emirhan İmrahor on 13.02.2025.
//

import SwiftUI

struct AddBudgetCategoryView: View {
    
    @State private var title: String = ""
    @State private var total: Double = 100
    @State private var messages: [String] = []
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.managedObjectContext) private var viewContext
    private var budgetCategory: BudgetCategory?
    
    init(budgetCategory: BudgetCategory? = nil) {
        self.budgetCategory = budgetCategory
    }
    
    var isFormValid: Bool {
        messages.removeAll()
        
        if title.isEmpty {
            messages.append("Title is required")
        }
        
        if total <= 0 {
            messages.append("Total should be greater than 0")
        }
        return messages.isEmpty
    }
    
    private func save() {
        do {
            try viewContext.save()
            dismiss()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func saveOrUpdate() {
        if let budgetCategory = budgetCategory {
            let budget = BudgetCategory.byId(budgetCategory.objectID)
            budget.title = title
            budget.total = total
        } else {
            let budgetCategory = BudgetCategory(context: viewContext)
            budgetCategory.title = title
            budgetCategory.total = total
        }
        save()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                Slider(value: $total, in: 0...500,step: 50) {
                    Text("Total")
                } minimumValueLabel: {
                    Text("₺0")
                } maximumValueLabel: {
                    Text("₺500")
                }
                
                Text(total as NSNumber, formatter: NumberFormatter.currency)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ForEach(messages, id: \.self) { message in
                    Text(message)
                }
                
            }.onAppear {
                if let budgetCategory {
                    title = budgetCategory.title ?? ""
                    total = budgetCategory.total
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        if isFormValid {
                            saveOrUpdate()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddBudgetCategoryView()
}

//
//  AddCategoryView.swift
//  SwiftData Categories
//
//  Created by Remo Prozzillo on 24.04.2025.
//


import Foundation
import SwiftUI
import SwiftData

struct AddCategoryView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var category = Category()
    
    var body: some View {
        List {
            Section {
                TextField("Name", text: $category.name)
                //TODO: Add a Picker with some icons to choose from
            } header: {
                Text("New Category")
            }
            
            Section {
                Button("Save") {
                    modelContext.insert(category)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddCategoryView()
}

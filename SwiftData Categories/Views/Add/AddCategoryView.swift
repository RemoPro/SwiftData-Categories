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
    
    @State private var name = ""
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            Section {
                TextField("Name", text: $name)
                //TODO: Add a Picker with some icons to choose from
            } header: {
                Text("New Category")
            }
            
            Section {
                Button("Save") {
                    let categoryNew = Category(name: name)
                    modelContext.insert(categoryNew)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddCategoryView()
}

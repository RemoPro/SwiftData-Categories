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
                HStack {
                    Label("Name", systemImage: "text.justify.left")
                        .labelStyle(.iconOnly)
                    TextField("Name", text: $category.name)
                }
                //TODO: Add a Picker with some icons to choose from
                HStack {
                    Label("Icon", systemImage: category.icon)
                        .labelStyle(.iconOnly)
                    TextField("Icon", text: $category.icon)
                        .textCase(.lowercase)
//                        .onSubmit {
//                            print("icon: \(icon)")
//                            iconPreview = icon.lowercased()
//                            print("iconPreview: \(iconPreview)")
//                        }
                    
                }
            } header: {
                Text("New Category")
            }
            
            Section {
                Button("Save", systemImage: "square.and.arrow.down", action: {
                    modelContext.insert(category)
                    dismiss()
                })
                
            }
        }
    }
}

#Preview {
    AddCategoryView()
}

//
//  EditCategoryView.swift
//  SwiftData Categories
//
//  Created by Remo Prozzillo on 24.04.2025.
//


import Foundation
import SwiftUI

struct EditCategoryView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var category: Category
    
    var body: some View {
        List {
            Section {
                HStack {
                    Label("Name", systemImage: "text.justify.left")
                        .labelStyle(.iconOnly)
                  TextField("Name", text: $category.name.withDefault(value: ""))
                }
                HStack {
                    Label("Icon", systemImage: category.icon ?? "")
                        .labelStyle(.iconOnly)
                  TextField("Icon", text: $category.icon.withDefault(value: ""))
                        .textCase(.lowercase)
                }
            } header: {
                Text("Edit Category")
            }
            
            Button("Close", systemImage: "xmark", action: {
                // close the sheet
                dismiss()
            })
        }
        .navigationTitle(category.name ?? "")
    }
}

#Preview {
    @Previewable @State var category = Category(name: "test123")
    NavigationStack {
        EditCategoryView(category: category)
    }
}

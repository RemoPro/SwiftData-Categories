//
//  EditCategoryView.swift
//  SwiftData Categories
//
//  Created by Remo Prozzillo on 24.04.2025.
//


import Foundation
import SwiftUI

struct EditCategoryView: View {
    
    @Bindable var category: Category
    
    var body: some View {
        List {
            Section {
                TextField("Name", text: $category.name)
            } header: {
                Text("Edit Category")
            }
        }
        .navigationTitle(category.name)
    }
}

#Preview {
    @Previewable @State var category = Category(name: "test123")
    NavigationStack {
        EditCategoryView(category: category)
    }
}

//
//  ContentView.swift
//  SwiftData Categories
//
//  Created by Remo Prozzillo on 24.04.2025.
//

import Foundation
import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query(sort: \Category.name) var categories: [Category]
    @Environment(\.modelContext) var modelContext
    @State private var showSheetAddCategory = false
    @State private var editingCategory: Category?
    
    var body: some View {
        NavigationSplitView {
            List {
                // When no Categories are created show only a "all items" View. That has to be before the ForEach?
                
                // When no items are in the database show
                //                if items.isEmpty {
                //                    ContentUnavailableView("No Items yet.", image: "circle.slash")
                //                }
                
                // AllItems View
                NavigationLink {
                    AllItemsView()
                } label: {
                    Label("All Items", systemImage: "list.dash")
                }
                
                // Categories
                ForEach(categories) { category in
                    // 🔴 NavigationLink to the category which should contain items
                    //                    Text(category.name)
                    // 🔴 Pass the name to the View as it must know which category to display? And then in that View show the + Button for creating new items?
                    //                    NavigationLink(destination: CategoryView(category: category)) {
                    //                        Label(category.name, systemImage: category.icon)
                    //                    }
                    NavigationLink {
                        CategoryDetailView(category: category)
                    } label: {
                        Label(category.name, systemImage: category.icon)
                    }
                    .contextMenu {
                        // Edit
                        Button("Edit", systemImage: "pencil", action: {
                            editingCategory = category
                        })
                        
                        // Delete
                        Button(role: .destructive) {
                            modelContext.delete(category)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    } // contextMenu
                } // ForEach
            } // List
            .sheet(item: $editingCategory) { category in
                EditCategoryView(category: category)
#if os(iOS)
                    .presentationDetents([.height(220)])
#elseif os(macOS)
                    .frame(height: 150)
#endif
            } // sheet
            .navigationTitle("Categories")
            .toolbar {
                ToolbarItem() {
                    //                    AddCategoryButton()
                    Button("Add new category", systemImage: "plus", action: {
                        showSheetAddCategory = true
                    })
                    //                    .keyboardShortcut("n", modifiers: [.command, .option])
                }
            } // toolbar
            .sheet(isPresented: $showSheetAddCategory) {
                AddCategoryView()
#if os(iOS)
                    .presentationDetents([.height(220)])
#elseif os(macOS)
                    .frame(height: 150)
#endif
            } // sheet
        } detail: {
            ContentUnavailableView("Choose a category…", systemImage: "circle.slash")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [
            Category.self
        ], inMemory: true)
}

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
    @State private var showSheetEditCategory = false
    
    var body: some View {
        NavigationStack {
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
                        Button("Edit", systemImage: "pencil", action: {
                            // 🔴 show a sheet for editing the category name so
                            showSheetEditCategory = true
                        })
                        
                        // Delete
                        Button(role: .destructive) {
                            modelContext.delete(category)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    .sheet(isPresented: $showSheetEditCategory) {
                        EditCategoryView(category: category)
                            .presentationDetents([.height(450)])
                    }
                    //                    NavigationLink(value: category) {
                    //                        Text(category.name)
                    //                    }
                    //                    .swipeActions {
                    //                        Button("Löschen", role: .destructive) {
                    //                            modelContext.delete(category)
                    //                        }
                    //                    } // swipeActions
                } // ForEach
            } // List
            .navigationTitle("Categories")
            .toolbar {
                ToolbarItem() {
                    //                    AddCategoryButton()
                    Button("Add new category", systemImage: "plus", action: {
                        showSheetAddCategory = true
                    })
                    .sheet(isPresented: $showSheetAddCategory) {
                        AddCategoryView()
                            .presentationDetents([.height(450)])
                    }
                    //                    .keyboardShortcut("n", modifiers: [.command, .option])
                }
            }
            
//            .navigationDestination(for: Category.self) { category in
//                CategoryEditView(category: category)
//            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [
            Category.self
        ], inMemory: true)
}

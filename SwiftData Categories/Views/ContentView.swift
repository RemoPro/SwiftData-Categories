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
    
    @Query(sort: \Item.name) var items: [Item]
    @Environment(\.modelContext) var modelContext
    @State private var showSheetAddCategory = false
    @State private var editingCategory: Category?
    
    var body: some View {
        NavigationSplitView {
            List {
                
                // AllItems View
                NavigationLink {
                    AllItemsView()
                } label: {
                    Label("All Items", systemImage: "list.dash")
                    Spacer()
                    HStack {
                        Text("\(items.count)")
                            .foregroundStyle(.secondary)
                    }
                }
                
                // Categories
                ForEach(categories) { category in

                    NavigationLink {
                        CategoryDetailView(category: category)
                    } label: {
                        Label(category.name, systemImage: category.icon)
                        HStack {
                            Spacer()
                            Text("\(category.items.count)")
                                .foregroundStyle(.secondary)
                        }
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

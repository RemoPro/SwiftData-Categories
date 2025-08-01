//
//  AllItemsView.swift
//  SwiftData Categories
//
//  Created by Remo Prozzillo on 24.04.2025.
//

// This View shows all Items

import SwiftUI
import SwiftData

struct AllItemsView: View {
    @Query(sort: \Item.name) var items: [Item]
    @Environment(\.modelContext) var modelContext
//    @State private var showSheetAddItem = false
    @State private var editingItem: Item?
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(items) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                        Text(item.category?.name ?? "")
                            .font(.caption)
                    }
                    .contextMenu {
                        // Edit
                        Button("Edit", systemImage: "pencil", action: {
                            // triggers the Edit sheet to open it
                            editingItem = item
                        })
                        
                        // Delete
                        Button(role: .destructive) {
                            modelContext.delete(item)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    } // contextMenu
                } // ForEach
            } // List
            .sheet(item: $editingItem) { item in
                EditItemView(item: item)
#if os(iOS)
                    .presentationDetents([.height(170)])
#elseif os(macOS)
                    .frame(height: 150)
#endif
            } // sheet
            .navigationTitle("All Items")
        }
    }
}

//#Preview {
//    AllItemsView()
//}

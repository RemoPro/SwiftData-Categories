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
    @State private var showSheetAddCategory = false
    @State private var showSheetEditCategory = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                        Text(item.category?.name ?? "")
                            .font(.caption)
                    }
                }
                //TODO: contextMenu for editing and delete
            } // List
            .navigationTitle("All Items")
        }
    }
}

//#Preview {
//    AllItemsView()
//}

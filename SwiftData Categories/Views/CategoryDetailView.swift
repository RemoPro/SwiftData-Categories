import Foundation
import SwiftUI
import SwiftData

// 🔴 This View should only display item.name that are in a category

struct CategoryDetailView: View {
    
    @Bindable var category: Category
    @Environment(\.modelContext) var modelContext
    @State private var showSheetAddItem = false
    @State private var showSheetEditItem = false
    
    var body: some View {
        NavigationStack {
            List {
                // When no Categories are created show only a "all items" View. That has to be before the ForEach?
                
                // When no items are in the database show
//                if items.isEmpty {
//                    ContentUnavailableView("No Items yet.", image: "circle.slash")
//                }
                ForEach(category.items) { item in
                    // 🔴 Text
//                    ForEach(category.items, id: \.self) { item in
//                        Text(item.name)
//                    }
                    
//                        .contextMenu {
//                    Button("Edit", systemImage: "pencil", action: {
//                        // 🔴 show a sheet for editing the category name so
//                    showSheetEditCategory = true
//                    })
                    // 🔴 I'd like more that way for delete as it isn't easy accidentinally triggered
                    // role: .destructive is only available with this "bad" way with the Label on the end?
//                            Button(role: .destructive) {
//                                modelContext.delete(category)
//                            } label: {
//                                Label("Delete", system: "trash")
//                            }
//                        }
                    
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
            .navigationTitle(category.name)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
//                    AddCategoryButton()
                    Button("Add new Item", systemImage: "plus", action: {
                        showSheetAddItem = true
                    })
                    
//                    .keyboardShortcut("n", modifiers: [.command, .option])
                }
            }
            .sheet(isPresented: $showSheetAddItem) {
                AddItemView(category: category)
                    .presentationDetents([.height(450)])
            }
//            .navigationDestination(for: Item.self) { item in
//                ItemEditView(item: item)
//            }
        }
    }
}

//#Preview {
//    @Previewable @State var category = Category
//   CategoryDetailView(category: category)
//        .modelContainer(for: [
//            Category.self
//        ], inMemory: true)
//}

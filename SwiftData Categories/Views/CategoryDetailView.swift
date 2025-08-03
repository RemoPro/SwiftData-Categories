import Foundation
import SwiftUI
import SwiftData

// This View shows only items that are in a category

struct CategoryDetailView: View {
    
    @Bindable var category: Category
    @Environment(\.modelContext) var modelContext
    @State private var showSheetAddItem = false
    @State private var editingItem: Item?
    
    var body: some View {
        NavigationStack {
            List {
                
                // Show the items sorted alphabetically
                ForEach(category.items.sorted { $0.name.localizedCompare($1.name) == .orderedAscending }) { item in
                    
                    Text(item.name)
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
            .navigationTitle(category.name)
            .toolbar {
                ToolbarItem() {
                    Button("Add new Item", systemImage: "plus", action: {
                        showSheetAddItem = true
                    })
                    
                    //                    .keyboardShortcut("n", modifiers: [.command, .option])
                }
            } // toolbar
            .sheet(isPresented: $showSheetAddItem) {
                AddItemView(category: category)
#if os(iOS)
                    .presentationDetents([.height(220)])
#elseif os(macOS)
                    .frame(height: 150)
#endif
            } // sheet
        } // NavigationStack
    }
}


//#Preview {
//    @Previewable @State var category = Category
//   CategoryDetailView(category: category)
//        .modelContainer(for: [
//            Category.self
//        ], inMemory: true)
//}

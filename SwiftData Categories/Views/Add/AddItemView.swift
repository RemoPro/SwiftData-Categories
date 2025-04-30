import Foundation
import SwiftUI
import SwiftData

struct AddItemView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Bindable var category: Category
    @State private var name = ""
    
//    @State private var item = Item(category: Category())
//    @State private var selectedCategory: Category? = nil
    
//    @Binding var selectedCategory: Category
    
    
    var body: some View {
        List {
            Section {
                TextField("Name", text: $name)
//                TextField("Name", text: $item.name)
                
                // Picker categories ForEach
//                Picker("Kategorie", selection: $selectedCategory) {
//                    ForEach(categories, id: \.self) { category in
//                        Label(category.name, system: category.icon)
//                            .tag(category)
//                    } // ForEach
//                } // Picker
                
            } header: {
                Text("New Item")
            }
            
            Section {
                Button("Save") {
                    let itemNew = Item(name: name, category: category)
                    modelContext.insert(itemNew)
//                    modelContext.insert(item)
                    dismiss()
                }
            }
        }
    }
}

//#Preview {
//    AddItemView()
//}

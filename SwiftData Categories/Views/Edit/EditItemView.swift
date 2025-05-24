import Foundation
import SwiftUI

struct EditItemView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var item: Item
    
    var body: some View {
        List {
            Section {
              TextField("Name", text: $item.name.withDefault(value: ""))

                // Hier kommt Category
            } header: {
                Text("Edit Item")
            }
            
            Button("Close", systemImage: "xmark", action: {
                // close the sheet
                dismiss()
            })
        }
        .navigationTitle(item.name ?? "")
    }
}

//#Preview {
//    @Previewable @State var item = Item(name: "test123")
//    NavigationStack {
//        ItemEditView(item: item)
//    }
//}

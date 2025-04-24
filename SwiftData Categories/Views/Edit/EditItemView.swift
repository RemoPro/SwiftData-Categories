import Foundation
import SwiftUI

struct EditItemView: View {
    
    @Bindable var item: Item
    
    var body: some View {
        List {
            Section {
                TextField("Name", text: $item.name)
                
                // Hier kommt Category
            } header: {
                Text("Edit Item")
            }
        }
        .navigationTitle(item.name)
    }
}

//#Preview {
//    @Previewable @State var item = Item(name: "test123")
//    NavigationStack {
//        ItemEditView(item: item)
//    }
//}

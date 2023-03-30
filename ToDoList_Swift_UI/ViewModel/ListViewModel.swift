//
//  ListViewModel.swift
//  ToDoList_Swift_UI
//
//  Created by Andrew  on 3/30/23.
//

import Foundation

/* crud functions
 
 create
 read
 update
 delete
 
 */

class ListViewModel : ObservableObject {
    
    @Published var items: [ItemModel] = []
    let itemsKey : String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        
        let newItems = [
            ItemModel(title: "This is the first title", isCompleted: false),
            ItemModel(title: "This is the second title", isCompleted: true),
            ItemModel(title: "This is third title", isCompleted: false)
        ]
        
        items.append(contentsOf: newItems)
        
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        
        /*if let index = items.firstIndex { existingItem in
            return existingItem.id == item.id
        } {
            
        } */
        
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}

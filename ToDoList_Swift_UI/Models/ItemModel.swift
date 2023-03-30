//
//  ItemModel.swift
//  ToDoList_Swift_UI
//
//  Created by Andrew  on 3/30/23.
//

import Foundation

//immutable struct - all items inside struct are LET

struct ItemModel: Identifiable, Codable {
    
    let id : String
    let title : String
    let isCompleted : Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}

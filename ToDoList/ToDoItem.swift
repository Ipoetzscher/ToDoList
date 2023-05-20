//
//  ToDoItem.swift
//  ToDoList
//
//  Created by India Poetzscher on 5/20/23.
//

import Foundation

class ToDoItem {
    var title = ""
    var isImportant = false
    
    init(title: String, isImportant: Bool = false) {
        self.title = title
        self.isImportant = isImportant
    }
    
}


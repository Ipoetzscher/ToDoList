//
//  NewToDoView.swift
//  ToDoList
//
//  Created by India Poetzscher on 5/20/23.
//

import SwiftUI

struct NewToDoView: View {
    
    //@Binding var toDoItems: [ToDoItem]
    @Environment(\.managedObjectContext) var context
    @Binding var showNewTask: Bool
    @State var title: String
    @State var isImportant: Bool
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Add a new task")
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            TextField("Type here...", text: $title)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding(.horizontal)
            Toggle(isOn: $isImportant) {
                Text("Important?")
            }.padding(.horizontal)
            Button {
                self.addTask(title: self.title, isImportant: self.isImportant)
                self.showNewTask = false
            } label: {
                Text("Add")
            }
        }
    }
    
    func addTask(title: String, isImportant: Bool = false) {
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        task.isImportant = isImportant
                
        do {
                    try context.save()
        } catch {
                    print(error)
        }
    }
    
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(showNewTask: .constant(true)
, title: "", isImportant: false)
    }
}

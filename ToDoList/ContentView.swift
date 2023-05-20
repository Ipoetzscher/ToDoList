//
//  ContentView.swift
//  ToDoList
//
//  Created by India Poetzscher on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(
            entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
        
    var toDoItems: FetchedResults<ToDo>
    
    @State private var showNewTask = false
    
    var body: some View {
        VStack {
            HStack {
                Text("To Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer()
                Button {
                    self.showNewTask = true
                } label: {
                    Text("+")
                        .font(.system(size: 28))
                }
            }.padding()
            Spacer()
            List {
                ForEach(toDoItems) { item1 in
                    
                    if (item1.isImportant) {
                        Text("‼️ \(item1.title ?? "no title")")
                    } else {
                        Text(item1.title ?? "no title")
                    }
                }.onDelete(perform: deleteTask)
            }
            .listStyle(.plain)
        }
        if showNewTask {
            NewToDoView(showNewTask: $showNewTask, title: "", isImportant: false)
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.3)))
            
        }
    }
    
    private func deleteTask(offsets: IndexSet) {
            withAnimation {
                offsets.map { toDoItems[$0] }.forEach(context.delete)

                do {
                    try context.save()
                } catch {
                    print(error)
                }
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

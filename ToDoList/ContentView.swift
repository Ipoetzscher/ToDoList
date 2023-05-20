//
//  ContentView.swift
//  ToDoList
//
//  Created by India Poetzscher on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var toDoItems: [ToDoItem] = []
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
                        Text("‼️ \(item1.title)")
                    } else {
                        Text(item1.title)
                    }
                }
            }
            .listStyle(.plain)
        }
        if showNewTask {
            NewToDoView(toDoItems: $toDoItems, showNewTask: $showNewTask, title: "", isImportant: false)
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.3)))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

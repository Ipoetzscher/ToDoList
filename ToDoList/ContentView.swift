//
//  ContentView.swift
//  ToDoList
//
//  Created by India Poetzscher on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("To Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer()
                Button {
                    
                } label: {
                    Text("+")
                        .font(.system(size: 28))
                }

            }.padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

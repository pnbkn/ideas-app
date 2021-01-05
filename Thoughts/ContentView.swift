//
//  ContentView.swift
//  Thoughts
//
//  Paul Blackburn CIS 137
//  Copyright © 2020 Paul Blackburn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var thoughtStore : ThoughtStore = ThoughtStore(thoughts: thoughtData)
    
    var body: some View {
        NavigationView {
            List {
                ForEach (thoughtStore.thoughts) { thought in
                    ListCell(thought: thought)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
        .navigationBarTitle(Text("Thoughts"))
            .navigationBarItems(leading: NavigationLink(destination: AddNewThought(thoughtStore: self.thoughtStore)) {
                Text("Add Thought")
                    .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    
    func deleteItems(at offets: IndexSet) {
        thoughtStore.thoughts.remove(atOffsets: offets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        thoughtStore.thoughts.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {
    
    var thought: Thought
    var body: some View {
        
        NavigationLink(destination: ThoughtDetail(selectedThought: thought)) {
            HStack {
                Text(thought.name)
//                Text(thought.description)
            }
        }
    }
}

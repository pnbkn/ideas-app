//
//  AddNewThought.swift
//  Thoughts
//
//  Paul Blackburn CIS 137
//  Copyright © 2020 Paul Blackburn. All rights reserved.
//

import SwiftUI
import CoreLocation

struct AddNewThought: View {
    
    @ObservedObject var thoughtStore : ThoughtStore
    @State var name: String = ""
    @State var description: String = ""
    @State var locationName: String = ""
    //@State var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        
        Form {
            Section(header: Text("Thought Details")) {
                TextField("Name your thought", text: $name)
                TextField("Describe your thought", text: $description)
                .lineLimit(100)
                .multilineTextAlignment(.leading)
                .frame(minHeight: 100, maxHeight: .infinity, alignment: .topLeading)
                TextField("Where did you have this thought", text: $locationName)
            }
            
            Button(action: addNewThought) {
                Text("Add Thought")
            }
        }
    }
    func addNewThought() {
        let newThought = Thought(id: UUID().uuidString, name: name, description: description, locationName: locationName)
        
        thoughtStore.thoughts.append(newThought)
    }
}

struct DataInput: View {
    
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    .padding()
    }
}

struct AddNewThought_Previews: PreviewProvider {
    static var previews: some View {
        AddNewThought(thoughtStore: ThoughtStore(thoughts: thoughtData))
    }
}

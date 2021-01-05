//
//  ThoughtDetail.swift
//  Thoughts
//
//  Paul Blackburn CIS 137
//  Copyright © 2020 Paul Blackburn. All rights reserved.
//

import SwiftUI

struct ThoughtDetail: View {
    
    let selectedThought: Thought
    @State private var showMap = false
    //set up layout for detail page
    
    var body: some View {
        Form {
            Section() {
                Text(selectedThought.name)
                    .font(.headline)
                Text(selectedThought.description)
                    .font(.body)
                    .lineLimit(100)
                    .multilineTextAlignment(.leading)
                    .frame(minHeight: 100, maxHeight: .infinity, alignment: .topLeading)
                Text(selectedThought.locationName)
                    .font(.body)
                Spacer()
                    .frame(height:50)
                HStack {
                    Button(action: { self.showMap = true }) {
                      Image(systemName: "mappin.and.ellipse")
                    }
                    .sheet(isPresented: $showMap) {
                      LocationMap(showModal: self.$showMap, thought: self.selectedThought)

                    }
                    Text(selectedThought.locationName)
                    .font(.subheadline)
                }
            }
        }
    }
}

struct ThoughtDetail_Previews: PreviewProvider {
    static var previews: some View {
        ThoughtDetail(selectedThought: thoughtData[0])
    }
}

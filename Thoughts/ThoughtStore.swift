//
//  ThoughtStore.swift
//  Thoughts
//
//  Paul Blackburn CIS 137
//  Copyright © 2020 Paul Blackburn. All rights reserved.
//

import SwiftUI
import Combine

class ThoughtStore : ObservableObject {
    
    @Published var thoughts: [Thought]
    
    init(thoughts: [Thought] = []) {
        self.thoughts = thoughts
    }
}

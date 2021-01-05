//
//  LocationMap.swift
//  Thoughts
//
// Paul Blackburn CIS 137

import SwiftUI
import CoreLocation

struct LocationMap: View {
  @Binding var showModal: Bool
  var thought: Thought

  var body: some View {
    VStack {
     MapView(coordinate: thought.coordinate)
      HStack {
        Text(self.thought.locationName)
        Spacer()
        Button("Done") { self.showModal = false }
      }
      .padding()
    }
  }
}

struct LocationMap_Previews: PreviewProvider {
  static var previews: some View {
    LocationMap(showModal: .constant(true), thought: thoughtData[0])
  }
}


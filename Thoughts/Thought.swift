//
//  Thought.swift
//  Thoughts
//
//  Paul Blackburn CIS 137
//  Copyright © 2020 Paul Blackburn. All rights reserved.
//
import MapKit
import SwiftUI

struct Thought: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var locationName: String
    var coordinate: CLLocationCoordinate2D
}

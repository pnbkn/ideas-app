//
//  LocationManager.swift
//  Thoughts
//
//  Paul Blackburn CIS 137
//  Copyright © 2020 Paul Blackburn. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {

    private let locationManager = CLLocationManager()
    @Published var location: CLLocation?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let location = locations.last else {
            return
        }
        DispatchQueue.main.async {
            self.location = location
        }
        
    }
}

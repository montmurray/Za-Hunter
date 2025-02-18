//
//  LocationManager.swift
//  'Za Hunter
//
//  Created by Tessa Murray on 2/18/25.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    var locationManager = CLLocationManager()
    override init() {

            super.init()

            locationManager.delegate = self

            locationManager.requestWhenInUseAuthorization()

            locationManager.startUpdatingLocation()

        }
}

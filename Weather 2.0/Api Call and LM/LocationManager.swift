//
//  LocationManager.swift
//  Weather 2.0
//
//  Created by Stefan Ruzic on 13.10.17..
//  Copyright © 2017. Stefan Ruzic. All rights reserved.
//

import Foundation

import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    // MARK:- LocationManager

    private  var locationManager: CLLocationManager
    var currentLocation: CLLocation
    
    static let shared: LocationManager = LocationManager()
    // MARK:- Init LocationManager
    override  init(){
        locationManager = CLLocationManager()
        currentLocation = CLLocation(latitude: 0, longitude: 0)
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = locations.last!
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\n\n Location didFailWithError : \(error)")
    }
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    func stopUpdatingLocation(){
        locationManager.stopUpdatingLocation()
    }
    func getCurrentLocation () -> CLLocation{
        return self.currentLocation
    }
    func askForPermitions() {
        locationManager.requestWhenInUseAuthorization()
    }
}

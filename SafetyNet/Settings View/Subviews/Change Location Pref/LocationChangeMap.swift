//
//  LocationChangeMap.swift
//  SafetyNet
//
//  Created by Haden Stuart on 11/21/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

struct LocationChangeMap: UIViewRepresentable {
    
    let locationManager = CLLocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        view.showsUserLocation = true

        if (locationManager.authorizationStatus == CLAuthorizationStatus.authorizedWhenInUse) {
             self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
             self.locationManager.startUpdatingLocation()

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                let locValue:CLLocationCoordinate2D = self.locationManager.location!.coordinate
                print("CURRENT LOCATION = \(locValue.latitude) \(locValue.longitude)")

                let coordinate = CLLocationCoordinate2D(
                    latitude: locValue.latitude, longitude: locValue.longitude)
                let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                view.setRegion(region, animated: true)

            })
        } else {
            // Enable location services pls
        }

    }
}

//
//  ResourceDetailView.swift
//  SafetyNet
//
//  Created by Sam Gass on 10/17/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI
import MapKit

struct ResourceDetailView: View {
    var db: OpaquePointer?
    var id: Int
    @State private var centerCoordinate = CLLocationCoordinate2D()
    
    var body: some View {
        let resource = getResource(db: db!, id: id)
        MapView(resource: resource).ignoresSafeArea()
        Text(resource.name1).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        Text(resource.name2).font(.headline)
        Text("Call: \(resource.phone)").font(.subheadline)
        Text("Website: \(resource.website)").font(.subheadline)
        Text("Address: \(resource.street1)\n\(resource.street2)").font(.subheadline)
    }
}

struct MapView: UIViewRepresentable {
    var resource: Resource
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(resource.latitude), longitude: CLLocationDegrees(resource.longitude))
        
        mapView.region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003))
        
        
        let annotation = MKPointAnnotation()
        annotation.title = resource.name1
        annotation.subtitle = resource.name2
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        
        return mapView
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
}

struct ResourceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("sorry no preview")
        //ResourceDetailView()
    }
}

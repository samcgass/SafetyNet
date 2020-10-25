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
        VStack {
            let resource = getResource(db: db!, id: id)
            MapView(resource: resource).ignoresSafeArea().frame(height: 225, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            ScrollView {
                Text(resource.name1)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center)
                    .padding(.horizontal, 5)
                Text(resource.name2)
                    .font(.headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 5)
                if resource.street2.isEmpty {
                    Text("\(resource.street1)")
                        .font(.headline)
                        .fontWeight(.regular)
                        .padding(.vertical, 5)
                }
                else {
                    VStack {
                        Text(resource.street1)
                            .font(.headline)
                            .fontWeight(.regular)
                        Text(resource.street2)
                            .font(.headline)
                            .fontWeight(.regular)
                    }.padding(5)
                }

                ButtonView(buttonLabel: resource.phone, buttonColor: Color(red: 25/255, green: 160/255, blue: 235/255), buttonAction: {
                    let phoneLink = "tel://" + resource.phone.components(separatedBy: " ")[0].trimmingCharacters(in: CharacterSet(charactersIn: "-"))
                    UIApplication.shared.open(URL(string: phoneLink)!)
                })
                ButtonView(buttonLabel: "Website", buttonColor: Color(red: 25/255, green: 160/255, blue: 235/255), buttonAction: {
                    UIApplication.shared.open(URL(string: resource.website)!)
                })
            }

            Spacer()
        }

    }
}

struct MapView: UIViewRepresentable {
    var resource: Resource
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(resource.latitude), longitude: CLLocationDegrees(resource.longitude))
        
        mapView.region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        
        let annotation = MKPointAnnotation()
        annotation.title = resource.name1
        annotation.subtitle = resource.name2
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        mapView.selectedAnnotations = [annotation]
        
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

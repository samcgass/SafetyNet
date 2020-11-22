//  EditLocationView.swift
//  SafetyNet
//
//  Created by Haden Stuart on 11/19/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI
import CoreData
import CoreLocation
import MapKit

struct EditLocationView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext

    @State private var currentLocation = CLLocationCoordinate2D()

    let locationPrompt = CLLocationManager()
    var location: Location
        
    @ObservedObject var locationManager = LocationManager()
    var currentLatitude: String { return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)" }
    var currentLongitude: String { return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)" }
    
    var body: some View {
        
        Spacer().frame(height: 15)
        
        Text("Change your preferred location")
            .font(.headline)
            .fontWeight(.bold)
            .padding()
        
        List {
            
            // Location Change Map
            LocationChangeMap().frame(height: 200)
            
            // Update
            Button(action: ({

                self.location.latitude = currentLatitude
                self.location.longitude = currentLongitude
                
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
                
            })) {
                Text("Update")
                    .fontWeight(.bold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            
        }.navigationBarTitle("Edit Location", displayMode: .inline)
        .navigationBarItems(trailing:
                                BuoyButton(destination: Emergency())
        )
        
    }
}
                    
//struct EditLocationView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditLocationView()
//    }
//}

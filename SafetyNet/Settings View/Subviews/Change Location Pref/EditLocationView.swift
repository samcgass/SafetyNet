//  EditLocationView.swift
//  SafetyNet
//
//  Created by Haden Stuart on 11/19/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI
import CoreData
import CoreLocation

struct EditLocationView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext

    let locationPrompt = CLLocationManager()
    var location: Location
    
    @FetchRequest(fetchRequest: Location.allLocationFetchRequest()) var locations: FetchedResults<Location>
    
    @ObservedObject var locationManager = LocationManager()
    var currentLatitude: String { return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    var currentLongitude: String { return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    var body: some View {
        
        Spacer().frame(height: 15)
        
        Text("Change your preferred location")
            .fontWeight(.medium)
        
        List {
            
            // Allow location
            Button (action: {
                locationPrompt.requestWhenInUseAuthorization()
                
            }) {
                Text("Allow Location Services")
                    .fontWeight(.bold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            
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

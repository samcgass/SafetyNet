//
//  ChangeLocationView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 10/31/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ChangeLocationView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Location.allLocationFetchRequest()) var locations: FetchedResults<Location>
    @State private var choice: Int? = 0
    
    var body: some View {
        
            // Location Settings
            List {
                
                // Edit Location
                ForEach(locations) { location in
                    
                    NavigationLink(destination: EditLocationView(location: location)) {
                        VStack(alignment: .leading) {
                            Text("Edit Location")
                                .fontWeight(.medium)
                        }
                    }
                }
                
                Text("Change your desired location")
                    .font(.footnote)
                    .opacity(0.8)
                // End Edit Location
                                
                // Edit Radius
                ForEach(locations) { location in
                    NavigationLink(destination: EditRadiusView(location: location)) {
                        VStack(alignment: .leading) {
                            Text("Edit Radius")
                                .fontWeight(.medium)
                        }
                    }
                }
                
                Text("Change how far away to search for resources")
                    .font(.footnote)
                    .opacity(0.8)
                // End Edit Radius
                
            }.navigationBarTitle("Location", displayMode: .automatic)
            .navigationBarItems(trailing:
                                    BuoyButton(destination: Emergency())
            )
        
    }
}

struct ChangeLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeLocationView()
    }
}

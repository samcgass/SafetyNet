//
//  ChangeLocationView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 10/31/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ChangeLocationView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(fetchRequest: Location.allLocationFetchRequest()) var locations: FetchedResults<Location>
    
    @State private var choice: Int? = 0
    
    var body: some View {
        
            // Location Settings
            List {

                // Radius Setting
                ForEach(locations) { location in
                    NavigationLink(destination: EditLocationView(location: location)) {
                        VStack(alignment: .leading) {
                            Text("Radius")
                                .fontWeight(.medium)
                        }
                    }
                }
                
                Text("Choose how far you'd like to search for resources")
                    .font(.footnote)
                    .opacity(0.8)
                // End Radius Setting
                
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

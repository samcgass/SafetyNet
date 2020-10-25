//
//  ResourceLocalView.swift
//  SafetyNet
//
//  Created by Haden Stuart on 10/18/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ResourceLocalView: View {
        
    @FetchRequest(
        entity: Location.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Location.latitude, ascending: false)
        ]
    ) var fetchedLat: FetchedResults<Location>
    
    @FetchRequest(
        entity: Location.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Location.longitude, ascending: false)
        ]
    ) var fetchedLong: FetchedResults<Location>
    
    @FetchRequest(
        entity: Location.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Location.radius, ascending: false)
        ]
    ) var fetchedRadius: FetchedResults<Location>
        
    var body: some View {

        let currentLat = fetchedLat[0].latitude
        let currentLong = fetchedLong[0].longitude
        let currentRadius = fetchedRadius[0].radius
        let db = openDatabase()
        let resources: [Resource] = getResourceFromLocation(db: db!, latitude: currentLat!, longitude: currentLong!, radius: currentRadius!)
        // Line below should close database I assume
//        let _: () = closeDatabase(db: db)
        
        ScrollView {
            
            LazyVStack {
                // Default resource
                if (resources[0].name1 == "None") {
                    Button(action: {
                        // Resource detail info
                    }) {
                        HStack(spacing: 40) {

                            //Image(systemName: "person")
                            
                            VStack (alignment: .leading) {
                                Text("Default resource")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("resourceText"))
                                Text("This resource appears when no resources found locally")
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }.frame(height: 50.0)
                    .padding()
                    
                } else {
                    // Database resources
                    ForEach(0 ..< resources.count) {index in
                        NavigationLink(destination: ResourceDetailView(db: db!, id: resources[index].id)) {
                                // bug here where row remains highlighted after viewing detailed view and coming back
                                //Image(systemName: "person")

                                VStack (alignment: .leading) {
                                    Text("\(resources[index].name1)")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("resourceText"))
                                    if !resources[index].name2.isEmpty {
                                        Text("\(resources[index].name2)")
                                            .font(.subheadline)
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.gray)
                                    }

                                }
                        }.buttonStyle(CheckInButtonStyle(stripeColor: Color(red: 25/255, green: 160/255, blue: 235/255)))
                        .padding(.vertical, 5)
                        .multilineTextAlignment(.center)
                    }
                }
                
            }.listStyle(GroupedListStyle())
        }.navigationBarItems(trailing:
                                BuoyButton(destination: Emergency())
        )
        
        
    }
}

struct ResourceLocalView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceLocalView()
    }
}

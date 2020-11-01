//
//  EditLocationView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 10/31/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI
import CoreData

struct EditLocationView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext

    var location: Location
    
    @FetchRequest(fetchRequest: Location.allLocationFetchRequest()) var locations: FetchedResults<Location>
    
    @State private var updatedRadius: Double = 0
    @State private var updatedRadiusStr: String = ""
    
    var body: some View {
        
        List {
            
            let currentRadius = locations[0].radius
            let currentRadiusNum = Double(currentRadius!) ?? 0
            
            Text("Change your preferred radius")
                .fontWeight(.medium)
            
            Slider(value: $updatedRadius, in: 1...50, step: 1) {_ in 
                updatedRadiusStr = String(updatedRadius)
            }
            
            Text("Current Radius: \(currentRadiusNum, specifier: "%.f") miles")
                .font(.subheadline)
            
            Text("New Radius: \(updatedRadius, specifier: "%.f") miles")
                .font(.subheadline)
            
            Button(action: ({

                self.location.radius = updatedRadiusStr
                
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
            
        }.navigationBarTitle("Radius", displayMode: .inline)
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

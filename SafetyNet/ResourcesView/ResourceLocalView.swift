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
        entity: User.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \User.zip, ascending: false)
        ]
    ) var fetchedZip: FetchedResults<User>
        
    var body: some View {
        
        let currentZip = fetchedZip[0].zip!
        let db = openDatabase()
        let resources: [Resource] = getResourceFromZip(db: db!, zip: currentZip)
        
        
        VStack {
            
            List {
                
                // Default resource
                Button(action: {
                    // Resource detail info
                }) {
                    HStack(spacing: 40) {

                        Image(systemName: "person")
                        
                        VStack (alignment: .leading) {
                            Text("Default Resource")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("resourceText"))
                            Text("resource for when no local resources appear")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                        }
                    }
                }.frame(height: 50.0)
                .padding()
                
                ForEach(0 ..< resources.count) {index in
                    Button(action: {
                        // Resource detail info
                    }) {
                        HStack(spacing: 40) {

                            Image(systemName: "person")

                            VStack (alignment: .leading) {
                                Text("\(resources[index].name1)")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("resourceText"))
                                Text("\(resources[index].name2)")
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }.frame(height: 50.0)
                    .padding()
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

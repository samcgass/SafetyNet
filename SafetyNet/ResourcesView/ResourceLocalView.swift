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
        entity: ZipCode.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \ZipCode.zip, ascending: false)
        ]
    ) var fetchedZip: FetchedResults<ZipCode>
        
    var body: some View {
        
        let currentZip = fetchedZip[0].zip!
        let db = openDatabase()
        let resources = getResourceFromZip(db: db!, zip: currentZip)
        let resource = getResource(db: db!, id: 1)

        VStack {
            
            List {
                
                // getResource Button
                Button(action: {
                    // Resource detail info
                }) {
                    HStack(spacing: 40) {
                        
                        // Person icon
                        Image(systemName: "person")
                        
                        // Text stack
                        VStack (alignment: .leading) {
                            Text("\(resource.name1)")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text("getResource button")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                        }
                    }
                }.frame(height: 50.0)
                .padding()
                
                // getResourceFromZip button
                Button(action: {
                    // Resource detail info
                }) {
                    HStack(spacing: 40) {
                        
                        // Person icon
                        Image(systemName: "person")
                        
                        // Text stack
                        VStack (alignment: .leading) {
                            Text("\(resources.name1)")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text("getResourceFromZip button")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                        }
                    }
                }.frame(height: 50.0)
                .padding()
                
                
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

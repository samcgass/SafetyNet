//
//  ResourceOnlineView.swift
//  SafetyNet
//
//  Created by Haden Stuart on 10/18/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ResourceOnlineView: View {
    
    var body: some View {
        let db = openDatabase()
        let resources: [OnlineResource] = getOnlineResource(db: db!)
        
        ScrollView {
            
            LazyVStack {
                
                ForEach(resources, id: \.id) {resource in
                    Button(action: {
                        UIApplication.shared.open(URL(string: resource.website)!)
                 }) {
                        VStack (alignment: .leading) {
                            Text("\(resource.name)")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("resourceText"))
                            Text("\(resource.description)")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                            }
                    }.buttonStyle(CheckInButtonStyle(
                        stripeColor: Color(red: 25/255, green: 160/255, blue: 235/255)))
                    .padding(.vertical, 10)

                }
                

                
            }
            
        }
    }
}

struct ResourceOnlineView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceOnlineView()
    }
}

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
                    ButtonView(buttonLabel: resource.name,
                        buttonColor: Color(red: 25/255, green: 160/255, blue: 235/255),
                        buttonAction: {
                            UIApplication.shared.open(URL(string: resource.website)!)
                     })

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

//
//  ResourceOnlineView.swift
//  SafetyNet
//
//  Created by Haden Stuart on 10/18/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ResourceOnlineView: View {
    let db = openDatabase()
    @State private var category = 0
    
    var body: some View {
        let categories = getOnlineResourceCategories(db: db!)
        let resources: [OnlineResource] = getOnlineResource(db: db!, category: categories[category])
        
        ScrollView {
            
            NavigationLink(destination: PickCategoryView(categories: categories, selection: $category)) {
                VStack {
                    Text("\(categories[category])").font(.title).fontWeight(.bold).foregroundColor(.black)
                    HStack {
                        Text("Change Category").font(.body).foregroundColor(.gray)
                        Image(systemName: "arrow.right").foregroundColor(Color("Resource"))
                    }
                }

            }.padding(.top, 10)
            
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
                        stripeColor: Color("Resource")))
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

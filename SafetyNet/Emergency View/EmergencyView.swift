//
//  Emergency.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/1/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct Emergency: View {
    let db = openDatabase()
    
    var body: some View {
        let resources: [EmergencyResource] = getEmergencyResources(db: db!)
        
        ScrollView {
            
            Text("Who would you like to call?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            LazyVStack {
                
                ForEach(resources, id: \.id) {resource in
                    Button(action: {
                        let tel = "tel://" + resource.number
                        guard let url = URL(string: tel) else { return }
                        UIApplication.shared.open(url)
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
                        stripeColor: Color("emergencyButtonAccent")))
                    .padding(.vertical, 10)

                }
                

                
            }
            
        }
        
//        VStack {
//
//            NavigationLink(destination: AreYouSureView(),
//                           isActive: $areYouSure) {
//                            EmptyView()
//            }
//
//            Text("Who would you like to call?")
//                .font(.title)
//                .fontWeight(.bold)
//                .padding()
//
//            Image("hotAirBallon")
//                .resizable()
//                .frame(width: 100, height: 100, alignment: .center)
//
//            Spacer()
//
//            EmergencyButtonView(buttonLabel: "911",
//                       buttonAction: {
//                        self.areYouSure = true
//            })
//
//            // Important: Placeholder phone numbers used to avoid accidents
//
//            EmergencyButtonView(buttonLabel: "National Suicide Hotline",
//                                buttonAction: {
//                        let tel = "tel://411"
//                        guard let url = URL(string: tel) else { return }
//                        UIApplication.shared.open(url)
//            })
//
//            // Important: Placeholder phone numbers used to avoid accidents
//
//            EmergencyButtonView(buttonLabel: "State Suicide Hotline", buttonAction: {
//                let tel = "tel://311"
//                guard let url = URL(string: tel) else { return }
//                UIApplication.shared.open(url)
//            })
//
//            Spacer()
//
//        }
    }
}

struct Emergency_Previews: PreviewProvider {
    static var previews: some View {
        Emergency()
    }
}

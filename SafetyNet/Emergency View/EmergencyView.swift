//
//  Emergency.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/1/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct Emergency: View {
    
//    @Binding var tab: Int
    @State private var areYouSure: Bool = false
    
    var body: some View {
        
        NavigationView {
        
            VStack {
                
                NavigationLink(destination: AreYouSureView(),
                               isActive: $areYouSure) {
                                EmptyView()
                }
                
                Text("Who would you like to call?")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Image("hotAirBallon")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                
                Spacer()
                
                EmergencyButtonView(buttonLabel: "911",
                                    buttonColor: Color.red,
                           buttonAction: {
                            self.areYouSure = true
                })
                
                // Important: Placeholder phone numbers used to avoid accidents
                
                EmergencyButtonView(buttonLabel: "National Suicide Hotline",
                                    buttonColor: Color.red,
                           buttonAction: {
                            let tel = "tel://411"
                            guard let url = URL(string: tel) else { return }
                            UIApplication.shared.open(url)
                })
                
                // Important: Placeholder phone numbers used to avoid accidents
                
                EmergencyButtonView(buttonLabel: "State Suicide Hotline", buttonColor: Color.red, buttonAction: {
                    let tel = "tel://311"
                    guard let url = URL(string: tel) else { return }
                    UIApplication.shared.open(url)
                })
                
                Spacer()
                
            }.navigationBarTitle("Back")
            .navigationBarHidden(true)
        }
    }
}

struct Emergency_Previews: PreviewProvider {
    static var previews: some View {
        Emergency()
    }
}

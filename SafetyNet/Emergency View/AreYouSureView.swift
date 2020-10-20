//
//  AreYouSureView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 9/5/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct AreYouSureView: View {
    
    @State private var dial: Bool = false
    
    var body: some View {
            
        VStack {
            
            NavigationLink(destination: DialingView(recipient: "911"),
                           isActive: $dial) {
                            EmptyView()
            }
            
            Text("Just to make sure, would you like to dial emergency services?")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
            
            Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .frame(width: 200, height: 180, alignment: .center)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.yellow/*@END_MENU_TOKEN@*/)

            Spacer()
            
            EmergencyButtonView(buttonLabel: "Yes", buttonAction: {self.dial = true})
            
            EmergencyButtonView(buttonLabel: "No", buttonAction: {})
            
            Spacer()
            
        }
        
    }
    
}

struct AreYouSureView_Previews: PreviewProvider {
    static var previews: some View {
        AreYouSureView()
    }
}

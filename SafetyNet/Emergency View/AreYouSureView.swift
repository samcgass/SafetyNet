//
//  AreYouSureView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 9/5/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct AreYouSureView: View {
    var body: some View {
        VStack {
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
            
            EmergencyButtonView(buttonLabel: "Yes", buttonColor: Color.red, buttonAction: {})
            
            EmergencyButtonView(buttonLabel: "No", buttonColor: Color.red, buttonAction: {})
            
            Spacer()
        }
    }
}

struct AreYouSureView_Previews: PreviewProvider {
    static var previews: some View {
        AreYouSureView()
    }
}

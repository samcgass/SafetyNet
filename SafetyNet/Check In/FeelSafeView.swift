//
//  FeelSafeView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/2/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct FeelSafeView: View {
    var body: some View {
        
        VStack {
            
            Text("I'm sorry to hear that. Do you feel safe?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("It's okay to share your thoughts. We're hear to support you.")
                .font(.subheadline)
                .fontWeight(.regular)
                .padding()
            
            Spacer()
            
            ButtonView(buttonLabel: "Yes",
                       buttonColor: Color(red: 100/255, green: 200/255, blue: 20/255),
                       buttonAction: {})
            
            
            ButtonView(buttonLabel: "No",
                       buttonColor: Color(red: 210/255, green: 34/255, blue: 45/255),
                       buttonAction: {})
            
        }
        
        
    }
}

struct FeelSafeView_Previews: PreviewProvider {
    static var previews: some View {
        FeelSafeView()
    }
}

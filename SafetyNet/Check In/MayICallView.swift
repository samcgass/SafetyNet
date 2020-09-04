//
//  MayICallView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/2/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct MayICallView: View {
    
    @Binding var tab: Int
    
    var body: some View {
        
        VStack {
            
            Text("May I call someone to help?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            Image("hotAirBallon")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            
            Spacer()
            
            ButtonView(buttonLabel: "Yes, call them please.",
                       buttonColor: Color(red: 100/255, green: 200/255, blue: 20/255),
                       buttonAction: {})
            
            
            ButtonView(buttonLabel: "No, I will seek help",
                       buttonColor: Color(red: 210/255, green: 34/255, blue: 45/255),
                       buttonAction: {})
            
        }
        
    }
}

struct MayICallView_Previews: PreviewProvider {
    static var previews: some View {
        MayICallView(tab: Binding.constant(0))
    }
}

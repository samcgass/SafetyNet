//
//  ThanksLowScoreView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/20/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ThanksLowScoreView: View {
    @Binding var tab: Int
    
    var body: some View {
        
        VStack {
            
            Text("Sorry you are not feeling well. Thank you for checking in.")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("We are hear to help. Reach out to your available resourse when you are ready.")
                .font(.subheadline)
                .fontWeight(.regular)
                .padding()
            
            Spacer()
            
            Image("hotAirBallon")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            
            Spacer()
            
            ButtonView(buttonLabel: "See Resources",
                       buttonColor: Color(red: 210/255, green: 34/255, blue: 45/255),
                       buttonAction: {
                        self.tab = 2
            })
            
        }.navigationBarItems(trailing:
                                BuoyButton(destination: Emergency())
                            )
    }
}

struct ThanksViewLowScore_Previews: PreviewProvider {
    static var previews: some View {
        ThanksLowScoreView(tab: Binding.constant(0))
    }
}


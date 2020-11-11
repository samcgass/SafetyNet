//
//  ThanksView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/2/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ThanksView: View {
    
    @Binding var tab: Int
    
    var body: some View {
        
        VStack {
            
            Text("Thanks for checking in!")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("Check in everyday to keep track of your progress.")
                .font(.subheadline)
                .fontWeight(.regular)
                .padding()
            
            Spacer()
            
            Image("hotAirBallon")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            
            Spacer()
            
            ButtonView(buttonLabel: "See Progress",
                       buttonColor: Color("Good"),
                       buttonAction: {
                        self.tab = 1
            })
            
        }.navigationBarBackButtonHidden(true).navigationBarItems(trailing:
                                BuoyButton(destination: Emergency())
        )
    }
}

struct ThanksView_Previews: PreviewProvider {
    static var previews: some View {
        ThanksView(tab: Binding.constant(0))
    }
}

//
//  FeelSafeView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/2/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct FeelSafeView: View {
    
    @Binding var tab: Int
    @Binding var score: Int64
    @State private var choice: String?
    
    var body: some View {
        
        VStack {
            
            NavigationLink(
                destination: SecondQuestionsView(tab: $tab, score: $score),
                tag: "Yes",
                selection: $choice) {
                EmptyView()
            }
            
            NavigationLink(
                destination: MayICallView(tab: $tab, score: $score),
                tag: "No",
                selection: $choice) {
                EmptyView()
            }
            
            
            
            Text("I'm sorry to hear that. Do you feel safe?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("It's okay to share your thoughts. We're here to support you.")
                .font(.subheadline)
                .fontWeight(.regular)
                .padding()
            
            Spacer()
            
            ButtonView(buttonLabel: "Yes",
                       buttonColor: Color("Good"),
                       buttonAction: {
                        self.choice = "Yes"
                       })
            
            
            ButtonView(buttonLabel: "No",
                       buttonColor: Color("ReallyBad"),
                       buttonAction: {
                        self.choice = "No"
                       })
            
        }.navigationBarItems(trailing:
                                BuoyButton(destination: Emergency())
        )
        
        
    }
}

struct FeelSafeView_Previews: PreviewProvider {
    static var previews: some View {
        FeelSafeView(tab: Binding.constant(0), score: Binding.constant(3))
    }
}

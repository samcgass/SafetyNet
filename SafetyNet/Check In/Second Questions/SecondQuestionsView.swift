//
//  SecondQuestionsView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/2/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct SecondQuestionsView: View {
    
    @Binding var tab: Int
    @Binding var score: Int64
    @State private var start: Bool = false
    
    var body: some View {
        VStack {
            
            NavigationLink(
                destination: QuestionsView(tab: $tab, score: $score),
                isActive: $start) {
                    EmptyView()
            }
            
            Text("Let's answer a few more questions")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("To best understand how you're feeling I'm going to ask you a few more questions.")
                .font(.subheadline)
                .fontWeight(.regular)
                .padding()
            
            Spacer()
            
            Image("hotAirBallon")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            
            Spacer()
            
            ButtonView(buttonLabel: "Let's start",
                       buttonColor: Color("Good"),
                       buttonAction: {
                        self.start = true
            })
            
        }.navigationBarItems(trailing:
                                BuoyButton(destination: Emergency())
        )
    }
}
struct SecondQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        SecondQuestionsView(tab: Binding.constant(0), score: Binding.constant(2))
    }
}

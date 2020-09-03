//
//  SecondQuestionsView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/2/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct SecondQuestionsView: View {
    var body: some View {
        VStack {
            
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
                       buttonColor: Color(red: 100/255, green: 200/255, blue: 20/255),
                       buttonAction: {})
        }
    }
}
struct SecondQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        SecondQuestionsView()
    }
}

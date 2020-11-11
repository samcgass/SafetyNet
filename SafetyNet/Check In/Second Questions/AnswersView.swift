//
//  AnswersView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/2/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct AnswersView: View {
    
    var next: () -> Void
    
    var body: some View {
        
        VStack {
            
            ButtonView(buttonLabel: "Not at all.",
                       buttonColor: Color("Good"),
                       buttonAction: next)
            
            ButtonView(buttonLabel: "A few times.",
                       buttonColor: Color("Okay"),
                       buttonAction: next)
            
            ButtonView(buttonLabel: "Many times.",
                       buttonColor: Color("NotGood"),
                       buttonAction: next)
            
            ButtonView(buttonLabel: "Almost all the time.",
                       buttonColor: Color("ReallyBad"),
                       buttonAction: next)
            
            
        }
        
    }
}

struct AnswersView_Previews: PreviewProvider {
    static var previews: some View {
        AnswersView(next: {})
    }
}

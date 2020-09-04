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
                       buttonColor: Color(red: 100/255, green: 200/255, blue: 20/255),
                       buttonAction: next)
            
            ButtonView(buttonLabel: "A few times.",
                       buttonColor: Color(red: 255/255, green: 191/255, blue: 0/255),
                       buttonAction: next)
            
            ButtonView(buttonLabel: "Many times.",
                       buttonColor: Color(red: 230/255, green: 130/255, blue: 0/255),
                       buttonAction: next)
            
            ButtonView(buttonLabel: "Almost all the time.",
                       buttonColor: Color(red: 210/255, green: 34/255, blue: 45/255),
                       buttonAction: next)
            
            
        }
        
    }
}

struct AnswersView_Previews: PreviewProvider {
    static var previews: some View {
        AnswersView(next: {})
    }
}

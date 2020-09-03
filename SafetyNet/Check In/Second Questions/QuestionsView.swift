//
//  QuestionsView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/2/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct Question1View: View {
    
    @State private var questionNumber = 4
    
    var body: some View {
        
        VStack {
            
            Text("How often were you bothered by the following today:")
            .font(.title)
            .fontWeight(.light)
            .padding()
            .fixedSize(horizontal: false, vertical: true)
            
            questionView(questionNumber: questionNumber)
            .font(.title)
            .fontWeight(.bold)
            .padding()
            .fixedSize(horizontal: false, vertical: true)
            
            AnswersView(next: {})
        }
    }
}

func questionView(questionNumber: Int) -> Text {
    switch questionNumber {
    case 1:
        return Text("Little interest or pleasure in doing things?")
    case 2:
        return Text("Feeling down depressed and hopeless?")
    case 3:
        return Text("Trouble falling or staying asleep, or sleeping too much?")
    case 4:
        return Text("Feeling tired or having little energy?")
    case 5:
        return Text("Poor appetite or overeating?")
    case 6:
        return Text("Feeling bad about yourself — or that you are a failure or have let yourself or your family down?")
    case 7:
        return Text("Trouble concentrating on things, such as reading the newspaper or watching television?")
    case 8:
        return Text("Moving or speaking so slowly that other people could have noticed? Or so fidgety or restless that you have been moving a lot more than usual?")
    case 9:
        return Text("Thoughts that you would be better off dead, or thoughts of hurting yourself in some way?")
    default:
        return Text("Little interest or pleasure in doing things?")
        
    }
}

struct Question1View_Previews: PreviewProvider {
    static var previews: some View {
        Question1View()
    }
}

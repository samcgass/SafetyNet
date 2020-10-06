//
//  QuestionsView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/2/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct QuestionsView: View {
    
    @Binding var tab: Int
    @Binding var score: Int64
    @State private var secondScore: Int = 0
    @State private var questionNumber = 1
    @State private var path: Int? = 0
    
    var body: some View {
        
        VStack {
            
            NavigationLink(
                destination: DescribeMoodView(tab: $tab, score: $score),
                tag: 1,
                selection: $path) {
                    EmptyView()
            }
            
            NavigationLink(
                destination: MayICallView(tab: $tab, score: $score),
                tag: 2,
                selection: $path) {
                    EmptyView()
            }
            
            Text("Today, how often were you bothered by the following:")
                .font(.title)
            .fontWeight(.light)
            .padding()
            .fixedSize(horizontal: false, vertical: true)
            
            questionView(questionNumber: questionNumber)
            .font(.headline)
            .fontWeight(.bold)
                .frame(height: 50, alignment: .leading)
            .padding()
            .allowsTightening(true)
            
            VStack {
                
                ButtonView(buttonLabel: "Not at all.",
                           buttonColor: Color(red: 100/255, green: 200/255, blue: 20/255),
                           buttonAction: {
                            self.questionNumber += 1
                            self.path = finishedCheck(questionNumber: self.questionNumber, score: secondScore)
                           })
                
                ButtonView(buttonLabel: "A few times.",
                           buttonColor: Color(red: 255/255, green: 191/255, blue: 0/255),
                           buttonAction: {
                            self.questionNumber += 1
                            self.secondScore += 1
                            self.path = finishedCheck(questionNumber: self.questionNumber, score: secondScore)
                           })
                
                ButtonView(buttonLabel: "Many times.",
                           buttonColor: Color(red: 230/255, green: 130/255, blue: 0/255),
                           buttonAction: {
                            self.questionNumber += 1
                            self.secondScore += 2
                            self.path = finishedCheck(questionNumber: self.questionNumber, score: secondScore)
                           })
                
                ButtonView(buttonLabel: "Almost all the time.",
                           buttonColor: Color(red: 210/255, green: 34/255, blue: 45/255),
                           buttonAction: {
                            self.questionNumber += 1
                            self.secondScore += 3
                            self.path = finishedCheck(questionNumber: self.questionNumber, score: secondScore)
                           })
                
                
            }
            
            Spacer()
            
        }.navigationBarItems(trailing:
                                BuoyButton(destination: Emergency())
        )
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
        return Text("Feeling bad about yourself or feeling like a failure?")
    case 7:
        return Text("Trouble concentrating on things such as reading or watching TV?")
    case 8:
        return Text("Moving or speaking slowly, or becoming restless or fidgety?")
    case 9:
        return Text("Thoughts that you would be better off dead, or thoughts of hurting yourself?")
    default:
        return Text("Thoughts that you would be better off dead, or thoughts of hurting yourself?")
        
    }
}

func finishedCheck(questionNumber: Int, score: Int) -> Int {
    if questionNumber < 9 {
        return 0
    }
    else if score < 15 {
        return 1
    }
    else {
        return 2
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(tab: Binding.constant(0), score: Binding.constant(4))
    }
}

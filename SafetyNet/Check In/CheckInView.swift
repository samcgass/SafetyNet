//
//  CheckInView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/1/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct CheckInView: View {
    @Binding var tab: Int
    @State var score: Int64 = 0
    @State private var path: Int? = 0
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                    
                    NavigationLink(
                        destination: DescribeMoodView(tab: $tab, score: $score),
                        tag: 1,
                        selection: $path) {
                        EmptyView()
                        
                    }
                    NavigationLink(
                        destination: SecondQuestionsView(tab: $tab, score: $score),
                        tag: 2,
                        selection: $path) {
                        EmptyView()
                        
                    }
                    NavigationLink(
                        destination: FeelSafeView(tab: $tab, score: $score),
                        tag: 3,
                        selection: $path) {
                        EmptyView()
                        
                    }
                    
                }
                
                Text("How are you feeling today?")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                
                ButtonView(buttonLabel: "Great!",
                           buttonColor: Color(red: 30/255, green: 150/255, blue: 50/255),
                           buttonAction: {
                            self.score = 5
                            self.path = 1
                           })
                
                ButtonView(buttonLabel: "Good.",
                           buttonColor: Color(red: 100/255, green: 200/255, blue: 20/255),
                           buttonAction: {
                            self.score = 4
                            self.path = 1
                           })
                
                ButtonView(buttonLabel: "Okay.",
                           buttonColor: Color(red: 255/255, green: 191/255, blue: 0/255),
                           buttonAction: {
                            self.score = 3
                            self.path = 2
                           })
                
                ButtonView(buttonLabel: "Not Good.",
                           buttonColor: Color(red: 230/255, green: 130/255, blue: 0/255),
                           buttonAction: {
                            self.score = 2
                            self.path = 3
                           })
                
                ButtonView(buttonLabel: "Really Bad.",
                           buttonColor: Color(red: 210/255, green: 34/255, blue: 45/255),
                           buttonAction: {
                            self.score = 1
                            self.path = 3
                           })
                
            }.navigationBarTitle("Check-In", displayMode: .large)
            .navigationBarItems(trailing:
                                    BuoyButton(destination: Emergency())
            )
        }
        
    }
}


struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInView(tab: Binding.constant(0))
    }
}


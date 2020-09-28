//
//  DescribeMoodView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/2/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct DescribeMoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Binding var tab: Int
    @Binding var score: Int64
    @State private var entry: String = ""
    @State private var submitText: Int?
    @State private var submitTextLowScore: Bool = false
    
    var body: some View {
        
        
        VStack {
            
            
            NavigationLink(
                destination: ThanksView(tab: $tab),
                tag: 2, selection: $submitText) {
                    EmptyView()
            }
            
            NavigationLink(
                destination: ThanksLowScoreView(tab: $tab),
                tag: 1, selection: $submitText) {
                    EmptyView()
            }
            
            
            Text("Would you like to describe how you're feeling today?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("You can say whatever you like. Maybe think about things that were different today from yesterday that might be affecting how you feel.")
                .font(.subheadline)
                .fontWeight(.regular)
                .padding()
            
            TextField("How do you feel?", text: $entry)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(3)
                .shadow(radius: 3, x: 0, y: 1)
                .padding(.horizontal, 20)
            
            
            Spacer()
            
            ButtonView(buttonLabel: "Done.",
                       buttonColor: Color(red: 100/255, green: 200/255, blue: 20/255),
                       buttonAction: {
                        let checkin = CheckIn(context: self.managedObjectContext)
                        checkin.score = self.score
                        checkin.entry = entry
                        checkin.date = Date()
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            
                        }
                        if self.score < 4 {
                            self.submitText = 1
                        } else {
                            self.submitText = 2
                        }
            })
            
            
            ButtonView(buttonLabel: "Skip for today",
                       buttonColor: Color(red: 210/255, green: 34/255, blue: 45/255),
                       buttonAction: {
                        let checkin = CheckIn(context: self.managedObjectContext)
                        checkin.score = self.score
                        checkin.entry = ""
                        checkin.date = Date()
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            
                        }
                        if self.score < 4 {
                            self.submitText = 1
                        } else {
                            self.submitText = 2
                        }
            })
            
        }
    }
}

struct DescribeMoodView_Previews: PreviewProvider {
    static var previews: some View {
        DescribeMoodView(tab: Binding.constant(0), score: Binding.constant(1))
    }
}

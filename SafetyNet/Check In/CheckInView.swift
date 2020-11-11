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
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: User.allUsersFetchRequest()) var users: FetchedResults<User>

    
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
                let name = users[0].name
                if name == nil || name!.isEmpty {
                    Text("How are you feeling today?")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                }
                else {
                    Text("\(name!), how are you feeling today?")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                ButtonView(buttonLabel: "Great!",
                           buttonColor: Color("Great"),
                           buttonAction: {
                            self.score = 5
                            self.path = 1
                           })
                
                ButtonView(buttonLabel: "Good.",
                           buttonColor: Color("Good"),
                           buttonAction: {
                            self.score = 4
                            self.path = 1
                           })
                
                ButtonView(buttonLabel: "Okay.",
                           buttonColor: Color("Okay"),
                           buttonAction: {
                            self.score = 3
                            self.path = 2
                           })
                
                ButtonView(buttonLabel: "Not Good.",
                           buttonColor: Color("NotGood"),
                           buttonAction: {
                            self.score = 2
                            self.path = 3
                           })
                
                ButtonView(buttonLabel: "Really Bad.",
                           buttonColor: Color("ReallyBad"),
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


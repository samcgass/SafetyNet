//
//  NewUserView2.swift
//  SafetyNet
//
//  Created by Haden Stuart on 9/4/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI
import CoreLocation

struct NewUserView2: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Binding var tab: Int
    @State private var name: String = ""
    @State private var choice: Int? = 0
    let locationPrompt = CLLocationManager()
                    
                var body: some View {
                    VStack(alignment: .center,
                           spacing: 30) {
                            
                            // Top image
                            Image("NewUser1")
                                .frame(height: 260.0)
                                .padding()
                            
                            // Text stack
                            VStack (alignment: .center, spacing: 10) {
                              
                                Text("What should I call you?")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .padding()
                                
                                Text("Your real name or a nickname - it's totally up to you!")
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                                    .frame(width: 300.0, height: 50.0)
                                    .padding()
                            }
                            
                            // Text box
                        TextField("   My name is...", text: self.$name)
                                .frame(width: 300.0, height: 50.0)
                                .background(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.3))
                                .cornerRadius(7)
                             
                            // Link to next view
                            NavigationLink(
                                destination: AskLocationView(tab: $tab),
                                tag: 3,
                                selection: $choice) {
                                    EmptyView()
                                }
                            
                            
                            // Button
                            Button(action: {
                                let username = User(context: self.managedObjectContext)
                                username.name = self.name
                                do {
                                    try self.managedObjectContext.save()
                                } catch {
                                    
                                }
                                // Next view
                                locationPrompt.requestWhenInUseAuthorization()
                                self.choice = 3
                                
                                }) {
                                    Text("Next step")
                                        .foregroundColor(Color.white)
                                        .frame(width: 200.0, height: 50.0)
                                        .background(Color(red: 0.4, green: 0.0, blue: 0.9, opacity: 1.0))
                                }
                                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            // Spacer
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            
                    }
            }
        }

    struct NewUserView2_Previews: PreviewProvider {
        static var previews: some View {
            NewUserView2(tab: Binding.constant(0))
        }
    }

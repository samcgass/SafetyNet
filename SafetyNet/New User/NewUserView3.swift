//
//  NewUserView3.swift
//  SafetyNet
//
//  Created by Haden Stuart on 9/4/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct NewUserView3: View {
    
    @Binding var tab: Int
    @Binding var username: String
    @State private var choice: Int? = 0
        
            var body: some View {
                VStack(alignment: .center,
                    spacing: 40) {
                        
                        // Top image
                        Image("NewUser1")
                            .frame(height: 100.0)
                        
                        
                        // Spacer
                        Spacer()
                        Spacer()
                        
                        // Text stack
                        VStack (alignment: .center, spacing: 0.0) {
                          
                            Text("Nice to meet you, \(username)!")
                                .font(.title)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .frame(height: 70.0)
                                .padding()
                                
                            Text("I hope you enjoy your experience! Click the button below to get started.")
                                .font(.headline)
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .frame(width: 300.0, height: 50.0)
                                .padding()
                        }
                        
                        // Spacer
                        Spacer()
                        
                        // Button
                        Button(action: {
                            self.tab = 0
                            }) {
                                Text("Begin!")
                                    .foregroundColor(Color.white)
                                    .frame(width: 200.0, height: 50.0)
                                    .background(Color(red: 0.4, green: 0.0, blue: 0.9, opacity: 1.0))
                            }
                            .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                            .padding()
                    
                        // Spacer
                        Spacer()
                        Spacer()
                }
        }
    }

// Preview
    struct NewUserView3_Previews: PreviewProvider {
        static var previews: some View {
            NewUserView3(tab: Binding.constant(0), username: Binding.constant(""))
        }
    }

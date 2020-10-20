//
//  NewUserViewZip.swift
//  SafetyNet
//
//  Created by Haden Stuart on 10/17/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct NewUserViewZip: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Binding var tab: Int
    @State private var zip: String = ""
    @State private var choice: Int? = 0
                
                var body: some View {
                    VStack(alignment: .center,
                           spacing: 30) {
                            
                            // Top image
                            Image("NewUser1")
                                .frame(height: 260.0)
                                .padding()
                            
                            // Text stack
                            VStack (alignment: .center, spacing: 10) {
                              
                                Text("Where should I look \n for resources?")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                                    .padding()
                                    .frame(height: 100.0)
                                
                                Text("This could be your current zip code or wherever you would like to see resources at.")
                                    .multilineTextAlignment(.center)
                                    .lineLimit(3)
                                    .frame(width: 300.0, height: 65.0)
                                    .padding()
                            }
                            
                            // Text box
                        TextField(" My zip code is...", text: $zip)
                                .frame(width: 300.0, height: 50.0)
                                .background(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.3))
                                .keyboardType(UIKeyboardType.decimalPad)
                             
                            // Link to next view
                            NavigationLink(
                                destination: NewUserView3(tab: $tab),
                                tag: 2,
                                selection: $choice) {
                                    EmptyView()
                                }

                            
                            // Button
                            Button(action: {
                                let userZip = User(context: self.managedObjectContext)
                                    userZip.zip = zip
                                do {
                                    try self.managedObjectContext.save()
                                } catch {
                                    
                                }
                                // Next view
                                self.choice = 2
                                
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
                            Spacer()
                            
                    }
            }
    }

struct NewUserViewZip_Previews: PreviewProvider {
    static var previews: some View {
        NewUserViewZip(tab: Binding.constant(0))
    }
}

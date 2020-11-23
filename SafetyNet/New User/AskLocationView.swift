//
//  AskLocationView.swift
//  SafetyNet
//
//  Created by Haden Stuart on 11/8/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI
import CoreLocation

struct AskLocationView: View {
    
    @Binding var tab: Int
    @State private var choice: Int? = 0
    
                var body: some View {
                    VStack(alignment: .center,
                           spacing: 30) {
                            
                            // Top image
                            Image("NewUser1")
                                .frame(height: 260.0)
                                .padding()
                        
                            Spacer()
                        
                            // Text stack
                            VStack (alignment: .center, spacing: 10) {
                              
                                Text("Can I find local resources?")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .padding()
                                
                                Text("Local resources are gathered using you current location.")
                                    .multilineTextAlignment(.center)
                                    .lineLimit(5)
                                    .frame(width: 300.0, height: 90.0)
                                    .padding()
                            }
                                                    
                            // Link to next view
                            NavigationLink(
                                destination: NewUserView3(tab: $tab),
                                tag: 2,
                                selection: $choice) {
                                    EmptyView()
                                }
                            
                            
                            // Button
                            Button(action: {

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
                }
        }
}

struct AskLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AskLocationView(tab: Binding.constant(0))
    }
}

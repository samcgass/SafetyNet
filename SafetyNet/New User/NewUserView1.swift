//
//  NewUserView1.swift
//  SafetyNet
//
//  Created by Haden Stuart on 9/4/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct NewUserView1: View {
    
    @Binding var tab: Int
    @State private var choice: Int? = 0
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var locationManager = LocationManager()
    var currentLatitude: String { return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    var currentLongitude: String { return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
            
            var body: some View {
                
                NavigationView {
                    
                    VStack(alignment: .center,
                           spacing: 30) {
                        
                        // Top image
                        Image("NewUser1")
                            .frame(height: 210.0)
                            .padding()
                        
                        // Spacer
                        Spacer()
                        Spacer()
                        
                        // Text stack
                        VStack(alignment: .center, spacing: 10) {

                            Text("Great to see you!")
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding()
                            
                            Text("I'm SafetyNet - your personal wellness companion. Ready to dig in?")
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .frame(width: 300.0, height: 50)
                                .padding()
                        }

                        // Link to next view
                        NavigationLink(
                            destination: NewUserView2(tab: $tab),
                            tag: 1,
                            selection: $choice) {
                            EmptyView()
                        }
                            
                            // Button
                        Button(action: {
                            
                            let userLatitude = Location(context: self.managedObjectContext)
                            userLatitude.latitude = currentLatitude
                            let userLongitude = Location(context: self.managedObjectContext)
                            userLongitude.longitude = currentLongitude
                            let defaultRadius = Location(context: self.managedObjectContext)
                            defaultRadius.radius = "25"
                            do {
                                try self.managedObjectContext.save()
                            } catch { }
                            
                            self.choice = 1
                        }) {
                            Text("Get Started")
                                .foregroundColor(Color.white)
                                .frame(width: 200.0, height: 50.0)
                                .background(Color(red: 0.4, green: 0.0, blue: 0.9, opacity: 1.0))
                        }
                        .cornerRadius(10.0)
                        .padding()
                        
                        // Spacer
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        
                    }
                }
            }
    }


    struct NewUserView1_Previews: PreviewProvider {
        static var previews: some View {
            NewUserView1(tab: Binding.constant(0))
        }
    }

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
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Binding var tab: Int
    @State private var choice: Int? = 0
    let locationPrompt = CLLocationManager()
    
    @ObservedObject var locationManager = LocationManager()
    var currentLatitude: String { return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    var currentLongitude: String { return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
                    
                var body: some View {
                    VStack(alignment: .center,
                           spacing: 30) {
                            
                            // Top image
                        Button (action: {
                            locationPrompt.requestWhenInUseAuthorization()
                            
                        }) {
                            Image("NewUser1")
                                .frame(height: 260.0)
                                .padding()
                        }
                            
                            Spacer()
                        
                            // Text stack
                            VStack (alignment: .center, spacing: 10) {
                              
                                Text("Can I find local resources?")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .padding()
                                
                                Text("If you would like for me to use your location to find local resources then click the balloon above.")
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
                                let userLatitude = Location(context: self.managedObjectContext)
                                userLatitude.latitude = currentLatitude
                                let userLongitude = Location(context: self.managedObjectContext)
                                userLongitude.longitude = currentLongitude
                                let defaultRadius = Location(context: self.managedObjectContext)
                                defaultRadius.radius = "50"
                                do {
                                    try self.managedObjectContext.save()
                                } catch { }
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
                }
        }
}

struct AskLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AskLocationView(tab: Binding.constant(0))
    }
}

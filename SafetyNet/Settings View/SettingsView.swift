//
//  SettingsView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/1/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI
import CoreLocation

struct SettingsView: View {
    
    @State private var setting: Int? = 0
    let locationPrompt = CLLocationManager()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                VStack {
                    
                    // Your name Button
                    NavigationLink(
                        destination: ChangeNameView(),
                        tag: 1,
                        selection: $setting) {
                            EmptyView()
                        }
                    
                    SettingsButtonView(buttonLabel: "Your name",
                               buttonAction: {
                                self.setting = 1
                               })
                    
                    // Notifications Button
                    NavigationLink(
                        destination: ChangeNotificationsView(),
                        tag: 2,
                        selection: $setting) {
                            EmptyView()
                        }
                    
                    SettingsButtonView(buttonLabel: "Notifications",
                               buttonAction: {
                                self.setting = 2
                               })
                    
                    // Location Button
                    NavigationLink(
                        destination: ChangeLocationView(),
                        tag: 3,
                        selection: $setting) {
                            EmptyView()
                        }
                    
                    NavigationLink(
                        destination: NotAuthorizedLocationView(),
                        tag: 5,
                        selection: $setting) {
                            EmptyView()
                        }
                    
                    SettingsButtonView(buttonLabel: "Location",
                               buttonAction: {
                                if (locationPrompt.authorizationStatus == CLAuthorizationStatus.authorizedWhenInUse) {
                                    self.setting = 3
                                } else {
                                    locationPrompt.requestWhenInUseAuthorization()
                                    self.setting = 5
                                }
                               })
                    
                    // Delete Data Button
                    NavigationLink(
                        destination: DeleteDataView(),
                        tag: 4,
                        selection: $setting) {
                        EmptyView()
                    }
                    
                    SettingsButtonView(buttonLabel: "Your data",
                                       buttonAction: {self.setting = 4})
                    
                }.navigationBarTitle("Settings", displayMode: .large)
                
                Spacer().frame(height: 150)
            
            }.navigationBarItems(trailing:
                                    BuoyButton(destination: Emergency())
            )
            
        }
        
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

//
//  SettingsView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/1/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var setting: Int? = 0
    
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
                    
                    SettingsButtonView(buttonLabel: "Location",
                               buttonAction: {
                                self.setting = 3
                               })
                    
                    SettingsButtonView(buttonLabel: "Your data",
                               buttonAction: {})
                    
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

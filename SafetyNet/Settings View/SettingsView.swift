//
//  SettingsView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/1/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
//    @Binding var tab: Int
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
                    
                    // Theme Button
                    NavigationLink(
                        destination: ChangeThemeView(),
                        tag: 3,
                        selection: $setting) {
                            EmptyView()
                        }
                    
                    SettingsButtonView(buttonLabel: "Theme",
                               buttonAction: {
                                self.setting = 3
                               })
                    
                    SettingsButtonView(buttonLabel: "Location",
                               buttonAction: {})
                    
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

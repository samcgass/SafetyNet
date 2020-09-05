//
//  SettingsView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/1/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    
                    SettingsButtonView(buttonLabel: "Your name",
                                       buttonColor: Color.purple,
                               buttonAction: {})
                    
                    SettingsButtonView(buttonLabel: "Notifications",
                                       buttonColor: Color.purple,
                               buttonAction: {})
                    
                    SettingsButtonView(buttonLabel: "Theme",
                                       buttonColor: Color.purple,
                               buttonAction: {})
                    
                    SettingsButtonView(buttonLabel: "Location",
                                       buttonColor: Color.purple,
                               buttonAction: {})
                    
                    SettingsButtonView(buttonLabel: "Your data",
                                       buttonColor: Color.purple,
                               buttonAction: {})
                    
                }.navigationBarTitle("Settings", displayMode: .large)
                
                Spacer().frame(height: 150)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

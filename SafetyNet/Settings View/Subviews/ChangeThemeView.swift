//
//  ChangeThemeView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 9/19/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ChangeThemeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
//    @State var isDarkOn: Bool = false
    @State var isMatchSystemOn: Bool = false
    @State var model = ToggleModel()
    
    var body: some View {
                    
            // Toggles
            List {

                // Dark Mode Toggle
                Toggle(isOn: $model.isDark, label: {
                    Text("Dark mode")
                        .fontWeight(.medium)
                        
                })
                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.4, green: 0.0, blue: 0.9, opacity: 0.6)))
                
                Text("Enable dark mode")
                    .font(.footnote)
                    .opacity(0.8)
                
                // Match System Toggle, Appears if Dark Mode Toggle is On
                if model.isDark {
                    
                    Toggle(isOn: $isMatchSystemOn, label: {
                        Text("Match System Appearance")
                            .fontWeight(.medium)
                    })
                    .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.4, green: 0.0, blue: 0.9, opacity: 0.6)))
                    
                    Text("Have the app's theme match the current theme on your phone")
                        .font(.footnote)
                        .opacity(0.6)
                    
                }
                
            }
            .navigationBarTitle("Change Theme", displayMode: .automatic)
            .navigationBarItems(trailing:
                                    BuoyButton(destination: Emergency())
            )
//            .navigationBarBackButtonHidden(false)
            
//        }
        
    }
    
}

struct ChangeThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeThemeView()
    }
}

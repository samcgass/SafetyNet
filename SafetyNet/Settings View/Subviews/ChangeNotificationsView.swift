//
//  NotificationsView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 9/19/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ChangeNotificationsView: View {
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // Title bar
            HStack {
                Text("Notifications")
                    .font(.largeTitle)
                    .fontWeight(.medium)
            }.padding()
            
            // Notification Toggles
            List {

                // Check-in Toggle
                Toggle(isOn: .constant(true), label: {
                    Text("Check-in reminders")
                })
                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.4, green: 0.0, blue: 0.9, opacity: 0.6)))
                
                Text("Get a daily reminder to check into the app")
                    .font(.footnote)
                    .opacity(0.8)
                
                // Streak Toggle
                Toggle(isOn: .constant(true)) {
                    Text("Streaks")
                }
                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.4, green: 0.0, blue: 0.9, opacity: 0.6)))
                
                Text("Toggle Hint")
                    .font(.footnote)
                    .opacity(0.8)
                
                // Tip Toggle
                Toggle(isOn: .constant(true)) {
                    Text("Health Tips")
                }
                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.4, green: 0.0, blue: 0.9, opacity: 0.6)))
                
                Text("Toggle Hint")
                    .font(.footnote)
                    .opacity(0.8)
                
            }
            
        }
        
    }
    
}

struct ChangeNotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeNotificationsView()
    }
}

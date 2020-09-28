//
//  NotificationsView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 9/19/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

// CAUTION: Toggle colors will not work unless the Target Deployment is changed to iOS 14.0

import SwiftUI

struct ChangeNotificationsView: View {
    
    @State var isCheckInOn: Bool = true
    @State var isStreaksOn: Bool = true
    @State var isHealthTipsOn: Bool = true
    
    var body: some View {
        
//        VStack(alignment: .leading) {
            
            // Title bar
//            HStack {
//                Text("Notifications")
//                    .font(.title)
//                    .fontWeight(.medium)
//            }.padding()
            
            // Notification Toggles
            List {

                // Check-in Toggle
                Toggle(isOn: $isCheckInOn, label: {
                    Text("Check-in reminders")
                        .fontWeight(.medium)
                        
                })
                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.4, green: 0.0, blue: 0.9, opacity: 0.6)))
                
                Text("Get a daily reminder to check into the app")
                    .font(.footnote)
                    .opacity(0.8)
                
                // Streak Toggle
                Toggle(isOn: $isStreaksOn) {
                    Text("Streaks")
                        .fontWeight(.medium)
                }
                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.4, green: 0.0, blue: 0.9, opacity: 0.6)))
                
                Text("Earn streaks for checking in")
                    .font(.footnote)
                    .opacity(0.8)
                
                // Tip Toggle
                Toggle(isOn: $isHealthTipsOn) {
                    Text("Health Tips")
                        .fontWeight(.medium)
                }
                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.4, green: 0.0, blue: 0.9, opacity: 0.6)))
                
                Text("Receive tips throughout the day to encourage a good mood")
                    .font(.footnote)
                    .opacity(0.8)
                
            }.navigationBarTitle("Notfications", displayMode: .automatic)
            
//        }
        
    }
    
}

struct ChangeNotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeNotificationsView()
    }
}

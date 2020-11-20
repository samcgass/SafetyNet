//
//  StreakView.swift
//  SafetyNet
//
//  Created by Jay Cieutat on 11/17/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct StreakView: View {
    
    @FetchRequest(
        entity: CheckIn.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \CheckIn.date, ascending: false)
        ]
    ) var checkins: FetchedResults<CheckIn>
            var body: some View {
            if checkins.count == 0 {
                ButtonView(buttonLabel: "You have no streaks. Try making a Check-in!", buttonColor: Color.blue, buttonAction: {})
            } else {
                ButtonView(buttonLabel: "Streaks: " + String(checkins.count), buttonColor: Color.blue, buttonAction: {})
               // Text("Streaks: " + String(checkins.count))
            }
    }
}

struct StreakView_Previews: PreviewProvider {
    static var previews: some View {
        StreakView()
    }
}

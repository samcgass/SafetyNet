//
//  ContentView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/1/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = initialSelectionValue()
    @Environment(\.managedObjectContext) var managedObjectContext
 
    var body: some View {
        
        if selection == -1 {
            NewUserView1(tab: $selection)
        }
        else {
            TabView(selection: $selection) {
                
                CheckInView(tab: $selection)
                    .tabItem {
                        VStack {
                            Image(systemName: "checkmark.circle")
                            Text("Check-in")
                        }
                    }
                    .tag(0)
                
                ProgressView()
                    .tabItem {
                        VStack {
                            Image(systemName: "chart.bar")
                            Text("Progress")
                        }
                    }
                    .tag(1)
                
                ResourcesView()
                    .tabItem {
                        VStack {
                            Image(systemName: "person.3")
                            Text("Resources")
                        }
                    }
                    .tag(2)
                
                SettingsView()
                    .tabItem {
                        VStack {
                            Image(systemName: "gearshape")
                            Text("Settings")
                        }
                    }
                    .tag(3)
            }
            
        }
        
        
    }
}


func initialSelectionValue() -> Int {
    let hasLaunchedBefore = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
    if hasLaunchedBefore {
        return 0
    }
    else {
        return -1
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

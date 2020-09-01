//
//  ContentView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/1/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            CheckInView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Check-in")
                    }
                }
                .tag(0)
            ProgressView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Progress")
                    }
                }
                .tag(1)
            ResourcesView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Resources")
                    }
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

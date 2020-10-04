//
//  NewUserContentView.swift
//  SafetyNet
//
//  Created by Haden Stuart on 10/3/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct NewUserContentView: View {
    @State private var selection = 0
    @Environment(\.managedObjectContext) var managedObjectContext
 
    var body: some View {
        TabView(selection: $selection){
            CheckInView(tab: $selection)
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "checkmark.circle")
                        Text("Check-in")
                    }
                }
                .tag(0)
                .hiddenNavigationBarStyle()
            
            ProgressView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "chart.bar")
                        Text("Progress")
                    }
                }
                .tag(1)
                .hiddenNavigationBarStyle()
            
            ResourcesView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "person.3")
                        Text("Resources")
                    }
                }
                .tag(2)
                .hiddenNavigationBarStyle()
        }
    }
}

// ViewModifiers.swift
struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier(HiddenNavigationBar())
    }
}

struct NewUserContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserContentView()
    }
}


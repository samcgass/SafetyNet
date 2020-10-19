//
//  ResourcesView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/1/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ResourcesView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .center) {
                
                Picker(selection: $selectedTab, label: Text("Resources")) {
                    Text("In Person").tag(0)
                    Text("Online").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 6)
                
                // Switch views for in-person and online tabs
                if (selectedTab == 0) {
                    ResourceLocalView()
                }
                else if (selectedTab == 1) {
                    ResourceOnlineView()
                }
                
                
            }
            .navigationBarTitle("Resources",
                                 displayMode: .large)
            .navigationBarItems(trailing:
                                BuoyButton(destination: Emergency()))
        }
    }
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
    }
}

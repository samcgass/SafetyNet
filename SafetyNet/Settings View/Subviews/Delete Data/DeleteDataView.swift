//
//  DeleteDataView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 11/12/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct DeleteDataView: View {
    
    var body: some View {
        
            // Your Data Settings
            List {
                
                NavigationLink(destination: DeleteDataConfirmationView()) {
                    Text("Delete all of my data")
                        .fontWeight(.medium)
                }
                
                Text("If you'd like, you can start over and create a clean slate on the app by deleting all of your data.")
                    .font(.callout)
                    .opacity(0.8)
                // End Data Setting
                
            }.navigationBarTitle("Your Data", displayMode: .automatic)
            .navigationBarItems(trailing:
                                    BuoyButton(destination: Emergency())
            )
        
    }
}

struct DeleteDataView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteDataView()
    }
}

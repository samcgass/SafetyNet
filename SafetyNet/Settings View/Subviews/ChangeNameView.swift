//
//  ChangeNameView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 9/19/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ChangeNameView: View {
    
    // This needs to be made public here and on NewUserView2
    @State private var username: String = ""
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            // Title bar
            HStack {
                Text("What should I call you?")
                    .font(.title)
                    .fontWeight(.medium)
            }.padding()
            
            LazyVStack(alignment: .center) {
                
                HStack {
                    Text("Edit your name. Use your real name \n or a nickname - it's totally up to you!")
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .frame(width: 300.0, height: 50.0)
                        .padding()
                }
                
                HStack {
                    TextField("  My name is...", text: $username)
                        .frame(width: 300.0, height: 50.0)
                        .background(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.3))
                }
                
            }
            Spacer()
        }
        
    }
    
}

struct ChangeNameView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeNameView()
    }
}

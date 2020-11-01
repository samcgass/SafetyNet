//
//  ChangeNameView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 9/19/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ChangeNameView: View {
    
    // Core Data property wrappers
    @Environment(\.managedObjectContext) var managedObjectContext
    
    // The user class has an `allUsersFetchRequest` static function that can be used here
    @FetchRequest(fetchRequest: User.allUsersFetchRequest()) var users: FetchedResults<User>
    
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
                
            }
            Spacer()
            
            List {
                Section(header: Text("Tap your name to change it")) {
                    ForEach(self.users) { user in
                        NavigationLink(destination: EditUserView(user: user)) {
                            VStack(alignment: .leading) {
                                Text(user.name ?? "")
                                    .font(.headline)
                            }
                        }
                    }
                }
                .font(.headline)
            }
            
        }.navigationBarItems(trailing:
                                BuoyButton(destination: Emergency())
        )
        
    }
    
}

struct ChangeNameView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeNameView()
    }
}

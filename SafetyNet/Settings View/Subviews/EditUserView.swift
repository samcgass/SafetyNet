//
//  EditUserView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 10/21/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI
import CoreData

struct EditUserView: View {
    // Core Data property wrappers
    @Environment(\.managedObjectContext) var managedObjectContext
    
    // This is used to "go back" when 'Save' is tapped
    @Environment(\.presentationMode) var presentationMode

    var user: User
    
    // Temporary in-memory storage for updating name value of a User
    @State var updatedName: String = ""
    
    var body: some View {
        VStack {
            VStack {
                TextField("Name", text: $updatedName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onAppear {
                        // Set the text field's initial value when it appears
                        self.updatedName = self.user.name ?? ""
                }
            }
            
            VStack {
                Button(action: ({
                    // Set the user's new values from the TextField's Binding and save
                    self.user.name = self.updatedName
                    
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        print(error)
                    }
                    
                    self.presentationMode.wrappedValue.dismiss()
                })) {
                    Text("Save")
                }
            .padding()
            }
        }
    }
}

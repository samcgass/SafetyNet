//
//  DeleteDataConfirmationView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 11/12/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI
import CoreData

struct DeleteDataConfirmationView: View {
    
    @State private var new: Int? = 0
    
    @State private var next: Int = -1
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        
        VStack {
            
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: 120, height: 100, alignment: .center)
                .foregroundColor(Color(red: 0.4, green: 0.0, blue: 0.9, opacity: 1.0))
                .padding()
            
            Text("Are you sure you want to delete all of your data?")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
                .fixedSize(horizontal: false, vertical: true)
            
            Text("This cannot be undone. Once your data has been deleted, you will not be able to recover it. Do this only if you'd like a clean slate.")
                .multilineTextAlignment(.center)
                .padding()
            
            NavigationLink(
                destination: NewUserView1(tab: $next)
                    .navigationBarTitle("")
                    .navigationBarHidden(true),
                tag: 1,
                selection: $new) {
                EmptyView()
            }
            
            Button(action: {
                
                // Delete Data functionality here
                deleteAllRecords()
                
                do {
                    try managedObjectContext.save()
                } catch {
                    print(error)
                }
                
                UserDefaults.standard.set(false, forKey: "hasLaunchedBefore")
                
                self.new = 1
                
            }) {
                Text("Delete My Data")
                    .foregroundColor(Color.white)
                    .frame(width: 200.0, height: 50.0)
                    .background(Color(red: 0.4, green: 0.0, blue: 0.9, opacity: 1.0))
            }
            .cornerRadius(10.0)
            .padding()
            
            Spacer()
            
        }.navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(trailing:
                                BuoyButton(destination: Emergency()))
        
    }
    
    func deleteAllRecords() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let deleteUserFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let deleteUserRequest = NSBatchDeleteRequest(fetchRequest: deleteUserFetch)
        
        let deleteLocationFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Location")
        let deleteLocationRequest = NSBatchDeleteRequest(fetchRequest: deleteLocationFetch)
        
        let deleteCheckInFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CheckIn")
        let deleteCheckInRequest = NSBatchDeleteRequest(fetchRequest: deleteCheckInFetch)
        
        do {
            try context.execute(deleteUserRequest)
            try context.execute(deleteLocationRequest)
            try context.execute(deleteCheckInRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
        
    }
}

struct DeleteDataConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteDataConfirmationView()
    }
}

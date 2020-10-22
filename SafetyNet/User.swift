//
//  User.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 10/21/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import Foundation
import CoreData

// User code generation is turned OFF in the xcdatamodeld file
public class User: NSManagedObject, Identifiable {
    @NSManaged public var name: String?
    @NSManaged public var zip: String?
}

extension User {
    // The @FetchRequest property wrapper in the ChangeNameView will call this function
    static func allUsersFetchRequest() -> NSFetchRequest<User> {
        let request: NSFetchRequest<User> = User.fetchRequest() as! NSFetchRequest<User>
        
        // The @FetchRequest property wrapper in the ChangeNameView requires a sort descriptor
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
          
        return request
    }
}

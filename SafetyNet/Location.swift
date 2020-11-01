//
//  Location.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 10/31/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import Foundation
import CoreData

// User code generation is turned OFF in the xcdatamodeld file
public class Location: NSManagedObject, Identifiable {
    @NSManaged public var latitude: String?
    @NSManaged public var longitude: String?
    @NSManaged public var radius: String?
}

extension Location {
    // The @FetchRequest property wrapper in the ContentView will call this function
    static func allLocationFetchRequest() -> NSFetchRequest<Location> {
        let request: NSFetchRequest<Location> = Location.fetchRequest() as! NSFetchRequest<Location>
        
        // The @FetchRequest property wrapper in the ContentView requires a sort descriptor
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Location.radius, ascending: false)]
        request.fetchLimit = 1
          
        return request
    }
}

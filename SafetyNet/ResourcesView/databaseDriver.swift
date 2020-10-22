//
//  databaseDriver.swift
//  SafetyNet
//
//  Created by Sam Gass on 10/17/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import Foundation
import SQLite3

func openDatabase() -> OpaquePointer? {
    guard let fileURL = Bundle.main.path(forResource: "resources", ofType: "sqlite") else {
        print("file not found")
        return nil
    }
    var db: OpaquePointer?
    guard sqlite3_open(fileURL, &db) == SQLITE_OK else {
        print("error opening database")
        sqlite3_close(db)
        db = nil
        return db
    }
    return db
}

func closeDatabase(db: OpaquePointer?) {
    if db == nil {
        return
    }
    if sqlite3_close(db) != SQLITE_OK {
        print("error closing database")
    }
    return
}

func getResource(db: OpaquePointer, id: Int64) -> Resource {
    var statement: OpaquePointer?
    if sqlite3_prepare_v2(db, "SELECT * FROM Resources WHERE id = \(id) LIMIT 1", -1, &statement, nil) != SQLITE_OK {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("error preparing select: \(errmsg)")
        return Resource(values: Array(repeating: "Prepare Error", count: 17))
    }
    var columns = [String]()
    if sqlite3_step(statement) == SQLITE_ROW {
        var i: Int32 = 0
        while i < 17 {
            if let column = sqlite3_column_text(statement, i) {
                columns.append(String(cString: column))
            }
            else {
                columns.append("")
            }
            i += 1
        }
    }
    else {
        columns = Array(repeating: "0", count: 17)
        print("error no statements returned from query")
    }
    
    if sqlite3_finalize(statement) != SQLITE_OK {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("error finalizing prepared statement: \(errmsg)")
    }

    statement = nil
    return Resource(values: columns)
}

func getResourceFromLocation(db: OpaquePointer, latitude: String, longitude: String) -> [Resource] {
    var statement: OpaquePointer?
    var columns = [String]()
    var result = [Resource]()
    let latitudeEnd = calculateRadius(coordStr: latitude, radiusOffset: 0.5)
    let longitudeEnd = calculateRadius(coordStr: longitude, radiusOffset: 0.5)
    
    if sqlite3_prepare_v2(db, "SELECT * FROM Resources WHERE latitude BETWEEN \(latitude) AND \(latitudeEnd) AND longitude BETWEEN \(longitude) AND \(longitudeEnd)", -1, &statement, nil) != SQLITE_OK {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("error preparing select: \(errmsg)")
    }
    
    while sqlite3_step(statement) == SQLITE_ROW {
        var i: Int32 = 0
        columns = [String]()
        
        while i < 17 {
            if let column = sqlite3_column_text(statement, i) {
                columns.append(String(cString: column))
            }
            else {
                columns.append("")
            }
            i += 1
        }
        result.append(Resource(values: columns))
    }
    
    
    if sqlite3_finalize(statement) != SQLITE_OK {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("error finalizing prepared statement: \(errmsg)")
    }
    
    if (columns.count == 0) {
        return [Resource(values: Array(repeating: "None", count: 17))]
    }
    
    statement = nil
    return result
}

func calculateRadius(coordStr: String, radiusOffset: Float) -> String {
    let coordFloat = (coordStr as NSString).floatValue
    let result = coordFloat + radiusOffset
    
    return String(result)
}

class Resource {
    let id: Int
    let name1, name2, street1, street2, city, state, zip, zip4, county, phone, intake_prompt, intake1, intake2, website: String
    let latitude, longitude: Float
    init(values: Array<String>) {
        self.id = Int(values[0]) ?? 0
        self.name1 = values[1]
        self.name2 = values[2]
        self.street1 = values[3]
        self.street2 = values[4]
        self.city = values[5]
        self.state = values[6]
        self.zip = values[7]
        self.zip4 = values[8]
        self.county = values[9]
        self.phone = values[10]
        self.intake_prompt = values[11]
        self.intake1 = values[12]
        self.intake2 = values[13]
        self.website = values[14]
        self.latitude = Float(values[15]) ?? 0.0
        self.longitude = Float(values[16]) ?? 0.0
    }
}

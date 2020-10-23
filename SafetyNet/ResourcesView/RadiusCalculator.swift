//
//  RadiusCalculator.swift
//  SafetyNet
//
//  Created by Haden Stuart on 10/23/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import Foundation

func calculateLatitudeRadius(coordStr: String, radiusOffset: String) -> String {
    let coordFloat = (coordStr as NSString).floatValue
    let radiusFloat = (radiusOffset as NSString).floatValue

    let earth_radius: Float = 3960.0
    let radians_to_degrees: Float = 180.0/Float.pi

    let distance = (radiusFloat / earth_radius) * radians_to_degrees
    
    return String(coordFloat + distance)
}

func calculateLongitudeRadius(coordLatStr: String, coordLongStr: String, radiusOffset: String) -> String {
    let coordLatFloat = (coordLatStr as NSString).floatValue
    let coordLongFloat = (coordLongStr as NSString).floatValue
    let radiusFloat = (radiusOffset as NSString).floatValue
    
    let earth_radius: Float = 3960.0
    let degrees_to_radians: Float = Float.pi/180.0
    let radians_to_degrees: Float = 180.0/Float.pi

    let r = earth_radius * cos(coordLatFloat * degrees_to_radians)
    let distance = (radiusFloat / r) * radians_to_degrees
    
    return String(coordLongFloat + distance)
}

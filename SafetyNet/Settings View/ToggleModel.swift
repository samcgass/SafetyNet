//
//  ToggleModel.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 10/16/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ToggleModel {
    var isDark: Bool = false {
        didSet {
            SceneDelegate.shared?.window!.overrideUserInterfaceStyle = isDark ? .dark : .light
        }
    }
}

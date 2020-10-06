//
//  BuoyButton.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 10/4/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct BuoyButton<Destination : View>: View {

    var destination:  Destination

    var body: some View {
        NavigationLink(destination: self.destination) { Image(systemName: "lifepreserver.fill") }
    }
}

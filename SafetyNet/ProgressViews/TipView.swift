//
//  TipView.swift
//  SafetyNet
//
//  Created by Jay Cieutat on 10/26/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct TipView: View {
//    var randomTip = Int.random(in: 1...10)
    var randomTip = Int.random(in: 1...3)
    var body: some View {
        switch randomTip {
        case 1:
            ButtonView(buttonLabel: "TIP: Getting enough sleep may improve your mood.", buttonColor: Color.blue, buttonAction: {})
        case 2:
            ButtonView(buttonLabel: "TIP: Make sure to drink enough water!", buttonColor: Color.blue, buttonAction: {})
        case 3:
            ButtonView(buttonLabel: "TIP: 2020 will end!", buttonColor: Color.blue, buttonAction: {})
        default:
            ButtonView(buttonLabel: "TIP: Your mood has improved since yesterday!", buttonColor: Color.blue, buttonAction:{})
        }
    }
}

struct TipView_Previews: PreviewProvider {
    static var previews: some View {
        TipView()
    }
}

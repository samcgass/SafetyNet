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
            Text("Getting enough sleep may improve your mood.").padding(.top, 24)
        case 2:
            Text("Make sure to drink enough water!").padding(.top, 24)
        case 3:
            Text("2020 will end!").padding(.top, 24)
        
        default:
            Text("Your mood has improved since yesterday!").padding(.top, 24)
        }
    }
}

struct TipView_Previews: PreviewProvider {
    static var previews: some View {
        TipView()
    }
}

//
//  BarView.swift
//  SafetyNet
//
//  Created by Jay Cieutat on 10/19/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct BarView: View {
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Capsule().frame(width: 20, height: 200).foregroundColor(.white)
                Capsule().frame(width: 20, height: 200).foregroundColor(.green)
                
            }
            Text("S").padding(.top, 8)
        }
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView()
    }
}

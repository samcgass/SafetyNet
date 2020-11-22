//
//  NotAuthorizedLocationView.swift
//  SafetyNet
//
//  Created by Haden Stuart on 11/22/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct NotAuthorizedLocationView: View {
    var body: some View {
        VStack {
            Text("Please change your location settings for access to location change services.")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.all)
            
            Spacer().frame(height: 50)
            
            Text("Settings > Privacy > Location Services > SafetyNet > While Using The App")
        }
    }
}

struct NotAuthorizedLocationView_Previews: PreviewProvider {
    static var previews: some View {
        NotAuthorizedLocationView()
    }
}

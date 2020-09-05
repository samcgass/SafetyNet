//
//  DialingView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 9/5/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct DialingView: View {
    
    var recipient: String
    
    var body: some View {
        
        VStack {
            
            Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .frame(width: 170, height: 150, alignment: .center)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.yellow/*@END_MENU_TOKEN@*/)
            
            //Animate the elipses like: . -> .. -> ... on loop
            
            Text("Dialing \(recipient)...")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            //Have the phone prompt come up to confirm and dial the call
            
        }
        
    }
    
}

struct DialingView_Previews: PreviewProvider {
    static var previews: some View {
        DialingView(recipient: "911")
    }
}

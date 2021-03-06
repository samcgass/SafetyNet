//
//  EmergencyOptionsButtonView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 9/5/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct EmergencyButtonView: View {
    
    var buttonLabel : String
//    var buttonColor : Color
    var buttonAction : () -> Void
    
    var body: some View {
        
        Button(action: buttonAction) {
            Text(buttonLabel).fontWeight(.bold)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(.leading)
                .opacity(0.6)
        }.buttonStyle(EmergencyButtonStyle())
            .padding(.vertical, 5.0)
    }
}





struct EmergencyButtonStyle: ButtonStyle {
    
//    var stripeColor: Color
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical,37)
            .foregroundColor(.black)
            .background(Color("buttonBackground"))
            .cornerRadius(3)
            .shadow(radius: 3, x: 0, y: 1)
            .overlay(Rectangle()
                .foregroundColor(Color("emergencyButtonAccent"))
                .frame(width: 5)
                        .opacity(0.85)
                .cornerRadius(3, corners: [.topLeft, .bottomLeft]),
                     alignment: .leading)
            .padding(.horizontal, 20)
        
    }
}

struct EmergencyRoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension View {
    func emergencyCornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct EmergencyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyButtonView(buttonLabel: "National\nSuicide\nHotline",
                   buttonAction: {})
    }
}

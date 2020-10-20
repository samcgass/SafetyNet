//
//  SettingsButtonView.swift
//  SafetyNet
//
//  Created by Naeem Ghossein on 9/4/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct SettingsButtonView: View {
    
    var buttonLabel : String
//    var buttonColor : Color
    var buttonAction : () -> Void
    
    var body: some View {
        
        Button(action: buttonAction) {
            Text(buttonLabel).fontWeight(.medium)
                .font(.title2).opacity(0.75)
        }.buttonStyle(SettingsButtonStyle())
            .padding(.vertical, 9.0)
    }
}





struct SettingsButtonStyle: ButtonStyle {
    
//    var stripeColor: Color
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.black)
            .background(Color("buttonBackground"))
            .cornerRadius(3)
            .shadow(radius: 3, x: 0, y: 1)
            .overlay(Rectangle()
                .foregroundColor(Color("settingsButtonAccent"))
                .frame(width: 5)
                .opacity(0.7)
                .cornerRadius(3, corners: [.topLeft, .bottomLeft]),
                     alignment: .leading)
            .padding(.horizontal, 20)
        
    }
}

struct SettingsRoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension View {
    func settingsCornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct SettingsButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonView(buttonLabel: "Great!",
                   buttonAction: {})
    }
}

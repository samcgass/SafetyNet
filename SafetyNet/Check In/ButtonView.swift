//
//  ButtonStyle.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/2/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonLabel : String
    var buttonColor : Color
    var buttonAction : () -> Void
    
    var body: some View {
        
        Button(action: buttonAction) {
            Text(buttonLabel).fontWeight(.light)
                .font(.title)
        }.buttonStyle(CheckInButtonStyle(
            stripeColor: buttonColor))
            .padding(.vertical, 10)
    }
}





struct CheckInButtonStyle: ButtonStyle {
    
    var stripeColor: Color
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(3)
            .shadow(radius: 3, x: 0, y: 1)
            .overlay(Rectangle()
                .foregroundColor(stripeColor)
                .frame(width: 5)
                .cornerRadius(3, corners: [.topLeft, .bottomLeft]),
                     alignment: .leading)
            .padding(.horizontal, 20)
        
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonLabel: "Great!",
                   buttonColor: Color.green,
                   buttonAction: {})
    }
}

//
//  CheckInView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/1/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct GradientBackgroundStyle: ButtonStyle {
    
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

struct CheckInView: View {
    var body: some View {
        
        VStack {
            
            Text("How are you feeling today?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            VStack {
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Great!").fontWeight(.light)
                        .font(.title)
                }.buttonStyle(GradientBackgroundStyle(
                    stripeColor: Color(red: 30/255, green: 150/255, blue: 50/255)))
                    .padding(.vertical)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Good.").fontWeight(.light)
                        .font(.title)
                }.buttonStyle(GradientBackgroundStyle(
                    stripeColor: Color(red: 100/255, green: 200/255, blue: 20/255)))
                .padding(.vertical)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Okay.").fontWeight(.light)
                        .font(.title)
                }.buttonStyle(GradientBackgroundStyle(
                    stripeColor: Color(red: 255/255, green: 191/255, blue: 0/255)))
                .padding(.vertical)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Not Good.").fontWeight(.light)
                        .font(.title)
                }.buttonStyle(GradientBackgroundStyle(
                    stripeColor: Color(red: 230/255, green: 130/255, blue: 0/255)))
                .padding(.vertical)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Really Bad.").fontWeight(.light)
                        .font(.title)
                }.buttonStyle(GradientBackgroundStyle(
                    stripeColor: Color(red: 210/255, green: 34/255, blue: 45/255)))
                .padding(.vertical)
            }
        }

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

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInView()
    }
}


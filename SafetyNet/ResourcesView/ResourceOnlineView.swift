//
//  ResourceOnlineView.swift
//  SafetyNet
//
//  Created by Haden Stuart on 10/18/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ResourceOnlineView: View {
    
    var body: some View {
        
        VStack {
            
            ButtonView(buttonLabel: "Sleep Foundation",
                buttonColor: Color(red: 25/255, green: 160/255, blue: 235/255),
                buttonAction: {
                    UIApplication.shared.open(URL(string: "https://www.sleepfoundation.org/articles/sleep-hygiene")!)
             })
            
            ButtonView(buttonLabel: "Mindfullness Help",
                buttonColor: Color(red: 25/255, green: 160/255, blue: 235/255),
                buttonAction: {
                    UIApplication.shared.open(URL(string: "https://medschool.ucsd.edu/som/fmph/research/mindfulness/mindfulness-resources/Pages/default.aspx")!)
             })
            
            ButtonView(buttonLabel: "Bliss Online Therapy",
                buttonColor: Color(red: 25/255, green: 160/255, blue: 235/255),
                buttonAction: {
                    UIApplication.shared.open(URL(string: "https://cimhs.com/")!)
             })
            
            ButtonView(buttonLabel: "7Cups Support Chatroom",
                buttonColor: Color(red: 25/255, green: 160/255, blue: 235/255),
                buttonAction: {
                    UIApplication.shared.open(URL(string: "https://www.7cups.com/")!)
             })
            
            ButtonView(buttonLabel: "BDI Resources and Support",
                buttonColor: Color(red: 25/255, green: 160/255, blue: 235/255),
                buttonAction: {
                    UIApplication.shared.open(URL(string: "https://www.blackdoginstitute.org.au/resources-support/")!)
             })
            
//            ButtonView(buttonLabel: "Online Self Help Tools",
//               buttonColor: Color(red: 25/255, green: 160/255, blue: 235/255),
//               buttonAction: {
//                    UIApplication.shared.open(URL(string: "https://www.mhanational.org/self-help-tools")!)
//            })
            
            Spacer()
            
        }
    }
}

struct ResourceOnlineView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceOnlineView()
    }
}

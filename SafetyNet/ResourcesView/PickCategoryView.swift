//
//  PickCategoryView.swift
//  SafetyNet
//
//  Created by Sam Gass on 11/10/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct PickCategoryView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var categories: [String]
    @Binding var selection: Int
    
    
    var body: some View {
        
        Spacer()
        
        Text("Select A Category").font(.title).fontWeight(.bold)
        
        Spacer()
        
        Picker(selection: $selection, label: Text("Category")) {
            ForEach(0 ..< categories.count) {
                Text(categories[$0]).tag($0)
            }
        }
        
        Spacer()
        
        ButtonView(buttonLabel: "Select", buttonColor: .blue) {
            self.presentationMode.wrappedValue.dismiss()
        }.padding(.bottom, 5).navigationBarHidden(true)

    }
}

struct PickCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Sorry no preview")
        //PickCategoryView()
    }
}

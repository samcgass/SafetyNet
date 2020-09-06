//
//  GraphView.swift
//  SafetyNet
//
//  Created by Jay Cieutat on 9/4/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct GraphView: View {
    

    
    @State var pickerSelectedItem = 0
    
    var body: some View {
        //MARK: Begin Stack
        ScrollView(.vertical) {
        ZStack {
            VStack {
                
                Text("Your Progress")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                //MARK: Picker
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("This Week").tag(0)
                    Text("All Time").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
             
            //MARK: Graph
                HStack (spacing: 16) {
                    VStack {
                        ZStack (alignment: .bottom) {
                            Capsule().frame(width: 20, height: 200).foregroundColor(.white)
                            Capsule().frame(width: 20, height: 200).foregroundColor(.green)
                            
                        }
                        Text("S").padding(.top, 8)
                    }
                    VStack {
                        ZStack (alignment: .bottom) {
                            Capsule().frame(width: 20, height: 200).foregroundColor(.white)
                            Capsule().frame(width: 20, height: 170).foregroundColor(.orange)
                            
                        }
                        Text("M").padding(.top, 8)
                    }
                    
                    VStack {
                        ZStack (alignment: .bottom) {
                            Capsule().frame(width: 20, height: 200).foregroundColor(.white)
                            Capsule().frame(width: 20, height: 90).foregroundColor(.red)
                            
                        }
                        Text("T").padding(.top, 8)
                    }
                    
                    VStack {
                        ZStack (alignment: .bottom) {
                            Capsule().frame(width: 20, height: 200).foregroundColor(.white)
                            Capsule().frame(width: 20, height: 155).foregroundColor(.orange)
                            
                        }
                        Text("W").padding(.top, 8)
                    }
                    
                    
                    VStack {
                        ZStack (alignment: .bottom) {
                            Capsule().frame(width: 20, height: 200).foregroundColor(.white)
                            Capsule().frame(width: 20, height: 200).foregroundColor(.green)
                            
                        }
                        Text("R").padding(.top, 8)
                    }
                    
                    
                    VStack {
                        ZStack (alignment: .bottom) {
                            Capsule().frame(width: 20, height: 200).foregroundColor(.white)
                            Capsule().frame(width: 20, height: 100).foregroundColor(.red)
                            
                        }
                        Text("F").padding(.top, 8)
                    }
                    
                    
                    
                    VStack {
                        ZStack (alignment: .bottom) {
                            Capsule().frame(width: 20, height: 200).foregroundColor(.white)
                            Capsule().frame(width: 20, height: 155).foregroundColor(.orange)
                            
                        }
                        Text("S").padding(.top, 8)
                    }
                    
                    
                    
                    
            
                }.padding(.top, 24)
                
                VStack(alignment: .leading) {
                    HStack {
                Text("Streak: 7 days!").padding(.top, 26)
                
            Spacer()
                }
                    HStack {
                        Text("Your mood has improved since yesterday!").padding(.top, 24)
                    }
            }
                Spacer()
            } //ZSTACK ENDS HERE
        }
            
            Spacer()
    }.navigationBarTitle("Your Progress")
        //MARK: End Stack
    }
    
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}


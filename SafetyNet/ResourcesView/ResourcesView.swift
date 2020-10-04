//
//  ResourcesView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/1/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct ResourcesView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
                
        VStack (alignment: .center) {
            Text("Resources")
                .font(.title)
                .fontWeight(.semibold)
                .padding([.top], 15)
            
            // Create tabs
            Picker(selection: $selectedTab, label: Text("Resources")) {
                Text("In Person").tag(0)
                Text("Online").tag(1)
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 24)
            
            // Switch views for in-person and online tabs
            if (selectedTab == 0) {
                LocalView()
            }
            else if (selectedTab == 1) {
                OnlineView()
            }
            
            
        }
    }
}

struct LocalView: View {
    var body: some View {
        
        VStack {
            
            List {
                
                // Resource 1
                Button(action: {
                    // Resource info
                }) {
                    HStack(spacing: 40) {
                        
                        // Person icon
                        Image(systemName: "person")
                        
                        // Text stack
                        VStack (alignment: .leading) {
                            Text("John Smith")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text("MD, Psychiatry")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                        }
                    }
                }.frame(height: 50.0)
                .padding()
                
                // Resource 2
                Button(action: {
                    // Resource info
                }) {
                    HStack(spacing: 40) {
                        
                        // Person icon
                        Image(systemName: "person")
                        
                        // Text stack
                        VStack (alignment: .leading) {
                            Text("Abigail Summers")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text("MD, Psychiatry")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                        }
                    }
                }.frame(height: 50.0)
                .padding()
                
                // Resource 3
                Button(action: {
                    // Resource info
                }) {
                    HStack(spacing: 40) {
                        
                        // Person icon
                        Image(systemName: "person")
                        
                        // Text stack
                        VStack (alignment: .leading) {
                            Text("Tim Fowler")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text("MD, Psychiatry")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                        }
                    }
                }.frame(height: 50.0)
                .padding()
                
                // Resource 4
                Button(action: {
                    // Resource info
                }) {
                    HStack(spacing: 40) {
                        
                        // Person icon
                        Image(systemName: "person")
                        
                        // Text stack
                        VStack (alignment: .leading) {
                            Text("Cynthia Newman")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text("MD, Psychiatry")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                        }
                    }
                }.frame(height: 50.0)
                .padding()
                
                // Resource 5
                Button(action: {
                    // Resource info
                }) {
                    HStack(spacing: 40) {
                        
                        // Person icon
                        Image(systemName: "person")
                        
                        // Text stack
                        VStack (alignment: .leading) {
                            Text("Sarah Pearson")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text("MD, Psychiatry")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                        }
                    }
                }.frame(height: 50.0)
                .padding()
                
                // Resource 6
                Button(action: {
                    // Resource info
                }) {
                    HStack(spacing: 40) {
                        
                        // Person icon
                        Image(systemName: "person")
                        
                        // Text stack
                        VStack (alignment: .leading) {
                            Text("Anthony Layne")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text("MD, Psychiatry")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                        }
                    }
                }.frame(height: 50.0)
                .padding()
                
                // Resource 7
                Button(action: {
                    // Resource info
                }) {
                    HStack(spacing: 40) {
                        
                        // Person icon
                        Image(systemName: "person")
                        
                        // Text stack
                        VStack (alignment: .leading) {
                            Text("James Kirkland")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text("MD, Psychiatry")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                        }
                    }
                }.frame(height: 50.0)
                .padding()
                
            }.listStyle(GroupedListStyle())
        }
    }
}

struct OnlineView: View {
    
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
            
            ButtonView(buttonLabel: "Online Self Help Tools",
               buttonColor: Color(red: 25/255, green: 160/255, blue: 235/255),
               buttonAction: {
                    UIApplication.shared.open(URL(string: "https://www.mhanational.org/self-help-tools")!)
            })
            
            Spacer()
            
        }
    }
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
    }
}

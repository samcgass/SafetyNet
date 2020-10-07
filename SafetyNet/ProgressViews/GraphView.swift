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
        NavigationView {
        ScrollView(.vertical) {
        
        ZStack {
            VStack {
                VStack {
               
            }
                //MARK: Picker
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("This Week").tag(0)
                    Text("All Time").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
             
                
                if pickerSelectedItem == 0 {
                VStack(alignment: .leading) {

                    HStack {

                        weekView()
                    }.padding(.horizontal, 75)
                }
                }
                    else if pickerSelectedItem == 1 {
                        VStack(alignment: .leading) {
                            HStack {
                                allTimeView(dataPoints: ChartData.oneMonth.normalized)
                                    .stroke(Color.green)
                                    .frame(width: 300, height: 300)
                                    .border(Color.black)
                            }.padding(.horizontal, 75)                }
                    }
                VStack {
                
                    NavigationLink(destination: CheckInHistoryView()) {
                        Text("Journal")
                            .foregroundColor(.white)
                            .padding(12)
                    }
                    .background(Color.blue)
                    .cornerRadius(12)
                    
                }
                    HStack {
                        Text("Your mood has improved since yesterday!").padding(.top, 24)
                    }
            
            }
            
                Spacer()
            
            } //ZSTACK ENDS HERE
            
        }.navigationBarTitle("Progress", displayMode: .large)
        .navigationBarItems(trailing:
                                    BuoyButton(destination: Emergency())
        )
        //ScrollView ends here
        }.navigationBarTitle("Progress")
        
            
            Spacer()

        //MARK: End Stack
    } ///////
}
    


struct weekView: View {
    var body: some View {
 //MARK: Graph
 //MARK: MAKE BUTON
        
    
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
     .frame(width: 300, height: 300)
     .border(Color.black)
    }
    
 }

struct allTimeView: Shape {
    var dataPoints: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        func point(at ix: Int) -> CGPoint {
            let point = dataPoints[ix]
            let x = rect.width * CGFloat(ix) / CGFloat(dataPoints.count - 1)
            let y = (1 - point) * rect.height
            
            return CGPoint(x: x, y: y)
        }
        
        return Path { p in
            guard dataPoints.count > 1 else { return}
            let start = dataPoints[0]
            p.move(to: CGPoint(x: 0, y: (1 - start) * rect.height))
            
            for idx in dataPoints.indices {
                p.addLine(to: point(at: idx))
            }
        }
    }
}


extension Array where Element == CGFloat {
    var normalized: [CGFloat] {
        if let min = self.min(), let max = self.max() {
            return self.map { ($0 - min) / (max - min)}
        }
        return []
    }
}

struct JournalView: View {
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink(destination: CheckInHistoryView()) {
                    Text("Journal")
                        .padding(12)
                }
                .background(Color.blue)
                .cornerRadius(12)
                .navigationBarTitle(Text("Journal"))
            }
            
        }
    }
    
}
struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}


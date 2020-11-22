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
    
    @FetchRequest(
        entity: CheckIn.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \CheckIn.date, ascending: false)
        ]
    ) var checkins: FetchedResults<CheckIn>
    
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
                    .padding(.horizontal, 6)
             
       
                if pickerSelectedItem == 0 {
                VStack(alignment: .leading) {

                    HStack {
                     //   ScrollView(.horizontal) {
                        weekView()
               //     }
                    }//.padding(.horizontal, 75)
                }
                }
                    else if pickerSelectedItem == 1 {
                        VStack(alignment: .leading) {
                            HStack {
                                if checkins.count < 7 {
                                    emptyAllTimeGraph()
                                }
                                else {
                              //  allTimeView(dataPoints: ChartData.oneMonth.normalized)
                                //    .stroke(Color.green)
                                  //  .frame(width: 350, height: 300)
                                   // .border(Color.black)
                                }
                            }//.padding(.horizontal, 75)
                        }
                    }
                VStack {
                
                    NavigationLink(destination: CheckInHistoryView()) {
                        ButtonView(buttonLabel: "Journal", buttonColor: Color.blue, buttonAction: {})
                    }
                    
                    .cornerRadius(12)
                    
                }
                    HStack {
                       StreakView()
                    }
                    HStack {
                        TipView()
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
    var oneMonth: [CGFloat] = []
    @FetchRequest(
        entity: CheckIn.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \CheckIn.date, ascending: false)
        ]
    ) var checkins: FetchedResults<CheckIn>
    var body: some View {
 //MARK: Graph
        
    
     HStack (spacing: 16) {
        
        // if there are no checkins, this will be shown
        if checkins.count <= 0 {
            Text("  No check-ins yet.\nTry doing a check-in!")
        }
        //Here I need to make the bars dynamic
        else {
            ForEach(checkins, id: \.self) { checkin in
                BarView(score: checkin.score, date: checkin.date!)
   //             oneMonth.append(CGFloat(checkin.score))
                

            }
            
        }
     }.padding(.top, 24)
     .frame(width: 350, height: 300)
     .border(Color.black)
    }
    
 }

//MARK: All Time View
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

//MARK: Empty All Time Graph
// Fix later. Couldn't implement border in an if statment above like weekly graph
struct emptyAllTimeGraph: View {
    var body: some View {
        VStack {
            Text("\t\tNot enough data.\n Try doing more check-ins!")
        }.padding(.top, 24)
        .frame(width: 400, height: 300)
        .border(Color.black)    }
    
}
extension Array where Element == CGFloat {
    var normalized: [CGFloat] {
        if let min = self.min(), let max = self.max() {
            return self.map { ($0 - min) / (max - min)}
        }
        return []
    }
}

//MARK: Journal View
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

//MARK: Preview
struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GraphView()
        }
    }
}


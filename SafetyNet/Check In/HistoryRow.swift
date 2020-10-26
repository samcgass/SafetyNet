//
//  HistoryRow.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/30/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct HistoryRow: View {
    
    var score: Int64
    var entry: String
    var date: Date
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    fileprivate func scoreToText(score: Int64) -> Text {
        switch score {
        case 5:
            return Text("Great")
        case 4:
            return Text("Good")
        case 3:
            return Text("Okay")
        case 2:
            return Text("Not Good")
        case 1:
            return Text("Really Bad")
        default:
            return Text("error")
        }
    }
    fileprivate func scoreToColor(score: Int64) -> Color{
        switch score {
        case 5:
            return Color(red: 30/255, green: 150/255, blue: 50/255)
        case 4:
            return Color(red: 100/255, green: 200/255, blue: 20/255)
        case 3:
            return Color(red: 255/255, green: 191/255, blue: 0/255)
        case 2:
            return Color(red: 230/255, green: 130/255, blue: 0/255)
        case 1:
            return Color(red: 210/255, green: 34/255, blue: 45/255)
        default:
            return Color(red: 255/255, green: 191/255, blue: 0/255)
        }
    }
    
    var body: some View {
        Button(action: {
            
        }) {
            VStack {
                
                HStack {
                    
                    scoreToText(score: score).font(.title)
                    
                    Spacer()
                    
                    Text("\(date, formatter: Self.taskDateFormat)")
                        .foregroundColor(.gray)
                        .font(.caption)
                }.padding(.bottom, 1)
                
                HStack {
                    Text(entry).font(.body)
                    Spacer()
                }
                
                
            }
        }.buttonStyle(CheckInButtonStyle(
                        stripeColor: scoreToColor(score: score)))
        
    }
}

struct HistoryRow_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRow(score: 5, entry: "SwiftUI gives us a number of valuable ways of controlling the way views are aligned, and I want to walk you through each of them so you can see them in action.", date: Date())
    }
}

//
//  BarView.swift
//  SafetyNet
//
//  Created by Jay Cieutat on 10/19/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct BarView: View {
    var score: Int64
    var date: Date
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter
    }()
    
    
    fileprivate func scoreToColor(score: Int64) -> Color {
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
    
    fileprivate func scoreToHeight(score: Int64) -> CGFloat {
        switch score {
        case 5:
            return 200
        case 4:
            return 160
        case 3:
            return 120
        case 2:
            return 80
        case 1:
            return 40
        default:
            return 0
        }
    }
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Capsule().frame(width: 20, height: 200).foregroundColor(.white)
                Capsule().frame(width: 20, height: scoreToHeight(score: score)).foregroundColor(scoreToColor(score: score))
                
            }
            Text("\(date, formatter: Self.taskDateFormat)").fontWeight(.thin)
        }
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(score: 5, date: Date())
    }
}

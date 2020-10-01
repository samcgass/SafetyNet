//
//  CheckInHistoryView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/29/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct CheckInHistoryView: View {
    
    @FetchRequest(
        entity: CheckIn.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \CheckIn.date, ascending: false)
        ]
    ) var checkins: FetchedResults<CheckIn>
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(checkins, id: \.self) { checkin in
                    HistoryRow(score: checkin.score, entry: checkin.entry!, date: checkin.date!)
                        .padding(.vertical, 5)
                        .padding(.horizontal, -10)
                }
            }
            
        }
    }
}

struct CheckInHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInHistoryView()
    }
}

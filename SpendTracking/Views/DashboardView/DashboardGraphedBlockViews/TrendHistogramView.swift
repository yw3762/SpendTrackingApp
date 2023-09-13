//
//  TrendHistogramView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/13/23.
//

import SwiftUI
import Charts

struct TrendHistogramView: View {
    var body: some View {
        Chart {
            BarMark(
                x: .value("Shape Type", "D1"),
                y: .value("Total Count", 5)
            )
            BarMark(
                x: .value("Shape Type", "D2"),
                y: .value("Total Count", 6)
            )
            BarMark(
                x: .value("Shape Type", "D3"),
                y: .value("Total Count", 4)
            )
            BarMark(
                x: .value("Shape Type", "D4"),
                y: .value("Total Count", 4)
            )
            BarMark(
                x: .value("Shape Type", "D5"),
                y: .value("Total Count", 4)
            )
            BarMark(
                x: .value("Shape Type", "D6"),
                y: .value("Total Count", 4)
            )
            BarMark(
                x: .value("Shape Type", "D7"),
                y: .value("Total Count", 4)
            )
        }
            .frame(width: 330, height: 106)
    }
    
}

struct TrendHistogramView_Previews: PreviewProvider {
    static var previews: some View {
        TrendHistogramView()
    }
}

//
//  BreakdownPieChartView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/12/23.
//

import SwiftUI
import Charts

struct BreakdownPieChartView: View {
    var body: some View {
        Chart {
            BarMark(
                x: .value("Shape Type", "Cube"),
                y: .value("Total Count", 5)
            )
            BarMark(
                x: .value("Shape Type", "Sphere"),
                y: .value("Total Count", 6)
            )
            BarMark(
                x: .value("Shape Type", "Pyramid"),
                y: .value("Total Count", 4)
            )
        }
    }
}

struct BreakdownPieChartView_Previews: PreviewProvider {
    static var previews: some View {
        BreakdownPieChartView()
    }
}

//
//  BreakdownPieChartView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/12/23.
//

import SwiftUI
import Charts

private var coffeeSales = [
    (name: "Americano", count: 120),
    (name: "Cappuccino", count: 234),
    (name: "Espresso", count: 62),
    (name: "Latte", count: 625),
    (name: "Mocha", count: 320),
    (name: "Affogato", count: 50)
]

struct BreakdownPieChartView: View {
    var body: some View {
        Chart {
            // Waiting for iOS 17 with Xcode15
//            ForEach(coffeeSales, id: \.name) { coffee in
//                SectorMark(
//                    angle: .value("Cup", coffee.count)
//                )
//                .foregroundStyle(by: .value("Type", coffee.name))
//            }
        }
        .frame(width: 330, height: 106)
    }
}

struct BreakdownPieChartView_Previews: PreviewProvider {
    static var previews: some View {
        BreakdownPieChartView()
    }
}

//
//  TrendHistogramView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/13/23.
//

import SwiftUI
import Charts


struct SpendingDataType: Identifiable {
    var dayName: String
    var spendings: Double
    var id = UUID()
}

var mockData: [SpendingDataType] = [
    .init(dayName: "D1", spendings: 50),
    .init(dayName: "D2", spendings: 62),
    .init(dayName: "D3", spendings: 14),
    .init(dayName: "D4", spendings: 31),
    .init(dayName: "D5", spendings: 32),
    .init(dayName: "D6", spendings: 11),
    .init(dayName: "D7", spendings: 52),
    .init(dayName: "D8", spendings: 44),
    .init(dayName: "D9", spendings: 23),
    .init(dayName: "D10", spendings: 53),
    .init(dayName: "D11", spendings: 54),
    .init(dayName: "D12", spendings: 17),
    .init(dayName: "D13", spendings: 29),
    .init(dayName: "D14", spendings: 49),
    .init(dayName: "D15", spendings: 27),
    .init(dayName: "D16", spendings: 68),
    .init(dayName: "D17", spendings: 73),
    .init(dayName: "D18", spendings: 24),
    .init(dayName: "D19", spendings: 45),
    .init(dayName: "D20", spendings: 11),
    .init(dayName: "D21", spendings: 62),
    .init(dayName: "D22", spendings: 32),
    .init(dayName: "D23", spendings: 25),
    .init(dayName: "D24", spendings: 32),
    .init(dayName: "D25", spendings: 25),
    .init(dayName: "D26", spendings: 46),
    .init(dayName: "D27", spendings: 24),
    .init(dayName: "D28", spendings: 31),
]

struct TrendHistogramView: View {
    var body: some View {
        Chart {
            ForEach(mockData) { day in
                BarMark(
                    x: .value("Day", day.dayName),
                    y: .value("Spendings", day.spendings)
                )
            }
            let average = mockData.map(\.spendings).reduce(0.0, +) / Double(mockData.count)
            RuleMark(y: .value("Mean", average))
                .foregroundStyle(Color("AverageBarRed"))
                .lineStyle(StrokeStyle(lineWidth: 2))
                .annotation(position: .top, alignment: .leading) {
                    Text("$\(average, specifier: "%.1f")")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(.black)
                        .cornerRadius(8)
                }
        }
        .chartYAxis(.hidden)
        .chartXAxis(.hidden)
        .frame(width: 330, height: 70)
    }
    
}

struct TrendHistogramView_Previews: PreviewProvider {
    static var previews: some View {
        TrendHistogramView()
    }
}

struct DailySpending: Identifiable {
    var id = UUID()
}

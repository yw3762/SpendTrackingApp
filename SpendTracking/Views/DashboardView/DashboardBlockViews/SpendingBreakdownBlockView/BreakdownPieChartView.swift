//
//  BreakdownPieChartView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/12/23.
//

import SwiftUI
import Foundation
import Charts

struct SpendingsByCategories: Identifiable, Equatable {
    var id = UUID()
    var category: String
    var amount: Double
}


// TODO: Decide the range of days captured.
private var spendingsLastThreeWeeks: [SpendingsByCategories] = [
    SpendingsByCategories(category: "Travel", amount: 201),
    SpendingsByCategories(category: "Entertainment", amount: 320),
    SpendingsByCategories(category: "Shopping", amount: 300),
    SpendingsByCategories(category: "Food & Drink", amount: 400),
    SpendingsByCategories(category: "Health", amount: 50),
    SpendingsByCategories(category: "Miscellaneous", amount: 18),
    SpendingsByCategories(category: "Personal", amount: 34),
    SpendingsByCategories(category: "Bills & Utilities", amount: 25)
]


func getTopFiveSpendings( _ spendings : [SpendingsByCategories]) -> (Double, [SpendingsByCategories]) {
    var ans = Array(spendings.sorted { (lhs:SpendingsByCategories, rhs:SpendingsByCategories) in
        return lhs.amount > rhs.amount
    }.prefix(4))
    let totalAmount = spendings.reduce(0) { $0 + $1.amount }
    let othersAmount = totalAmount - ans.reduce(0) { $0 + $1.amount }
    ans.append(SpendingsByCategories(category: "Others", amount: othersAmount))
    return (totalAmount, ans)
}


let topFiveColors: [Color] = [
    Color("PieChartBlue#1"),
    Color("PieChartBlue#3"),
    Color("PieChartBlue#5"),
    Color("PieChartBlue#6"),
    Color("PieChartBlue#7"),
]

let foregroundColorMap: KeyValuePairs = [
    0: Color("PieChartBlue#1"),
    1: Color("PieChartBlue#3"),
    2: Color("PieChartBlue#5"),
    3: Color("PieChartBlue#6"),
    4: Color("PieChartBlue#7"),
]

extension Double {
    func roundTo(decimalPlaces: Int) -> String {
        return NSString(format: "%.\(decimalPlaces)f" as NSString, self) as String
    }
}

struct BreakdownPieChartView: View {
    static let (totalAmount, topFiveSpendings) = getTopFiveSpendings(spendingsLastThreeWeeks)
    let indexedTopFiveSpendings =  Array(topFiveSpendings.enumerated())
        .map { (index: $0, spending: $1, percentage: 100 * $1.amount / totalAmount) }
    
    var body: some View {
        Chart(indexedTopFiveSpendings, id: \.index) { item in
            SectorMark(
                angle: .value("Value", item.spending.amount),
                innerRadius: .ratio(0.618),
                outerRadius: .inset(0),
                angularInset: 0.3
            )
            .cornerRadius(1.4)
            .foregroundStyle(topFiveColors[item.index])
            .foregroundStyle(by: .value("Spending category", item.spending.category))
        }
        .frame(width: 330, height: 130)
        .chartLegend(position: .trailing, alignment: .leading, spacing: 8) {
            VStack (alignment: .leading) {
                ForEach(indexedTopFiveSpendings, id: \.index) { item in
                    HStack {
                        BasicChartSymbolShape.circle
                            .foregroundStyle(topFiveColors[item.index])
                            .frame(width: 8, height: 8)
                        Text(item.spending.category)
                            .foregroundStyle(.gray)
                            .font(.caption)
                        Spacer()
                        Text(item.percentage.roundTo(decimalPlaces: 0) + "%")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(Color("MainBlack"))
                            
                    }
                }
            }
        }
    }
}

struct BreakdownPieChartView_Previews: PreviewProvider {
    static var previews: some View {
        BreakdownPieChartView()
    }
}

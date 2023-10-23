//
//  OwingsBlockView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/15/23.
//

import SwiftUI
import Charts


struct UnsettledData: Identifiable {
    var id = UUID()
    var type: String
    var amount: Double
}

struct UnsettledSpendingsBlockView: View {
    

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 362, height: 107)
                .background(.white)
                .cornerRadius(15)
                .shadow(color: Color("DropdownShadowGrey"), radius: 25, x: 0, y: 2)
            VStack {
                HStack {
                    Text("Unsettled Spendings")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(Color("MainBlack"))
                    Spacer()
                }
                .padding(.horizontal)
                HStack {
                    VStack {
                        Text("You owe")
                        Text("You lent")
                    }
                    UnsettledChartView()
                        .padding(.horizontal)
                }
                
            }
            .frame(width: 362, height: 107)
        }
    }
}


struct UnsettledChartView: View {
    var unsettled : [UnsettledData] = [
        UnsettledData(type: "You owe", amount: 44),
        UnsettledData(type: "You lent", amount: 123)
    ]
    var body: some View {
        Chart() {
            ForEach(unsettled) { category in
                BarMark(
                    x: .value("Spendings", category.amount),
                    y: .value("Type", category.type)
                )
                .foregroundStyle(category.type == "You owe" ? Color("MainYellow") : Color("MainGreen"))
                .clipShape(RoundedRectangle(cornerRadius: 6))
            }
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
    }
}



struct UnsettledSpendingsBlockView_Previews: PreviewProvider {
    static var previews: some View {
        UnsettledSpendingsBlockView()
    }
}

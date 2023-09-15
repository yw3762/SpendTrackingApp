//
//  SpendingTrendBlockView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/13/23.
//

import SwiftUI

struct SpendingTrendBlockView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 362, height: 210)
                .background(.white)
                .cornerRadius(5)
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Spending Trend")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(Color(red: 1, green: 0.36, blue: 0.14))
                        Text("Some comments summarizing spendings, bluh bluh bluh...")
                            .font(.system(size: 14, weight: .bold))
                            .frame(width:290, height:34)
                            .lineLimit(2)
                    }
                    .padding(.leading, 20.0)
                    .padding(.bottom, 8.0)
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .foregroundColor(Color(.systemGray))
                }
                .padding(.trailing)
                Divider()
                    .frame(width: 330, height: 0.8)
                    .overlay(Color(.systemGray))
                TrendHistogramView()
            }
            .padding()
        }
        .contentShape(Rectangle())
    }
}

struct SpendingTrendBlockView_Previews: PreviewProvider {
    static var previews: some View {
        SpendingTrendBlockView()
    }
}

//
//  SpendingBreakdownBlockView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/15/23.
//

import SwiftUI

struct SpendingBreakdownBlockView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 362, height: 189)
                .background(.white)
                .cornerRadius(15)
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Spending Breakdown")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(Color(red: 1, green: 0.36, blue: 0.14))
                    }
                    .padding(.leading, 20.0)
                    .padding(.bottom, 8.0)
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .foregroundColor(Color(.systemGray))
                        .padding(.top, -4)
                        .padding(.bottom, 3)
                }
                .padding(.trailing)
                
                HStack {
                    BreakdownPieChartView()
                }
            }
            .padding()
        }
        .contentShape(Rectangle())
    }
}

struct SpendingBreakdownBlockView_Previews: PreviewProvider {
    static var previews: some View {
        SpendingBreakdownBlockView()
    }
}

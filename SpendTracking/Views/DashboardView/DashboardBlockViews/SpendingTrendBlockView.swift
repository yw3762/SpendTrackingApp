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
                .frame(width: 362, height: 189)
                .background(.white)
                .cornerRadius(15)
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Spending Trend")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(Color(red: 1, green: 0.36, blue: 0.14))
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .foregroundColor(Color(.systemGray))
                        }
                        .padding(.trailing)
                        
                        
                        Text("Some comments summarizing spendings, bluh bluh bluh...")
                            .font(.system(size: 14, weight: .bold))
                            .frame(width:290, height:34)
                            .lineLimit(2)
                    }
                    .padding(.leading, 38.0)
                    .padding(.bottom, 4.0)
                }
                .padding(.trailing)
                
                Divider()
                    .frame(width: 335, height: 0.8)
                    .overlay(Color(.systemGray))
                
                TrendHistogramView()
            }

        }
        .contentShape(Rectangle())
    }
}

struct SpendingTrendBlockView_Previews: PreviewProvider {
    static var previews: some View {
        SpendingTrendBlockView()
    }
}

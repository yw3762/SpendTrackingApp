//
//  DashboardView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/13/23.
//

import SwiftUI

struct DashboardView: View {
    var platforms: [String] = ["A", "B", "C"]
    
    var body: some View {
        VStack{
            DashboardTitleView
            ScrollView {
                SpendingTrendBlockView()
                SpendingBreakdownBlockView
                OwingsBlockView
                RecurringChargesBlockView
            }
            
        }
        .background(Color(red: 0.95, green: 0.95, blue: 0.97))
    }
    
}

var DashboardTitleView: some View {
    HStack {
        Text("Dashboard")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.leading)
            .kerning(0.374)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        Button(action: {}) {
            Image(systemName: "gearshape.fill")
                .resizable()
                .foregroundColor(Color(.systemBlue))
                .padding(0.0)
                .frame(width: 28.0, height: 28.0)
        }
        .padding(.trailing, 14.0)
    }
    .padding(.horizontal)
}


var OwingsBlockView: some View {
    ZStack {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 362, height: 189)
            .background(.white)
            .cornerRadius(5)
    }
}

var SpendingBreakdownBlockView: some View {
    ZStack {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 362, height: 189)
            .background(.white)
            .cornerRadius(5)
    }
}

var RecurringChargesBlockView: some View {
    ZStack {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 362, height: 189)
            .background(.white)
            .cornerRadius(5)
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

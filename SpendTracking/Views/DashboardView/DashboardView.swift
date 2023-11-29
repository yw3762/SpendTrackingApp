//
//  DashboardView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/13/23.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationStack {
            VStack{
                //DashboardTitleView
                // TODO: Add the option button
                ScrollView {
                    //SpendingTrendBlockView()
                    NavigationLink {
                        SpendingTrendDetailedView()
                    } label: {
                        SpendingTrendBlockView()
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink {
                        SpendingBreakdownDetailedView()
                    } label: {
                        SpendingBreakdownBlockView()
                    }
                    .buttonStyle(PlainButtonStyle())
                    NavigationLink {
                        // TODO: Add redirection page
                    } label: {
                        UnsettledSpendingsBlockView()
                    }
                    .buttonStyle(PlainButtonStyle())
                    NavigationLink {
                        // TODO: Add redirection page
                    } label: {
                        RecurringChargesBlockView()
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .background(Color("MainWhite"))
            .navigationTitle("Dashboard")
        }
        
    }
}

//var DashboardTitleView: some View {
//    HStack {
//        Text("Dashboard")
//            .font(.largeTitle)
//            .fontWeight(.bold)
//            .padding(.leading)
//            .kerning(0.374)
//            .foregroundColor(.black)
//            .frame(maxWidth: .infinity, alignment: .topLeading)
//        Button(action: {}) {
//            Image(systemName: "gearshape.fill")
//                .resizable()
//                .foregroundColor(Color(.systemBlue))
//                .padding(0.0)
//                .frame(width: 28.0, height: 28.0)
//        }
//        .padding(.trailing, 14.0)
//    }
//    .padding(.horizontal)
//}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

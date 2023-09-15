//
//  RecurringChargesBlockView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/15/23.
//

import SwiftUI

struct RecurringChargesBlockView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 362, height: 99)
                .background(.white)
                .cornerRadius(5)
            VStack {
                RecurringChargesTopRowView()
                Divider()
                    .frame(width: 330, height: 0.8)
                    .overlay(Color(.systemGray))
            }
        }
        .onTapGesture {
            debugPrint("Recurring charges section tapped")
        }
    }
}

struct RecurringChargesBlockView_Previews: PreviewProvider {
    static var previews: some View {
        RecurringChargesBlockView()
    }
}

struct RecurringChargesTopRowView: View {
    var body: some View {
        HStack {
            Text("Recurring charges")
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(Color(red: 1, green: 0.36, blue: 0.14))
            .padding(.leading, 20.0)
            .padding(.bottom, 8.0)
            Spacer()
            Image(systemName: "chevron.forward")
                .foregroundColor(Color(.systemGray))
        }
        .padding()
    }
}

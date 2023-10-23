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
                .cornerRadius(15)
                .shadow(color: Color("DropdownShadowGrey"), radius: 25, x: 0, y: 2)
            VStack {
                RecurringChargesTopRowView()
                // TODO: Finalize this!
                HStack {
                    VStack {
                        Text("Monthly payment: ")
                            .font(.system(size: 12, weight: .bold))
                        Text("Yearly payment: ")
                            .font(.system(size: 12, weight: .bold))
                    }
                    VStack {
                        Text("Next payment due:")
                        Text("Mar 20th")
                    }
                }
            }
            .padding()
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
        VStack {
            HStack {
                Text("Recurring charges")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(Color(red: 1, green: 0.36, blue: 0.14))
                Spacer()
                Image(systemName: "chevron.forward")
                    .foregroundColor(Color("ChevronGrey"))
            }
        }
        .padding(.horizontal)
        .padding(.top, -10)
    }
}

//
//  RecurringChargesBlockView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/15/23.
//

import SwiftUI

let monthlyPayment: Double = 200
let yearlyPayment = 150
let nextPaymentDueDate = "Mar 20th"

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
                HStack {
                    VStack(alignment: .leading) {
                        Text(String(format:"Monthly payment:", monthlyPayment))
                            .font(.system(size: 12, weight: .bold))
                            .padding(.vertical, 10)
                        Text(String(format:"Yearly payment:", monthlyPayment))
                            .font(.system(size: 12, weight: .bold))
                            .padding(.bottom, 20)
                    }
                    .padding(.leading, 17)
                    .padding(.trailing, -5)
                    
                    VStack(alignment: .leading) {
                        Text(String(format:"$%.0f/mo", monthlyPayment))
                            .font(.system(size: 12, weight: .bold))
                            .padding(.vertical, 10)
                        Text(String(format:"$%.0f/yr", monthlyPayment))
                            .font(.system(size: 12, weight: .bold))
                            .padding(.bottom, 20)
                    }
                    .padding(.trailing)
                    
                    
                    VStack {
                        Text("Next payment due:")
                            .font(.system(size: 13, weight: .bold))
                            .padding(.top, -15)
                        Text(nextPaymentDueDate)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(Color("AccentTextOrange"))
                            .padding(.top, 5)
                            .padding(.trailing, 5)
                            .padding(.bottom, 5)
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
        HStack {
            Text("Recurring charges")
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(Color(red: 1, green: 0.36, blue: 0.14))
                .padding(.top, 15)
            Spacer()
            Image(systemName: "chevron.forward")
                .foregroundColor(Color("ChevronGrey"))
        }
        .padding(.horizontal)
        .padding(.top, 10)
        .padding(.bottom, -5)
    }
}

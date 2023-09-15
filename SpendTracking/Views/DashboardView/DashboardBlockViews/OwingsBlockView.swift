//
//  OwingsBlockView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/15/23.
//

import SwiftUI

struct OwingsBlockView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 362, height: 107)
                .background(.white)
                .cornerRadius(5)
            HStack {
                OwingsSubBlockView(owes: true, amount: 900)
                    .padding()
                Divider()
                    .frame(height: 90)
                OwingsSubBlockView(owes: false, amount: 1200)
                    .padding()
            }
            .frame(width: 362, height: 107)
        }
    }
}

struct OwingsSubBlockView: View {
    var owes: Bool
    var amount: Double
    var body: some View {
        VStack {
            HStack {
                Text(owes ? "You owe" : "Owings")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.leading, 20.0)
                    .padding(.bottom, 8.0)
                    .padding(.top, 5)
                Spacer()
                Image(systemName: "chevron.forward")
                    .foregroundColor(Color(.systemGray))
                    .padding(.bottom, 3)
            }
            Text("$\(amount, specifier: "%.2f")")
                .foregroundColor(owes ? .red : .green)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .minimumScaleFactor(0.4)
                .padding(.horizontal, 4)
                .padding(.vertical, 2)
                .cornerRadius(8)
        }
    }
}


struct OwingsBlockView_Previews: PreviewProvider {
    static var previews: some View {
        OwingsBlockView()
    }
}

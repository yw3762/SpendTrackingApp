//
//  AccountInfoRow.swift
//  SpendTracking
//
//  Created by Alex Wang on 11/29/23.
//

import SwiftUI

struct AccountInfoRow: View {
    private var field: String
    private var data: String
    private var clickable: Bool
    
    init(field: String, data: String, clickable: Bool) {
        self.field = field
        self.data = data
        self.clickable = clickable
    }
    
    var body: some View {
        HStack {
            Text(field)
                .font(.system(.body, weight: .medium))
                .foregroundStyle(Color("MainBlack"))
            Spacer()
            HStack {
                Text(data)
                    .font(.system(.body, weight: .light))
                    .foregroundStyle(Color("MainDarkGrey"))
                Image(systemName: "chevron.forward")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 7)
                    .foregroundStyle(Color("MainDarkGrey"))
                    .opacity(clickable ? 1 : 0)
            }
        }
    }
    
    
    
}

#Preview {
    AccountInfoRow(field: "Name", data: "First Last", clickable: true)
}

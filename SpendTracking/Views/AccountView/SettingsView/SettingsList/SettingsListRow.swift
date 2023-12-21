//
//  SettingsListRow.swift
//  SpendTracking
//
//  Created by Alex Wang on 11/29/23.
//

import SwiftUI

struct SettingsListRow: View {
    var category: String
    
    var body: some View {
        HStack {
            Text(category)
                .font(.system(.body, design: .rounded, weight: .medium))
                .foregroundStyle(Color("MainBlack"))
            Spacer()
            Image(systemName: "chevron.forward")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 14)
                .foregroundStyle(Color("MainLightGrey"))
        }
    }
}

#Preview {
    SettingsListRow(category: "Notifications")
}

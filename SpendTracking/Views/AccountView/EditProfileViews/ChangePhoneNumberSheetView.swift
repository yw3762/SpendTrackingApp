//
//  ChangePhoneNumberSheetView.swift
//  SpendTracking
//
//  Created by Alex Wang on 11/29/23.
//

import SwiftUI

struct ChangePhoneNumberSheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss phone number sheet") {
            dismiss()
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    ChangePhoneNumberSheetView()
}

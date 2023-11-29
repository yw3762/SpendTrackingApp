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
        HStack {
            Button {
                dismiss()
            } label: {
                Text("Cancel")
                    .foregroundStyle(Color("MainGreen"))
            }
            Spacer()
            Button {
                // TODO: await data submission
                dismiss()
            } label: {
                Text("Confirm")
                    .foregroundStyle(Color("MainGreen"))
            }
        }
        .padding()
        Text("Changing Phone Number")
            .font(.title)
            .fontWeight(.semibold)
            .padding()
        
        // TODO: Add Input Boxes
        Spacer()
    }
}

#Preview {
    ChangePhoneNumberSheetView()
}

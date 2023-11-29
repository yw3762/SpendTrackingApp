//
//  ChangeNameSheetView.swift
//  SpendTracking
//
//  Created by Alex Wang on 11/22/23.
//

import SwiftUI

struct ChangeNameSheetView: View {
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
        Text("Changing Name")
            .font(.title)
            .fontWeight(.semibold)
            .padding()
        
        // TODO: Add Input Boxes
        Spacer()
    }
}

#Preview {
    ChangeNameSheetView()
}

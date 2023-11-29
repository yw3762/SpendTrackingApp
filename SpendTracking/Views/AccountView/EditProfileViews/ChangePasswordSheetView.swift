//
//  ChangePasswordSheetView.swift
//  SpendTracking
//
//  Created by Alex Wang on 11/22/23.
//

import SwiftUI

struct ChangePasswordSheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss pwd sheet") {
            dismiss()
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    ChangePasswordSheetView()
}

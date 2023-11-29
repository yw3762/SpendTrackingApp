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
        Button("Press to dismiss name sheet") {
            dismiss()
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    ChangeNameSheetView()
}

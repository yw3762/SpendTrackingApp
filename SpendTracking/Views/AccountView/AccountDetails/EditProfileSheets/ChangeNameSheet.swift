//
//  ChangeNameSheetView.swift
//  SpendTracking
//
//  Created by Alex Wang on 11/22/23.
//

import SwiftUI


struct ChangeNameField: View {
    @Binding var textInput: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.clear)
                .stroke(Color("MainLightGrey"))
                .frame(width: 340, height: 40)
            HStack {
                // TODO: Change fonts
                Text("New Name")
                    .padding()
                Spacer()
                TextField(
                    "Enter new name",
                    text: $textInput
                )
                .padding()
            }
            .padding(.leading)
        }
        .padding()
    }
}

struct ChangeNameSheetView: View {
    @Environment(\.dismiss) var dismiss
    @State var newName: String = ""
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
        ChangeNameField(textInput: $newName)
        Spacer()
    }
}

#Preview {
    ChangeNameSheetView()
}

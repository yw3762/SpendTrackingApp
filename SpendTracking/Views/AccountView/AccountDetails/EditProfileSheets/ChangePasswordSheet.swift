//
//  ChangePasswordSheetView.swift
//  SpendTracking
//
//  Created by Alex Wang on 11/22/23.
//

import SwiftUI

struct ChangePasswordField: View {
    let width_: CGFloat = 360
    @Binding var oldPassword: String
    @Binding var newPassword: String
    @Binding var confirmPassword: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.clear)
                .stroke(Color("MainLightGrey"))
                .frame(width: width_, height: 150)
            VStack {
                HStack {
                    // TODO: Change fonts
                    Text("Old Password")
                        .frame(width: 160)
                    Spacer()
                    SecureField(
                        "Enter old password",
                        text: $newPassword
                    )
                    .padding(.horizontal, 10)
                }
                .padding(.leading)
                .padding(.vertical, 6)
                
                Divider()
                    .frame(width: width_)
                
                HStack {
                    // TODO: Change fonts
                    Text("New Password")
                        .frame(width: 160)
                    Spacer()
                    SecureField(
                        "Enter new password",
                        text: $newPassword
                    )
                    .padding(.horizontal, 10)
                }
                .padding(.leading)
                .padding(.vertical, 6)
                
                Divider()
                    .frame(width: width_)
                
                HStack {
                    // TODO: Change fonts
                    Text("Confirm Password")
                        .frame(width: 160)
                    Spacer()
                    SecureField(
                        "Confirm new password",
                        text: $confirmPassword
                    )
                    .padding(.horizontal, 10)
                }
                .padding(.leading)
                .padding(.vertical, 7)
            }
        }
    }
}

struct ChangePasswordSheetView: View {
    @Environment(\.dismiss) var dismiss
    @State var oldPassword: String = ""
    @State var newPassword: String = ""
    @State var confirmPassword: String = ""

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
        Text("Changing Password")
            .font(.title)
            .fontWeight(.semibold)
            .padding()
        
        ChangePasswordField(oldPassword: $oldPassword, newPassword: $newPassword, confirmPassword: $confirmPassword)
        
        Spacer()
    }
}

#Preview {
    ChangePasswordSheetView()
}

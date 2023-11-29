//
//  AccountView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/15/23.
//

import SwiftUI

func signOut() {
    // See https://medium.com/codex/custom-popup-in-swiftui-2b9139700549
    
}

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

// TODO: 1. Fix the glitching error caused by `.toolbarRole(.editor)`, which disables the text on navigation back button.
// TODO: 2. Profile Icon should be displayed consistently, where the data is managed as some place.
struct AccountView: View {
    @State public var showSignOutAlert = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                NavigationLink {
                    AccountDetailsView()
                } label: {
                    AccountProfileCardView()
                        .padding(.top, 15)
                }
                MyDivider()
                    .padding(.vertical, 15)
                SettingsListGroup()
                SignOutButton(showSignOutAlert: $showSignOutAlert)
                    .padding(.bottom, 30)
            }
            .navigationTitle("Account")
        }
    }
}

struct MyDivider: View {
    var body: some View {
        Divider()
            .frame(width: 360, height: 0.8)
            .overlay(Color("MainLightGrey"))
    }
}


struct SettingsListGroup: View {
    var body: some View {
        SettingsList(customContent: ["Notifications", "QR Code", "My Friends"])
        MyDivider()
            .padding()
        SettingsList(customContent: ["Contact Us"])
        Spacer()
    }
}


struct AccountProfileCardView: View {
    let name = "First Last"
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color("MainGreen"))
                .padding(.horizontal, 15)
            HStack {
                Image("TestProfilePhoto1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color.black)
                    .background(Color("MainLightGrey"))
                    .clipShape(Circle())
                    .padding()
                Text(name)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color("MainWhite"))
                Spacer()
                Image(systemName: "chevron.forward")
                    .resizable()
                    .frame(width: 16, height: 28)
                    .foregroundColor(Color("MainWhite"))
                    .padding()
            }
            .frame(width: 380, height: 120)
        }
        .frame(width: 405, height: 137)
    }
}


struct SignOutButton: View {
    @Binding public var showSignOutAlert: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("MainLightGrey"), lineWidth: 1)
                .frame(width:169, height:53)
            //.resizable()
                .foregroundColor(.red)
                .contentShape(Rectangle())
            Text("Sign out")
                .font(.system(size: 24, weight: .medium, design: .rounded ))
                .foregroundColor(Color("MainRed"))
        }
        .onTapGesture {
            // TODO: show the CustomAlert'
            showSignOutAlert = true
        }
        .alert(title: "Sign out", message: "Do you really want to sign out?",
               primaryButton: CustomAlertButton(title: "Cancel", action: { showSignOutAlert = false }),
               secondaryButton: CustomAlertButton(title: "Log out", action: { /*TODO: log out*/ }),
               isPresented: $showSignOutAlert)
    }
}



struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

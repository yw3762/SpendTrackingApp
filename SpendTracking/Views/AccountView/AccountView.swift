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

struct AccountView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                AccountProfileCardView()
                    .padding(.top, 15)
                // TODO: fix divider design
                Divider()
                
                // TODO: Add list
                
                
                // TODO: Signout button design
                Button(action: signOut) {
                    Text("Sign out")
                }
                Spacer()
            }
            .navigationTitle("Account")
        }
    }
}


struct AccountProfileCardView: View {
    let name = "Amy Yoon"
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color("MainGreen"))
                .padding(.horizontal, 15)
            HStack {
                Text("Profile icon")
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


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

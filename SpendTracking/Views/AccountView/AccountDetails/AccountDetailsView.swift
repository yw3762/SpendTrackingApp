//
//  AccountDetailsView.swift
//  SpendTracking
//
//  Created by Alex Wang on 10/25/23.
//

import SwiftUI
import PhotosUI

struct AccountInfo {
    let name: String
    let email: String
    let phone: Int32? = nil
    let password: String
}


struct AccountDetailData: Identifiable {
    let id = UUID()
    let field: String
    let data: String?
    let nilData: String
    let editable: Bool
    let visible: Bool
}

let newMockData: [AccountDetailData] = [
    AccountDetailData (
        field: "Name",
        data: "First Last",
        nilData: "",
        editable: true,
        visible: true
    ),
    AccountDetailData (
        field: "Email",
        data: "asldfj@mail.com",
        nilData: "",
        editable: false,
        visible: true
    ),
    AccountDetailData (
        field: "Phone Number",
        data: "1234121342",
        nilData: "Not Linked",
        editable: true,
        visible: true
    ),
    AccountDetailData (
        field: "Password",
        data: "First Last",
        nilData: "Change Password",
        editable: true,
        visible: false
    ),
]


let mockAccountInfo = AccountInfo(name: "Amy Yoon", email: "amyemail@gmail.com", password: "verysecure")

extension Binding where Value == String? {
    public func notNil() -> Binding<Bool> {
        return Binding<Bool>(
            get: { self.wrappedValue != nil },
            set: {
                if (!$0) {
                    self.wrappedValue = nil
                }
            }
        )
    }
}

struct AccountDetailsView: View {
    @State public var showingPopUpSheet: Bool = false
    @State public var showPopUpSheetOf: String? = nil
    @State private var showActionSheet = false
    @State public var showDeleteAccountAlert = false
    
    var body: some View {
        VStack {
//                Text("My Account")
//                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                    .padding(.vertical, 7)
            ProfilePictureView()
                .frame(width: 200, height: 200)
                .contentShape(Circle())
                .onTapGesture {
                    showActionSheet = true
                }
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(
                        title: Text("Select profile photo"),
                        buttons: [
                            .default(Text("Take Photo...")) {
                                print("Taking Photo")
                            },
                            .default(Text("Choose from Library...")) {
                                print("Choosing from Library")
                            },
                            .cancel()
                        ]
                    )
                }
            Spacer()
            AccountInfoList(data: newMockData, showPopUpSheetOf: $showPopUpSheetOf)
            //AccountDetailsList()
            Spacer()
            DeleteAccountButton(showDeleteAccountAlert: $showDeleteAccountAlert)
            Spacer()
        }
        .listStyle(.insetGrouped)
        .scrollDisabled(true)
        .scrollContentBackground(.hidden)
        .sheet(isPresented: $showPopUpSheetOf.notNil()) {
            if let showing = showPopUpSheetOf {
                switch showing {
                case "Name":
                    ChangeNameSheetView()
                case "Phone Number":
                    ChangePhoneNumberSheetView()
                case "Password":
                    ChangePasswordSheetView()
                default:
                    EmptyView()
                }
            } else {
                Text("notNil() extension error")
            }
        }
    }
}

struct AccountDetailsList: View {
    @State private var showChangeNameSheet = false
    @State private var showChangePhoneNumberSheet = false
    @State private var showChangePasswordSheet = false
    var body: some View {
        List {
            HStack {
                Text("Name")
                    .frame(width: .infinity)
                    .onTapGesture {
                        showChangeNameSheet.toggle()
                    }
                    .sheet(isPresented: $showChangeNameSheet) {
                        ChangeNameSheetView()
                    }
                Spacer()
                Text("Woooooooo")
            }
            HStack {
                Text("Email")
                Spacer()
                Text("someemail@gmail.com")
            }
            
            HStack {
                Text("Phone number")
                Spacer()
                Text("Not Linked")
            }
            HStack {
                Text("Password")
                Spacer()
                Text("Change password")
            }
            
        }
        
    }
}

struct ProfilePictureView: View {
    let trimRatio = 0.27
    let image = Image("TestProfilePhoto1")
    var body: some View {
        ZStack {
            image
                .resizable()
                .frame(width:200, height: 200)
                .clipShape(Circle())
            Circle()
                .trim(from: 0, to: trimRatio)
                .frame(width:200, height: 200)
                .rotationEffect(.degrees(90 - 180 * trimRatio)) // Make sure trim line horizontal
                .foregroundStyle(Color("MainDarkGrey").opacity(0.85))
            HStack {
                Text("Edit")
                Image(systemName: "pencil.line")
                    .padding(.leading, -5)
            }
            .foregroundStyle(Color("MainWhite"))
            .padding(.top, 160)
        }
    }
}

#Preview {
    AccountDetailsView()
}


struct DeleteAccountButton: View {
    @Binding public var showDeleteAccountAlert: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("MainLightGrey"), lineWidth: 1)
                .frame(width:169, height:53)
            //.resizable()
                .foregroundColor(.red)
                .contentShape(Rectangle())
            Text("Delete Account")
                .font(.system(size: 24, weight: .medium, design: .rounded ))
                .foregroundColor(Color("MainRed"))
        }
        .onTapGesture {
            // TODO: show the CustomAlert'
            showDeleteAccountAlert = true
        }
        .alert(title: "Sign out", message: "Do you really want to sign out?",
               primaryButton: CustomAlertButton(title: "Cancel", action: { showDeleteAccountAlert = false }),
               secondaryButton: CustomAlertButton(title: "Log out", action: { /*TODO: log out*/ }),
               isPresented: $showDeleteAccountAlert)
    }
}

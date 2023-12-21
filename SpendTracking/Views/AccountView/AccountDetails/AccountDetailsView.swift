//
//  AccountDetailsView.swift
//  SpendTracking
//
//  Created by Alex Wang on 10/25/23.
//

import SwiftUI
import PhotosUI


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
    
    
    @State public var showDeleteAccountAlert = false
    
    @State private var showActionSheet = false
    @State private var showCamera = false
    @State private var showImagePicker = false
    
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    var body: some View {
        VStack {
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
                                self.showCamera = true
                                self.sourceType = .camera
                            },
                            .default(Text("Choose from Library...")) {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary
                            },
                            .cancel()
                        ]
                    )
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
                }
                .fullScreenCover(isPresented: $showCamera) {
                    ImagePicker(image: self.$image, isShown: self.$showCamera, sourceType: self.sourceType)
                        .ignoresSafeArea()
                }
                .padding()
            Spacer()
            AccountInfoList(data: newMockData, showPopUpSheetOf: $showPopUpSheetOf)
            Spacer()
            DeleteAccountButton(showDeleteAccountAlert: $showDeleteAccountAlert)
                .padding(.top, 30)
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("My Account")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("MainBlack"))
                }
            }
        }
        .listStyle(.insetGrouped)
        .scrollDisabled(true)
        .scrollContentBackground(.hidden)
        .sheet(isPresented: $showPopUpSheetOf.notNil()) {
            if let showing = showPopUpSheetOf {
                switch showing {
                case "Name":
                    ChangeNameSheetView()
                        .presentationDetents([ .medium, .large])
                        .presentationBackground(.thinMaterial)
                case "Phone Number":
                    ChangePhoneNumberSheetView()
                        .presentationDetents([ .medium, .large])
                        .presentationBackground(.thinMaterial)
                case "Password":
                    ChangePasswordSheetView()
                        .presentationDetents([.large])
//                        .presentationBackground(.thinMaterial)
                default:
                    EmptyView()
                }
            } else {
                Text("notNil() extension error")
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
                .aspectRatio(contentMode: .fill)
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
                .frame(width:200, height:53)
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
        .alert(isPresented: $showDeleteAccountAlert) {
            Alert(
                title: Text("Delete Account"),
                message: Text("Do you really wish to delete your account?"),
                primaryButton: .default(
                    Text("Cancel")
                ),
                secondaryButton: .destructive(
                    Text("Confirm")
//                  TODO: action - deleteWorkoutData
                )
            )
        }
    }
}

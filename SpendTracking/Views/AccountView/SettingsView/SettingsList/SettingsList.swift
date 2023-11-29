//
//  SettingsList.swift
//  SpendTracking
//
//  Created by Alex Wang on 11/29/23.
//

import SwiftUI

struct SettingsList: View {
    private var rowHeight: Double = 64
    private var cornerRadius: Double = 20
    private var content: [String]
    
    init(customContent: [String]) {
        content = customContent
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(content, id:\.self) { item in
                        SettingsListRow(category: item)
                        .overlay {
                            NavigationLink {
                                switch item {
                                case "Notifications":
                                    NotificationsView()
                                case "QR Code":
                                    QRCodeView(content: "myemail@gmail.com")
                                case "My Friends": // TODO: Link to MyFriends page
                                    Text("My Friends")
                                case "Contact Us": // TODO: Add contact us page
                                    Text("Contact Us")
                                default:
                                    Text("Error")
                                }
                            } label: {
                                EmptyView()
                            }
                            .opacity(0)                                     // No Chevron arrow from NavigationLink
                        }                                                   // Use overlay attach NavigationLink to ListRowView
                    }
                }
                .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                    return -viewDimensions.width
                }                                                           // Removing leading spacing for row separator
                .listSectionSeparator(.hidden, edges: .bottom)              // Removing last separator
            }
            .frame(width: 370, height: rowHeight * Double(content.count))   // fix view frame
            .cornerRadius(cornerRadius)                                     // Clip view frame with cornerRadius
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color("MainLightGrey"), lineWidth: 1)
            )                                                               // Add border
            .listStyle(PlainListStyle())                                    // Remove outer wrapper
            .environment(\.defaultMinListRowHeight, rowHeight)              // Adjust row height
            .scrollDisabled(true)                                           // Disable list scrolling
        }
    }
}

#Preview {
    SettingsList(customContent: ["Notifications", "QR Code", "My Friends"])
}

//
//  AccountInfoList.swift
//  SpendTracking
//
//  Created by Alex Wang on 11/29/23.
//

import SwiftUI

struct AccountInfoList: View {
    @Binding var showPopUpSheetOf: String?
    private var rowHeight: Double = 45
    private var cornerRadius: Double = 10
    private var data: [AccountDetailData]
    
    init(data: [AccountDetailData], showPopUpSheetOf: Binding<String?>) {
        self.data = data
        self._showPopUpSheetOf = showPopUpSheetOf
    }
    
    var body: some View {
        List {
            ForEach(data) { item in
                AccountInfoRow(
                    field: item.field,
                    data: (item.visible && item.data != nil) ? item.data! : item.nilData,
                    clickable: item.editable
                )
                .contentShape(Rectangle())
                .onTapGesture {
                    print("showPopUpSheetOf was:", showPopUpSheetOf)
                    if (item.editable) {
                        showPopUpSheetOf = item.field
                    }
                    print(item.field + " tapped")
                    print("showPopUpSheetOf is now:", showPopUpSheetOf)
                }
            }
        }
        .frame(width: 370, height: rowHeight * Double(data.count))      // fix view frame
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

//#Preview {
//    AccountInfoList(data: newMockData, showPopUpSheetOf: )
//}

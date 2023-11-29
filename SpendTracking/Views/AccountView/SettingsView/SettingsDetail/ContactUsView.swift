//
//  ContactUsView.swift
//  SpendTracking
//
//  Created by Alex Wang on 11/29/23.
//

import SwiftUI

struct ContactUsView: View {
    var body: some View {
        Text("Contact us now!")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Contact Us")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(Color("MainBlack"))
                    }
                }
            }
    }
}

#Preview {
    ContactUsView()
}

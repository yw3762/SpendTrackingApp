//
//  NotificationsView.swift
//  SpendTracking
//
//  Created by Alex Wang on 11/22/23.
//

import SwiftUI

struct NotificationsView: View {
    
    var body: some View {
        Text("Empty")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Notifications")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(Color("MainBlack"))
                    }
                }
            }
    }
}

#Preview {
    NotificationsView()
}

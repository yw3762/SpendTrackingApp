//
//  TabBarView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/15/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        HStack {
            DashboardButtonView(imageName: "rectangle.3.group.fill", labelName: "Dashboard")
                .padding(.horizontal)
            DashboardButtonView(imageName: "person.3.fill", labelName: "Groups")
                .padding(.horizontal)
            DashboardButtonView(imageName: "plus.app", labelName: "")
                .padding(.horizontal)
            DashboardButtonView(imageName: "tray.full.fill", labelName: "Me")
                .padding(.horizontal)
            DashboardButtonView(imageName: "person.crop.circle.fill", labelName: "Account")
                .padding(.horizontal)
        }
    }
}

struct DashboardButtonView: View {
    var imageName: String
    var labelName: String
    var body: some View {
        Button {
            
        } label: {
            VStack (alignment: .center, spacing: 4) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
                Text(labelName)
                    .font(.system(size: 10, weight: .regular, design: .rounded))
            }
        }
    }
}

struct BottomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

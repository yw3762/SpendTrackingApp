//
//  ContentView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/2/23.
//

import SwiftUI


struct ContentView: View {
    // See this link: https://medium.com/@andreamiotz/swiftui-with-custom-tab-bar-item-action-6d1e3588369d
    // For information about creating middle + button
    // TODO: Potential new tabbar features? https://github.com/pratikg29/CustomTabBar
    @State private var selectedTab: Tab = .dashboard

    enum Tab {
        case dashboard
        case groups
        case add
        case me
        case account
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "rectangle.3.group.fill")
                }
                .tag(Tab.dashboard)
            GroupsView()
                .tabItem {
                    Label("Groups", systemImage: "person.3.fill")
                }
                .tag(Tab.groups)
            AddView()
                .tabItem {
                    Label("", systemImage: "plus.app")
                        
                }
                .tag(Tab.add)
            MeView()
                .tabItem {
                    Label("Me", systemImage: "tray.full.fill")
                }
                .tag(Tab.me)
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
                .tag(Tab.account)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/2/23.
//

import SwiftUI


struct ContentView: View {
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
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                DashboardView()
                    .tabItem {
                        Label(("Dashboard"), systemImage: "rectangle.3.group.fill")
                    }
                    .tag(Tab.dashboard)
                    .tint(.blue)
                    
                GroupsView()
                    .tabItem {
                        Label("Groups", systemImage: "person.3.fill")
                    }
                    .tag(Tab.groups)
                Spacer()
                    .tabItem {
                        EmptyView()
                    }
                    .tag(Tab.add)
                MeView()
                    .tabItem {
                        Label("Me", systemImage: "tray.full.fill")
                    }
                    .tag(Tab.me)
                AccountView()
                    .tabItem {
                        Label("Account", systemImage: "person.crop.square")
                    }
                    .tag(Tab.account)
            }
            .tint(Color("MainBlack")) // This passes tint color to all subviews
            Button {
                // TODO: Make the plus button work
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .tint(Color("MainWhite"))
                    
            }
            .frame(width: 60, height: 60)
            .background(Color("MainGreen"))
            .clipShape(Circle())
            .padding(.bottom, -6)
        }
        .ignoresSafeArea(.keyboard) // useful so the button doesn't move around on keyboard show
        .onChange(of: selectedTab) { [selectedTab] newValue in
           if newValue == Tab.add {
               self.selectedTab = selectedTab // reset the selection in case we somehow press the middle tab
           }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

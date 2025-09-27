//
//  MainTabView.swift
//  hackgt_productivity
//
//  Created by Aditi Deshmukh on 9/27/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var endDate: Date
    @State private var selectedTab: Tab = .dashboard

    enum Tab {
        case features, dashboard, tasks
    }
    
    init(endDate: Date) {
        _endDate = State(initialValue: endDate)
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Features()
                .tabItem {
                    Label("Features", systemImage: "list.triangle")
                }
                .tag(Tab.features)
            
            NavigationStack {
                Dashboard(endDate: $endDate)
            }
            .tabItem {
                Label("Dashboard", systemImage: "house.fill")
            }
            .tag(Tab.dashboard)  // Dashboard will be the default selected tab
            
            Tasks()
                .tabItem {
                    Label("Tasks", systemImage: "list.bullet.clipboard")
                }
                .tag(Tab.tasks)
        }
    }
}
#Preview {
    MainTabView(endDate: Date())
}

//
//  ContentView.swift
//  Pace
//
//  Created by Tanmay Dabhade on 10/28/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("BackgroundColor"))
    }

    var body: some View {
        TabView {
            OnboardingView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            DashboardView()
                .tabItem {
                    Image(systemName: "speedometer")
                    Text("Dashboard")
                }
            RouteMapView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
        }
        .accentColor(Color("AccentColor"))
    }
}


#Preview {
    ContentView()
}

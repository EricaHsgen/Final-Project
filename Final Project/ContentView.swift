//
//  ContentView.swift
//  Final Project
//
//  Created by HOERSCHGEN, ERICA A. on 4/28/25.
//

import SwiftUI

struct ContentView: View {
    @State var advice: [String] = []
    var body: some View {
        TabView {
            HomeView(advice: $advice)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            FavoritesView(advice: $advice)
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
        }
    }
}

#Preview {
    ContentView()
}

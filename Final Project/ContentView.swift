//
//  ContentView.swift
//  Final Project
//
//  Created by HOERSCHGEN, ERICA A. on 4/28/25.
//

import SwiftUI

struct ContentView: View {
    @State var favorites: [String] = [] //binding array of strings to send between home and favorite views
    var body: some View {
        TabView {
            HomeView(favorites: $favorites)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            FavoritesView(favorites: $favorites)
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

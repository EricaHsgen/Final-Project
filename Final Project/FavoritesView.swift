//
//  FavoritesView.swift
//  Final Project
//
//  Created by HOERSCHGEN, ERICA A. on 4/30/25.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var favorites: [String]
    var body: some View {
        NavigationStack{ //Scrollable list of favorited items from advice array
            List{
                ForEach(favorites, id: \.self){advice in
                    Text(advice)
                }
            }
            .navigationBarTitle("Favorites ⭐")
        }
    }
}



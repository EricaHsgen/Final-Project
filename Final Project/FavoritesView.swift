//
//  FavoritesView.swift
//  Final Project
//
//  Created by HOERSCHGEN, ERICA A. on 4/30/25.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var advice: [String]
    var body: some View {
        NavigationStack{
            List{
                ForEach(advice, id: \.self){advice in
                    Text(advice)
                }
            }
            .navigationBarTitle("Favorites ⭐")
        }
        .onAppear {
            test()
        }
    }
    func test() {
        print($advice)
    }
}



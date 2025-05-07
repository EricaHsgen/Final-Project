//
//  HomeView.swift
//  Final Project
//
//  Created by HOERSCHGEN, ERICA A. on 4/30/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = AdviceViewModel()
    @Binding var favorites: [String]
    @State private var adviceToggle = false
    @State private var selectedAdvice = "" //advice provided by the API to be used in DetailView and FavoriteView
    @State private var adviceLength = 0       // lenth of the string provided by the API
    @State private var selectedID = ""   //ID from input provided by the user
    
    var body: some View {

        // interactable text field to view DetailView with
            VStack(spacing: 20) {
                Text(viewModel.advice)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundStyle(.white)
                    .onTapGesture {
                        // get information from API then toggle to go to DetailView
                        selectedAdvice = viewModel.advice
                        adviceLength = viewModel.advice.count
                        adviceToggle.toggle()
                    }
                
                // favorites button
                Button("⭐ Save"){
                    favorites.append(viewModel.advice)
                }
                .padding()
                
                // input field
                TextField("Enter a number to get a specific piece of advice", text: $selectedID)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                
                //create new API call with user input
                Button("Generate New") {
                    viewModel.fetchAdvice(adviceID: selectedID)
                }
            .padding()
        }
        
        .padding()
        .onAppear { //API call on startup
            viewModel.fetchAdvice(adviceID: "1")
        }
        // show DetailView
        .fullScreenCover(isPresented: $adviceToggle){
            DetailView(adviceText: $selectedAdvice, adviceLength: $adviceLength)
        }
    }
    
}

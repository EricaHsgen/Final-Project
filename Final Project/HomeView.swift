//
//  HomeView.swift
//  Final Project
//
//  Created by HOERSCHGEN, ERICA A. on 4/30/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = AdviceViewModel()
    @Binding var advice: [String]
    @State private var adviceToggle = false
    @State private var selectedAdvice = ""
    @State private var adviceID = ""
    
    var body: some View {

            VStack(spacing: 20) {
                Text(viewModel.advice)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .foregroundStyle(.black)
                    .onTapGesture {
                        selectedAdvice = viewModel.advice
                        adviceToggle.toggle()
                    }

                Button("⭐ Save"){
                    advice.append(viewModel.advice)
                }
                .padding()
                
                TextField("Enter a number to get a specific piece of advice", text: $adviceID)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                
                Button("Generate New") {
                    viewModel.fetchAdvice(adviceID: adviceID)
                }
            .padding()
        }
        
        .padding()
        .onAppear {
            viewModel.fetchAdvice(adviceID: "1")
        }
        .fullScreenCover(isPresented: $adviceToggle){
            DetailView(adviceText: $selectedAdvice)
        }
    }
    
}

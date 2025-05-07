//
//  AdviceCard.swift
//  Final Project
//
//  Created by HOERSCHGEN, ERICA A. on 5/5/25.
//

import SwiftUI

struct AdviceCard: View {
    let adviceID: String
    @StateObject private var viewModel = AdviceViewModel()
    @Binding var advice: [String]
    
    var body: some View {
        ZStack{
            HStack{
                Text(viewModel.advice)
                    .onAppear {
                        self.viewModel.fetchAdvice(adviceID: adviceID)
                    }
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 250, height: 110)
                    .background(Color.yellow)
                    .cornerRadius(10)
                
                Button("⭐"){
                    advice.append(viewModel.advice)
                }
                .font(.title)
                .padding()
            }
        }
    }
    
}

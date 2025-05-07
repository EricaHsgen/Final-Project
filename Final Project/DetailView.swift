//
//  DetailView.swift
//  Final Project
//
//  Created by HOERSCHGEN, ERICA A. on 5/7/25.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var adviceText: String
    
    var body: some View {
        Text(adviceText)
            .multilineTextAlignment(.center)
            .frame(maxWidth: 350)
            .font(.system(size: 20, weight: .thin, design: .default))
        
        Button(action: {
            dismiss()
        }){
            Text("Back")
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

//#Preview {
//    DetailView()
//}

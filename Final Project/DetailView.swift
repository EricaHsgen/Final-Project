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
    @Binding var adviceLength: Int
    
    var body: some View {
        //Show details
        Text(adviceText)
            .multilineTextAlignment(.center)
            .frame(maxWidth: 350)
            .font(.headline)
        Text("Length of string: \(adviceLength.description)")
            .multilineTextAlignment(.center)
            .font(.subheadline)
        
        Button(action: { // back button
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

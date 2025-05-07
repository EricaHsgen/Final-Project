//
//  APIresponse.swift
//  Final Project
//
//  Created by HOERSCHGEN, ERICA A. on 4/28/25.
//

import SwiftUI

import Foundation

struct AdviceResponse: Codable{
    let slip: Advice
}

struct Advice: Codable{
    let advice: String
    let id: Int
}

class AdviceViewModel: ObservableObject{
    @Published var advice: String = " "
    
    func fetchAdvice(adviceID: String){
        guard let url = URL(string: "https://api.adviceslip.com/advice/\(adviceID)") else{
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data{
                do{
                    let decodedResponse = try JSONDecoder().decode(AdviceResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.advice = decodedResponse.slip.advice
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            } else if let error = error {
                print("HTTP Request failed: \(error)")
            }
        } .resume()
    }
}


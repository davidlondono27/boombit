//
//  ViewModel.swift
//  boombit (iOS)
//
//  Created by David Londoño on 7/09/22.
//

import Foundation

final class JokeViewModel: ObservableObject {
    @Published var jokeDetail: [MainResponse] = []
    
    func getJoke() {
        let urlSession = URLSession.shared
        let url = URL(string: ConstantsText.apiUrl)
        
        urlSession.dataTask(with: url!){data, response, error in
            if let _ = error {
                print(ConstantsText.apiError)
            }
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let mainJoke = try! JSONDecoder().decode(MainResponse.self, from: data)
                DispatchQueue.main.async {
                    print(mainJoke)
                    self.jokeDetail = [mainJoke]
                }
            }
        }.resume()
    }
}

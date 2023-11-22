//
//  HomeViewModel.swift
//  CryptoCurrency
//
//  Created by mohamdan on 22/11/2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    init(){
        fetchCoinData()
    }
    func fetchCoinData(){
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h&locale=en"
        guard let url = URL(string: urlString)else{return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Debug: Error \(error.localizedDescription)")
                return
            }
            if let response = response as? HTTPURLResponse {
                print("Debug: Response \(response.statusCode)")
            }
            guard let data = data else {return}
            do{
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                }
            }catch let error {
                print("Debug: Failed to decode with error\(error)")
                
            }
            
        }.resume()
    }
    func configureTopMovingCoins () {
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topMovingCoins = Array(topMovers.prefix(upTo: 5))
    }
}
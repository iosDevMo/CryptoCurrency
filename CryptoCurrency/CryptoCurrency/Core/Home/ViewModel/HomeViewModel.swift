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
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h&locale=en"
    
    init(){
        loadData()
    }
    @MainActor
    func fetchCoinData()async throws{
        
        guard let url = URL(string: urlString)else{return}
        let (data, response) = try await URLSession.shared.data(from:url)
        guard ( response as? HTTPURLResponse)?.statusCode == 200 else {return}
        guard let coins = try? JSONDecoder().decode([Coin].self, from: data)else{return}
        self.coins = coins
    }
    func loadData(){
        Task(priority: .medium) {
            try await fetchCoinData()
        }
    }
    func configureTopMovingCoins () {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
}

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
    @Published var error : Error?
    private let pageLimit = 20
    private var page = 0
    private var urlString : String {
        return "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=\(pageLimit)&page=\(page)&sparkline=false&price_change_percentage=24h&locale=en"
    }
    init(){
        loadData()
    }
    func handelRefresh() {
        coins.removeAll()
        page = 0
        loadData()
    }
    @MainActor
    func fetchCoinData()async throws{
                do{
                    page+=1
            guard let url = URL(string: urlString)else{throw CoinError.invalidURL}
            let (data, response) = try await URLSession.shared.data(from:url)
            guard ( response as? HTTPURLResponse)?.statusCode == 200 else {throw CoinError.serverError}
            guard let coins = try? JSONDecoder().decode([Coin].self, from: data)else{throw CoinError.invalidData}
                    self.coins.append(contentsOf: coins)
        }catch{
            self.error = error
        }
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

//
//  AllCoinsView.swift
//  CryptoCurrency
//
//  Created by mohamdan on 22/11/2023.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel : HomeViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
            HStack{
                Text("Coin")
                Spacer()
                Text("Price")
            }
            .font(.caption)
            .foregroundColor(.secondary)
            ScrollView {
                VStack{
                    ForEach(viewModel.coins){ coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
            
        }.padding()
    }
}

//#Preview {
//    AllCoinsView()
//}

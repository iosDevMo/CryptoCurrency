//
//  CoinRowView.swift
//  CryptoCurrency
//
//  Created by mohamdan on 22/11/2023.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    let coin : Coin
    var body: some View {
        HStack {
            // market cap rank
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundColor(.secondary)
            // image
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            //coin name info
            VStack(alignment: .leading, spacing: 0) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }.padding(.leading, 2)
            Spacer()
            // coin price info
            VStack(alignment: .trailing, spacing: 0) {
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(coin.priceChangePercentage24H.toPercentString())
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(coin.priceChangePercentage24H>0 ? .green:.red)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//#Preview {
//    CoinRowView()
//}

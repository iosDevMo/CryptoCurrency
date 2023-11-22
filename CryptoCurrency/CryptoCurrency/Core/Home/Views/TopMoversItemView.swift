//
//  TopMoversItemView.swift
//  CryptoCurrency
//
//  Created by mohamdan on 22/11/2023.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin : Coin
    var body: some View {
        VStack(alignment: .leading){
            // image
            KFImage(URL(string:coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .padding(.bottom,4)
            
            //coin inf
            HStack(spacing: 2) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                Text(coin.currentPrice.toCurrency())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            // coin perecent change
            Text(coin.priceChangePercentage24H.toPercentString())
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H>0 ? .green:.red)
        }
        .frame(width: 130, height: 130)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
        }
    }
}

//#Preview {
//    TopMoversItemView()
//}

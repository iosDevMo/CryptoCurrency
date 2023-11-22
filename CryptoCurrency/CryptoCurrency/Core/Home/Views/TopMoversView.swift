//
//  TopMoversView.swift
//  CryptoCurrency
//
//  Created by mohamdan on 22/11/2023.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel : HomeViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal){
                HStack(spacing: 16) {
                    ForEach(viewModel.coins) { coin in
                        TopMoversItemView(coin: coin)
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    TopMoversView(viewModel: HomeViewModel())
}

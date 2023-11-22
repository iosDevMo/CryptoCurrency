//
//  AllCoinsView.swift
//  CryptoCurrency
//
//  Created by mohamdan on 22/11/2023.
//

import SwiftUI

struct AllCoinsView: View {
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
                    ForEach(0 ..< 50, id: \.self){ _ in
                        CoinRowView()
                    }
                }
            }
            
        }.padding()
    }
}

#Preview {
    AllCoinsView()
}

//
//  TopMoversView.swift
//  CryptoCurrency
//
//  Created by mohamdan on 22/11/2023.
//

import SwiftUI

struct TopMoversView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal){
                HStack(spacing: 16) {
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/, id: \.self) { _ in
                        TopMoversItemView()
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    TopMoversView()
}

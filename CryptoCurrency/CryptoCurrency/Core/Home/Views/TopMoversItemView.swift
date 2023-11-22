//
//  TopMoversItemView.swift
//  CryptoCurrency
//
//  Created by mohamdan on 22/11/2023.
//

import SwiftUI

struct TopMoversItemView: View {
    var body: some View {
        VStack(alignment: .leading){
            // image
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom,4)
            
            //coin inf
            HStack(spacing: 2) {
                Text("BTC")
                    .font(.caption)
                    .fontWeight(.bold)
                Text("$2,000.00")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            // coin perecent change
            Text("+5.60%")
                .font(.title2)
                .foregroundColor(.green)
        }
        .frame(width: 130, height: 130)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
        }
    }
}

#Preview {
    TopMoversItemView()
}

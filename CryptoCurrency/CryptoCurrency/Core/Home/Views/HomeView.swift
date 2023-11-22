//
//  ContentView.swift
//  CryptoCurrency
//
//  Created by mohamdan on 22/11/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                // top movers view
                TopMoversView()
                Divider()
                // all coins view
                AllCoinsView()
            }
            .navigationTitle("Live Prices")
        }
        
        
       
    }
}

#Preview {
    HomeView()
}

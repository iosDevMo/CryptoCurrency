//
//  ContentView.swift
//  CryptoCurrency
//
//  Created by mohamdan on 22/11/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var showAlert = false
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                // top movers view
                TopMoversView(viewModel: viewModel)
                Divider()
                // all coins view
                AllCoinsView(viewModel: viewModel)
            }.refreshable {
                viewModel.handelRefresh()
            }
            .onReceive(viewModel.$error, perform: { error in
                if error != nil {
                    showAlert.toggle()
                }
            }).alert(isPresented: $showAlert, content: {
                Alert(title:Text("Error"),
                      message: Text (viewModel.error?.localizedDescription ?? ""))
            })
            .navigationTitle("Live Prices")
        }
        
        
       
    }
}

#Preview {
    HomeView()
}

//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Rana Ayman on 17/10/2023.
//

import Foundation


class HomeViewModel : ObservableObject {

    @Published var allCoins : [CoinModel] = [ ]
    @Published var portfolioCoins : [CoinModel] = []

    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0 ){
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}

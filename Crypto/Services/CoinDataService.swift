//
//  CoinDataService.swift
//  Crypto
//
//  Created by Rana Ayman on 17/10/2023.
//

import Foundation
import Combine

class CoinDataService {

    // Publishers and subscribers
    // when the publisher change all the subscribers will be updated

    @Published var allCoins  : [CoinModel] = []
    var coinSubscription : AnyCancellable?

    init () {
        getCoins()
    }

    private func getCoins() {

        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en")
        else { return }

        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }
}

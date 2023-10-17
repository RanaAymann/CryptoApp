//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Rana Ayman on 17/10/2023.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject {

    @Published var allCoins : [CoinModel] = [ ]
    @Published var portfolioCoins : [CoinModel] = []

    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()


    init() {
        addSubscribers()

//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0 ){
//            self.allCoins.append(DeveloperPreview.instance.coin)
//            self.portfolioCoins.append(DeveloperPreview.instance.coin)
//        }
    }

    func addSubscribers(){
        // .$allCoins -> is a subscriber
        dataService.$allCoins
            .sink { (returnedCoins) in
                self.allCoins = returnedCoins
            }.store(in: &cancellables)

    }
}

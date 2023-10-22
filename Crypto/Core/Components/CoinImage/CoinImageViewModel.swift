//
//  CoinImageViewModel.swift
//  Crypto
//
//  Created by Rana Ayman on 22/10/2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel : ObservableObject {

    @Published var image : UIImage? = nil
    @Published var isLoading : Bool = false

    private let coin: CoinModel
    // create dataService and subscribe to it
    private let dataService : CoinImageService
    private var cancellables = Set<AnyCancellable>()

    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSubscribers()
        self.isLoading = true
    }

    private func addSubscribers () {
        // to subscribe to published var image in CoinImageService -> $image

        // [weak self] to make it optional

        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)



    }
}

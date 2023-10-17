//
//  CryptoApp.swift
//  Crypto
//
//  Created by Rana Ayman on 16/10/2023.
//

import SwiftUI

@main
struct CryptoApp: App {

    @StateObject private var vm = HomeViewModel()

    var body: some Scene {
        WindowGroup {
//            ContentView()
            NavigationView {
                HomeView().navigationBarHidden(true)
            }.environmentObject(vm)
        }
    }
}

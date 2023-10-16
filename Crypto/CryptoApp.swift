//
//  CryptoApp.swift
//  Crypto
//
//  Created by Rana Ayman on 16/10/2023.
//

import SwiftUI

@main
struct CryptoApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            NavigationView {
                HomeView().navigationBarHidden(true)
            }
        }
    }
}

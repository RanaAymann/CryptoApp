//
//  Color.swift
//  Crypto
//
//  Created by Rana Ayman on 16/10/2023.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme  = ColorTheme()
}


struct ColorTheme {
    // color name must be the same name in assets
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")

}

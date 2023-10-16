//
//  HomeView.swift
//  Crypto
//
//  Created by Rana Ayman on 16/10/2023.
//

import SwiftUI

struct HomeView: View {

    @State private var showPortfolio: Bool = false


    var body: some View {
        ZStack {
            // background layer
            Color.theme.background.ignoresSafeArea()
            // content layer
            VStack{
                homeHeader
                Spacer(minLength: 0)
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView().navigationBarHidden(true)
        }
    }
}


extension HomeView {
    private var homeHeader : some View {
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus":"info")
                .animation(Animation.default, value: 0.0)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio":"Live Prices").font(.headline).fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(Animation.default, value: 0.0)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
// toggle -> If showPortfolio is true, it will become false, and if it's false, it will become true
                        showPortfolio.toggle()
                    }
                }
        }.padding(.horizontal)
    }
}

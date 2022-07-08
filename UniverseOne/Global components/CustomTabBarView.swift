//
//  CustomTabBarView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 25.02.2022.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let mainHeight = UIScreen.main.bounds.height
    let mainWidth = UIScreen.main.bounds.width
    @Binding var screen: Screens
    var body: some View {
        ZStack {
            
            BarRectangle()
            
            HStack(spacing: mainWidth / 25) {
                GradientButtonView(action: {screen = .apod},
                                   imageName: "moon.circle",
                                   colors: [.blue,.purple])
                    .opacity(screen == .apod ? 1 : 0.3)
                
                GradientButtonView(action: {screen = .favorite},
                                   imageName: "heart.circle",
                                   colors: [.pink,.purple])
                    .opacity(screen == .favorite ? 1 : 0.3)
                
                GradientButtonView(action: { screen = .random },
                                   imageName: "shuffle.circle",
                                   colors: [.green,.blue])
                    .opacity(screen == .random ? 1 : 0.3)
                
                GradientButtonView(action: {screen = .settings},
                                   imageName: "gear.circle",
                                   colors: [.white,.gray])
                    .opacity(screen == .settings ? 1 : 0.3)
            }
        }
        .frame(width: mainWidth, height: mainHeight / 10)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView(screen: .constant(.apod))
    }
}

struct BarRectangle: View {
    let mainHeight = UIScreen.main.bounds.height
    let mainWidth = UIScreen.main.bounds.width
    var body: some View {
        Rectangle()
            .frame(width: mainWidth - 20, height: mainHeight / 12)
            .opacity(0)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            //.opacity(0.7)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(LinearGradient(colors: [.blue,.purple,.green,.gray],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing))
                    .opacity(0.5)
            )
    }
}

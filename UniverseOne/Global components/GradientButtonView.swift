//
//  GradientButtonView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 25.02.2022.
//

import SwiftUI

struct GradientButtonView: View {
    let action: () -> Void
    let imageName: String
    let colors: [Color]
    let mainHeight = UIScreen.main.bounds.height
    let mainWidth = UIScreen.main.bounds.width
    
    var body: some View {
        Button(action: action) {
            LinearGradient(colors: colors,
                           startPoint: .leading,
                           endPoint: .trailing)
                .mask(Image(systemName: imageName)
                        .font(.system(size: mainHeight / 22))
                )
        }
    }
}

struct GradientButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GradientButtonView(action: {},
                           imageName: "globe.americas",
                           colors: [.blue, .purple])
    }
}

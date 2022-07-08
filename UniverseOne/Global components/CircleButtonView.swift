//
//  CircleButtonView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 28.02.2022.
//

import SwiftUI

struct CircleButtonView: View {
    let mainHeight = UIScreen.main.bounds.height
    let mainWidth = UIScreen.main.bounds.width
    let imageName: String
    let action: () -> Void
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: mainWidth / 8, height: mainHeight / 17)
                .opacity(0)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
            Button(action: action) {
                Image(systemName: imageName)
                    .font(.system(size: mainHeight / 30))
                    .foregroundColor(color)
            }
        }

    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(imageName: "info", action: {}, color: .blue)
    }
}

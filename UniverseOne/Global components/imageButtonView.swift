//
//  imageButtonView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 26.02.2022.
//

import SwiftUI

struct imageButtonView: View {
    let iamgeName: String
    let action: () -> Void
    let color: Color
    var body: some View {
        Button(action: action) {
            Image(systemName: iamgeName)
                .font(.system(size: 30))
                .foregroundColor(color)
        }
    }
}

struct imageButtonView_Previews: PreviewProvider {
    static var previews: some View {
        imageButtonView(iamgeName: "Info",
                        action: {},
                        color: .blue)
    }
}

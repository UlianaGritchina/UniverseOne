//
//  BackView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 14.04.2022.
//

import SwiftUI

struct BackView: View {
    let back: Back
    var body: some View {
        ZStack {
            Color(.black)
            Image(UserDefaults.standard.string(forKey: "backgroundImage") ?? "Back7")
                .resizable()
                .opacity(0.5)
        }
        .ignoresSafeArea()
    }
}

struct BackView_Previews: PreviewProvider {
    static var previews: some View {
        BackView(back: .back)
    }
}

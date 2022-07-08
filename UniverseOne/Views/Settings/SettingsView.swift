//
//  SettongsView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 08.03.2022.
//

import SwiftUI

struct SettingsView: View {
    @Binding var back: Back
    var body: some View {
        ZStack {
            VStack {
                Text("").padding()
                WallpaperView(back: $back).padding(.top)
                SupportView()
            }
        }
    }
}

struct SettongsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(back: .constant(.back))
            .preferredColorScheme(.dark)
    }
}


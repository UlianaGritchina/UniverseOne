//
//  WallpaperView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 10.04.2022.
//

import SwiftUI

struct WallpaperView: View {
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    @Binding var back: Back
    var body: some View {
        VStack(alignment: .leading) {
            Text("Wallpaper")
                .bold()
                .font(.system(size: height / 35))
            Text("Scroll to chouse wallpaper")
            ZStack {
                Rectangle()
                    .frame(width: width - 40, height: height / 8)
                    .opacity(0)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Text("")
                        ForEach(0..<8) {
                            SettingsImageView(
                                imageName:"Back\(String($0))",
                                back: $back,
                                index: $0)
                        }
                        Text("")
                    }
                }
                .frame(width: width - 40, height: height / 8)
                .cornerRadius(20)
            }
        }
        
    }
    
}

struct WallpaperView_Previews: PreviewProvider {
    static var previews: some View {
        WallpaperView(back: .constant(.back))
    }
}

struct SettingsImageView: View {
    var imageName: String
    @Binding var back: Back
    var index: Int
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: width / 5, height: height / 9)
            .cornerRadius(10)
            .onTapGesture {
                switch index {
                case 0: back = .back
                case 1: back = .back1
                case 2: back = .back2
                case 3: back = .back3
                case 4: back = .back4
                case 5: back = .back5
                case 6: back = .back6
                case 7: back = .back6
                default:
                    back = .back
                }
                UserDefoltsDataManager.shered.saveBackgroundImage(
                    imageName: imageName
                )
            }
    }
}

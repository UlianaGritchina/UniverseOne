//
//  ImageView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 28.02.2022.
//

import SwiftUI

struct ImageView: View {
    let stringUrl: String
    let mediaType: String
    @State private var showVideo = false
    var body: some View {
        switch mediaType {
        case "image": ImageCard(stringUrl: stringUrl)
        case "video": VideoCard(stringUrl: stringUrl)
        default: Text("")
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(stringUrl: "", mediaType: "video")
    }
}

struct ImageCard: View {
    let stringUrl: String
    var body: some View {
        ApodContentView(vm: ApodContentViewViewModel(mediaTapy: "image",
                                                     stringUrl: stringUrl))
    }
}

struct VideoCard: View {
    let stringUrl: String
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    var body: some View {
        ZStack {
            Image("Back0")
                .frame(width: width / 1.3, height: height / 3)
                .cornerRadius(20)
            Rectangle()
                .foregroundColor(.white)
                .frame(width: width / 1.3, height: height / 3)
                .opacity(0)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.5),
                        radius: 10, x: 0, y: 0)
            
            Link(destination: URL(string: stringUrl) ?? URL(fileURLWithPath: "")) {
                Text("Whatch video")
                    .font(.system(size: height / 25))
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: width / 1.3, height: height / 7)
            }
        }
    }
}

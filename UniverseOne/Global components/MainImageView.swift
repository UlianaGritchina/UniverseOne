//
//  ImageView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 25.02.2022.
//

import SwiftUI

struct MainImageView: View {
    let mainHeight = UIScreen.main.bounds.height
    let mainWidth = UIScreen.main.bounds.width
    let infoAction: () -> Void
    let saveAction: () -> Void
    let stringUrl: String
    let mediaType: String
    @State private var isFavorite = false
    @State private var isShowingShareSheet = false
    var body: some View {
        VStack(spacing: 10) {
            
            Spacer()
            
            if mediaType != "" {
                ApodContentView(vm: ApodContentViewViewModel(mediaTapy: mediaType,
                                                             stringUrl: stringUrl))
                    .padding()
            }
            else {
                ProgressView()
            }
           
            Spacer()
            
            HStack() {
                
                CircleButtonView(imageName: "heart.fill",
                                 action: {
                    if !isFavorite {
                        saveAction()
                        Global.shared.favorites = CoreDataManager.shered.fetchApods()
                        isFavorite.toggle()
                    }
                    
                },
                                 color: isFavorite ? .red : .gray)
                Spacer()
                
                CircleButtonView(imageName: "info",
                                 action: infoAction,
                                 color: .blue)

            }
            .padding(.horizontal, 40)
            .padding(.bottom, mainHeight / 15)
        }
        .preferredColorScheme(.dark)

    }
    

}


struct MainImageView_Preview: PreviewProvider {
    static var previews: some View {
        MainImageView(infoAction: {},
                      saveAction: {},
                      stringUrl: "https://apod.nasa.gov/apod/image/2202/NGC4945-Dietmar-Eric-crop1024.jpg",
                      mediaType: "iamge")
    }
}




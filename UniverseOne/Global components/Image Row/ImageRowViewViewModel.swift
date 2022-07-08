//
//  ImageRowViewViewModel.swift
//  PocketSpace
//
//  Created by Ульяна Гритчина on 05.06.2022.
//

import Foundation

class ImageRowViewViewModel: ObservableObject {
    
    let apod: AstronomyImage
    let fromScreen: Screens
    
    @Published var isShowinInfo = false
    @Published var isShowingDetail = false
    @Published var isFavorite = false
    @Published var isShowingAction = false
    
    init(apod: AstronomyImage, fromScreen: Screens) {
        self.apod = apod
        self.fromScreen = fromScreen
    }
    
    func showInfo() {
        isShowinInfo.toggle()
    }
    
    func showShareView() {
        isShowingDetail.toggle()
    }
    
}



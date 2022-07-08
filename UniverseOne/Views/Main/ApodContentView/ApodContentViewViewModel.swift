//
//  ApodContentViewViewModel.swift
//  PocketSpace
//
//  Created by Ульяна Гритчина on 10.06.2022.
//

import SwiftUI

enum NetworkState {
    case loaded
    case loadingError
    case loading
}


protocol DateDelegate {
    func findImage(url: String)
}
class ApodContentViewViewModel: ObservableObject {
    
    @Published var image: UIImage!
    @Published var imageData: Data!
    @Published var network: NetworkState = .loading
    @Published var isShowingShareView = false
    let stringUrl: String
    let mediaTapy: String
    
    init(mediaTapy: String, stringUrl: String) {
        self.mediaTapy = mediaTapy
        self.stringUrl = stringUrl
        fetchImage(stringUrl: stringUrl)
    }
    
    func fetchImage(stringUrl: String) {
        NetworkManager.shared.downloadImage(from: stringUrl) { image, data, networkState in
            DispatchQueue.main.async {
                guard let image = image, let data = data else { return }
                self.image = image
                self.imageData = data
                self.network = networkState
                Global.shared.imageData = data
            }
        }
    }
    
}

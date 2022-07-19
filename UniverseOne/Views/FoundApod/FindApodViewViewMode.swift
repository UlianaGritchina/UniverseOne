//
//  FindApodViewViewMode.swift
//  UniverseOne
//
//  Created by Ульяна Гритчина on 19.07.2022.
//

import Foundation

class FindApodViewViewModel: ObservableObject {
    
    @Published var date = Date()
    @Published var imageState: ImageState = .noImage
    @Published var imageData: Data? = nil
    @Published var isShowDetail = false
    @Published var isShowingDetailView = false
    @Published var astronomyImage: AstronomyImage = AstronomyImage(title: "",
                                                               date: "",
                                                               explanation: "",
                                                               url: "",
                                                               media_type: "")
     func findImage()  {
        imageState = .downloading
        Task {
            do {
                self.astronomyImage = try await NetworkManager.shared.fetchData(from: date)
                NetworkManager.shared.downloadImage(from: self.astronomyImage.url ?? "" ) { image, data, networkState in
                    self.imageData = data ?? Data()
                    self.imageState = .image
                }
            } catch {
                self.imageState = .noImage
                print(error)
            }
        }
    }
    
}

enum ImageState {
    case noImage
    case downloading
    case image
}

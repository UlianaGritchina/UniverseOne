//
//  ApodViewViewMode.swift
//  APOD
//
//  Created by Ульяна Гритчина on 05.06.2022.
//

import Foundation

protocol ApodViewModelProtocol {
    var astronomyImage: AstronomyImage { get }
    var isShowInfo: Bool { get }
    func fetchAstronomyData(from date: Date)
    func showInfo()
    func saveApod(_ astonomyImage: AstronomyImage)
}

class ApodViewModel: ApodViewModelProtocol, ObservableObject {
    @Published var isSaved: Bool = false
    @Published var isShowInfo: Bool = false
    @Published var astronomyImage: AstronomyImage = AstronomyImage(
        title: "", date: "", explanation: "", url: "", media_type: ""
    )
    
    init() {
        fetchAstronomyData()
    }
    func showInfo() {
        isShowInfo.toggle()
    }
    
    func fetchAstronomyData(from date: Date) {
        Task {
            do {
                self.astronomyImage = try await NetworkManager.shared.fetchData(from: date)
                NetworkManager.shared.downloadImage(from: self.astronomyImage.url ?? "" ) { image, data, networkState in
                    Global.shared.imageData = data
                }
            } catch {
                print(error)
            }
        }
    }
    
    func fetchAstronomyData() {
        Task {
            do {
                self.astronomyImage = try await NetworkManager.shared.fetchData()
            } catch {
                print(error)
            }
        }
    }
    
    func saveApod(_ astonomyImage: AstronomyImage) {
        CoreDataManager.shered.addApod(astonomyImage: astonomyImage)
    }
}


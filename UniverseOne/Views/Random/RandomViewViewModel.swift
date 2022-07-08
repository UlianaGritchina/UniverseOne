//
//  RandomViewViewModel.swift
//  APOD
//
//  Created by Ульяна Гритчина on 21.03.2022.
//

import Foundation


class RandomViewViewModel: ObservableObject {
    
    @Published var apods: [AstronomyImage] = []
    @Published var isShowInfo = false
    @Published var title = ""
    @Published var explanation = ""
    
    init() {
        fetchAstronomyData()
    }
    
    func fetchAstronomyData() {
        Task {
            do {
               // self.apods.removeAll()
                self.apods += try await NetworkManager.shared.fetcRandomImages()
            } catch {
                print(error)
            }
        }
    }
    
    func showInfoTogle() {
        isShowInfo.toggle()
    }
    
    func getInfo(title: String, explanation: String) {
        self.title = title
        self.explanation = explanation
    }
    
}

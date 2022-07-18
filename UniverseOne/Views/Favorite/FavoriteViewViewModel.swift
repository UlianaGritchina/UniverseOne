//
//  FavoriteViewViewModel.swift
//  APOD
//
//  Created by Ульяна Гритчина on 15.03.2022.
//

import Foundation

class FavoriteViewViewModel: ObservableObject {
    
    @Published var apods: [Apod] = CoreDataManager.shered.fetchApods()
    
    func delete(_ apod: Apod) {
        CoreDataManager.shered.deleteApod(apod: apod)
        apods = CoreDataManager.shered.fetchApods()
    }
    
    func saveApod(_ apod: Apod) {
        CoreDataManager.shered.addApod(apod)
    }
    
}


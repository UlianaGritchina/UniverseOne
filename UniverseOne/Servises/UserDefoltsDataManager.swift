//
//  DataManager.swift
//  APOD
//
//  Created by Ульяна Гритчина on 08.03.2022.
//

import Foundation

class UserDefoltsDataManager {
    static var shered = UserDefoltsDataManager()
    
    private init() {}
    
    func saveBackgroundImage(imageName: String) {
        UserDefaults.standard.set(imageName, forKey: "backgroundImage")
    }
    
    func setIsFavorite(status: Bool , for url: String) {
        UserDefaults.standard.set(status, forKey: url)
    }
    
    func getStatus(for url: String) -> Bool {
        return UserDefaults.standard.bool(forKey: url)
    }
}

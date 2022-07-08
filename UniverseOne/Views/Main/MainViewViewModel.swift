//
//  MainViewViewModel.swift
//  APOD
//
//  Created by Ульяна Гритчина on 14.04.2022.
//

import Foundation

class MainViewViewModel: ObservableObject {
    @Published var screen: Screens = .apod
    @Published var showDatePicker = false
    @Published var back: Back = .back
    @Published var date = Date()
}

enum Screens: String {
    case apod = "APOD"
    case favorite = "Favorite"
    case random = "Random"
    case settings = "Settings"
}

enum Back: String {
    case back  = "Back0"
    case back1 = "Back1"
    case back2 = "Back2"
    case back3 = "Back3"
    case back4 = "Back4"
    case back5 = "Back5"
    case back6 = "Back6"
    case back7 = "Back7"
}

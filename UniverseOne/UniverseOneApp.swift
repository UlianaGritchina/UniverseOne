//
//  UniverseOneApp.swift
//  UniverseOne
//
//  Created by Ульяна Гритчина on 08.07.2022.
//

import SwiftUI

@main
struct UniverseOneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

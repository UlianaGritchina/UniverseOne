//
//  CoreDataManager.swift
//  APOD
//
//  Created by Ульяна Гритчина on 11.03.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    let container: NSPersistentContainer
    
    static let shered = CoreDataManager()
    
    init() {
        container = NSPersistentContainer(name: "APOD")
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error)
            }
        }
    }
    
    func fetchApods() -> [Apod] {
        let request = NSFetchRequest<Apod>(entityName: "Apod")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Apod.date, ascending: false)]
        do {
            return try container.viewContext.fetch(request)
        } catch let error {
            print(error)
            return []
        }
    }
    
    func addApod(astonomyImage: AstronomyImage) {
        let apod = Apod(context: container.viewContext)
        apod.isFavorite = true
        apod.title = astonomyImage.title
        apod.explanation = astonomyImage.explanation
        apod.imageUrl = astonomyImage.url
        apod.mediaType = astonomyImage.media_type
        apod.stringDate = astonomyImage.date
        apod.date = Date()
        saveData()
    }
    func addApod(_ apod: Apod) {
        let apod1 = Apod(context: container.viewContext)
        apod1.isFavorite = apod.isFavorite
        apod1.title = apod.title
        apod1.explanation = apod.explanation
        apod1.imageUrl = apod.imageUrl
        apod1.mediaType = apod.mediaType
        apod1.stringDate = apod.stringDate
        apod1.date = Date()
        saveData()
    }
    
    func deleteApod(apod: Apod) {
        container.viewContext.delete(apod)
        saveData()
    }
    
    func deleteApod(astronomyImage: AstronomyImage) {
        let apod = Apod(context: container.viewContext)
        apod.title = astronomyImage.title
        apod.explanation = astronomyImage.explanation
        apod.imageUrl = astronomyImage.url
        apod.mediaType = astronomyImage.media_type
        apod.date = Date()
        container.viewContext.delete(apod)
        saveData()
    }
    
    private func saveData() {
        do {
            try container.viewContext.save()
        } catch {
            print(error)
        }
    }
}

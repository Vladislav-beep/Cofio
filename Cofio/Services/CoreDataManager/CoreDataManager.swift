//
//  CoreDataManager.swift
//  Cofio
//
//  Created by Владислав Сизонов on 29.12.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataRelationship")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    // MARK: Save support
    
    func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: Object creation
    
    func createCollection(name: String, icon: String) -> Collection {
        let collection = Collection(context: persistentContainer.viewContext)
        collection.name = name
        collection.icon = icon
        return collection
    }

    func createTheme(name: String,
               repeats: Int,
               repeatDate: Date,
               isRepeatComplete: Bool,
               collection: Collection) -> Theme {
        let theme = Theme(context: persistentContainer.viewContext)
        theme.name = name
        theme.repeats = Int64(repeats)
        theme.repeatDate = repeatDate
        theme.isRepeatComplete = isRepeatComplete
        collection.addToThemes(theme)
        return theme
    }

    func createCard(cardDefinition: String, cardDescription: String, theme: Theme) -> Card {
        let card = Card(context: persistentContainer.viewContext)
        card.cardDefinition = cardDefinition
        card.cardDescription = cardDescription
        theme.addToCards(card)
        return card
    }
}

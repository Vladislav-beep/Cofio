//
//  CoreDataManager.swift
//  Cofio
//
//  Created by Владислав Сизонов on 29.12.2022.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    
    func save()
    
    func createCollection(name: String, icon: String)
    func fetchCollections() -> [Collection]
    func deleteCollection(collectionName: String)
    func updateCollection(withName: String, newName: String, icon: String)
    
    func createTheme(name: String, repeats: Int, repeatDate: Date, isRepeatComplete: Bool, collectionName: String)
    func fetchThemes(collectionName: String) -> [Theme]
    func deleteTheme(collectionName: String, themeName: String)
    func updateTheme(collectionName: String, themeName: String, newName: String)
    
    func createCard(cardDefinition: String, cardDescription: String, themeName: String)
    func fetchCards(themeName: String) -> [Card]
    
    
}

class CoreDataManager: CoreDataManagerProtocol {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        
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
    
    // MARK: Creation
    
    func createCollection(name: String, icon: String) {
        let collection = Collection(context: persistentContainer.viewContext)
        collection.name = name
        collection.icon = icon
    }

    func createTheme(name: String,
               repeats: Int,
               repeatDate: Date,
               isRepeatComplete: Bool,
               collectionName: String) {
        let theme = Theme(context: persistentContainer.viewContext)
        theme.name = name
        theme.repeats = Int64(repeats)
        theme.repeatDate = repeatDate
        theme.isRepeatComplete = isRepeatComplete
        
        let request: NSFetchRequest<Collection> = Collection.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", collectionName)
        
        do {
            let collection = try persistentContainer.viewContext.fetch(request).first
            theme.collection = collection
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    func createCard(cardDefinition: String, cardDescription: String, themeName: String) {
        let card = Card(context: persistentContainer.viewContext)
        card.cardDefinition = cardDefinition
        card.cardDescription = cardDescription
        
        let request: NSFetchRequest<Theme> = Theme.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", themeName)
        
        do {
            let theme = try persistentContainer.viewContext.fetch(request).first
            card.theme = theme
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    // MARK: Fetching
    
    func fetchCollections() -> [Collection] {
        let request: NSFetchRequest<Collection> = Collection.fetchRequest()
        var fetchedCollections: [Collection] = []
        
        do {
            fetchedCollections = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching collections \(error)")
        }
        return fetchedCollections
    }
    
    func fetchThemes(collectionName: String) -> [Theme] {
      let request: NSFetchRequest<Theme> = Theme.fetchRequest()
      request.predicate = NSPredicate(format: "collection.name == %@", collectionName)

      var fetchedThemes: [Theme] = []
      do {
          fetchedThemes = try persistentContainer.viewContext.fetch(request)
      } catch let error {
        print("Error fetching themes \(error)")
      }
      return fetchedThemes
    }
    
    func fetchCards(themeName: String) -> [Card] {
        let request: NSFetchRequest<Card> = Card.fetchRequest()
        request.predicate = NSPredicate(format: "theme.name == %@", themeName)
        
        var fetchedCards: [Card] = []
        do {
            fetchedCards = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching themes \(error)")
        }
        return fetchedCards
    }
    
    // MARK: Deletion
    
    func deleteCollection(collectionName: String) {
        let request: NSFetchRequest<Collection> = Collection.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", collectionName)
        
        do {
            let collection = try persistentContainer.viewContext.fetch(request).first!
            persistentContainer.viewContext.delete(collection)
        } catch let error {
            print("Error deleting collection \(error)")
        }
        
        save()
    }
    
    func deleteTheme(collectionName: String, themeName: String) {
        let collectionPredicate = NSPredicate(format: "collection.name == %@", collectionName)
        let namePredicate = NSPredicate(format: "name == %@", themeName)
        let andPredicate = NSCompoundPredicate(type: .and, subpredicates: [collectionPredicate, namePredicate])
        
        let request: NSFetchRequest<Theme> = Theme.fetchRequest()
        request.predicate = andPredicate
        
        do {
            let theme = try persistentContainer.viewContext.fetch(request).first!
            persistentContainer.viewContext.delete(theme)
        } catch let error {
            print("Error deleting collection \(error)")
        }
        
        save()
    }
    
    // MARK: Update
    
    func updateCollection(withName: String, newName: String, icon: String) {
        let request: NSFetchRequest<Collection> = Collection.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", withName)
        
        do {
            let collection = try persistentContainer.viewContext.fetch(request).first!
            collection.name = newName
            collection.icon = icon
        } catch let error {
            print("Error deleting collection \(error)")
        }
    }
    
    func updateTheme(collectionName: String, themeName: String, newName: String) {
        let collectionPredicate = NSPredicate(format: "collection.name == %@", collectionName)
        let namePredicate = NSPredicate(format: "name == %@", themeName)
        let andPredicate = NSCompoundPredicate(type: .and, subpredicates: [collectionPredicate, namePredicate])
        
        let request: NSFetchRequest<Theme> = Theme.fetchRequest()
        request.predicate = andPredicate
        
        do {
            let theme = try persistentContainer.viewContext.fetch(request).first!
            theme.name = newName
        } catch let error {
            print("Error deleting collection \(error)")
        }
        
        save()
    }
}

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
    
    func createTheme(name: String,
               repeats: Int,
               repeatDate: Date,
               isRepeatComplete: Bool,
               collectionName: String)
    
    func fetchThemes(collectionName: String) -> [Theme]
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
    
    // MARK: Object creation
    
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
    
    // MARK: Fetching data
    
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
}

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
    
    func createTheme(name: String, repeats: Int, repeatDate: Date, isRepeatComplete: Bool, repetitionType: String, collectionName: String, isBeingRepeated: Bool)
    func fetchThemes(collectionName: String, creationDate: Date) -> [Theme]
    func fetchTheme(themeName: String) -> Theme
    func deleteTheme(collectionName: String, themeName: String)
    func updateTheme(collectionName: String, themeName: String, newName: String)
    func updateThemeRepeating(collectionName: String, themeName: String)
    
    func createCard(cardDefinition: String, cardDescription: String, themeName: String)
    func fetchCards(themeName: String) -> [Card]
    func deleteCard(themeName: String, cardName: String)
    func updateCard(themeName: String, cardDefinition: String, newDefinition: String, newDescription: String)
    
    func fetchAllThemesForRepetition() -> [Theme]
    
    func updateThemeDate(themeName: String, newDate: Date, newRepeats: Int, isRepeatCompleted: Bool)
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
        context.mergePolicy = NSMergePolicy(merge: .overwriteMergePolicyType)
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
        collection.creationDate = Date()
        
        save()
    }
    
    func createTheme(name: String,
                     repeats: Int,
                     repeatDate: Date,
                     isRepeatComplete: Bool,
                     repetitionType: String,
                     collectionName: String,
                     isBeingRepeated: Bool) {
        let theme = Theme(context: persistentContainer.viewContext)
        theme.name = name
        theme.repeats = Int64(repeats)
        theme.repeatDate = repeatDate
        theme.isRepeatComplete = isRepeatComplete
        theme.creationDate = Date()
        theme.repetitionType = repetitionType
        theme.isBeingRepeated = isBeingRepeated
        
        let request: NSFetchRequest<Collection> = Collection.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", collectionName)
        
        do {
            let collection = try persistentContainer.viewContext.fetch(request).first
            theme.collection = collection
        } catch let error {
            fatalError("Error creating theme \(error)")
        }
        
        save()
    }
    
    func createCard(cardDefinition: String, cardDescription: String, themeName: String) {
        let card = Card(context: persistentContainer.viewContext)
        card.cardDefinition = cardDefinition
        card.cardDescription = cardDescription
        card.creationDate = Date()
        
        let request: NSFetchRequest<Theme> = Theme.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", themeName)
        
        do {
            let theme = try persistentContainer.viewContext.fetch(request).first
            card.theme = theme
        } catch let error {
            fatalError("Error creating card \(error)")
        }
        
        save()
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
    
    func fetchThemes(collectionName: String, creationDate: Date) -> [Theme] {
        let request: NSFetchRequest<Theme> = Theme.fetchRequest()
        let namePredicate = NSPredicate(format: "collection.name == %@", collectionName)
        let datePredicate = NSPredicate(format: "collection.creationDate == %@", creationDate as NSDate)
        let multiplePredicate = NSCompoundPredicate(type: .and, subpredicates: [namePredicate, datePredicate])
        request.predicate = multiplePredicate
        
        var fetchedThemes: [Theme] = []
        do {
            fetchedThemes = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching themes \(error)")
        }
        return fetchedThemes
    }
    
    func fetchTheme(themeName: String) -> Theme {
        let request: NSFetchRequest<Theme> = Theme.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", themeName)
        
        var fetchedTheme: Theme?
        do {
            fetchedTheme = try persistentContainer.viewContext.fetch(request).first
        } catch let error {
            print("Error fetching themes \(error)")
        }
        return fetchedTheme!
    }
    
    func fetchCards(themeName: String) -> [Card] {
        let request: NSFetchRequest<Card> = Card.fetchRequest()
        request.predicate = NSPredicate(format: "theme.name == %@", themeName)
        
        var fetchedCards: [Card] = []
        do {
            fetchedCards = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching cards \(error)")
        }
        return fetchedCards
    }
    
    // MARK: Deletion
    
    func deleteCollection(collectionName: String) {
        let request: NSFetchRequest<Collection> = Collection.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", collectionName)
        
        do {
            guard let collection = try persistentContainer.viewContext.fetch(request).first
            else { return }
            persistentContainer.viewContext.delete(collection)
        } catch let error {
            print("Error deleting collection \(error)")
        }
        
        save()
    }
    
    func deleteTheme(collectionName: String, themeName: String) {
        let collectionPredicate = NSPredicate(format: "collection.name == %@", collectionName)
        let namePredicate = NSPredicate(format: "name == %@", themeName)
        let multiplePredicate = NSCompoundPredicate(type: .and, subpredicates: [collectionPredicate, namePredicate])
        
        let request: NSFetchRequest<Theme> = Theme.fetchRequest()
        request.predicate = multiplePredicate
        
        do {
            guard let theme = try persistentContainer.viewContext.fetch(request).first
            else { return }
            persistentContainer.viewContext.delete(theme)
        } catch let error {
            print("Error deleting theme \(error)")
        }
        
        save()
    }
    
    func deleteCard(themeName: String, cardName: String) {
        let themePredicate = NSPredicate(format: "theme.name == %@", themeName)
        let namePredicate = NSPredicate(format: "cardDefinition == %@", cardName)
        let multiplePredicate = NSCompoundPredicate(type: .and, subpredicates: [themePredicate, namePredicate])
        
        let request: NSFetchRequest<Card> = Card.fetchRequest()
        request.predicate = multiplePredicate
        
        do {
            guard let card = try persistentContainer.viewContext.fetch(request).first
            else { return }
            persistentContainer.viewContext.delete(card)
        } catch let error {
            print("Error deleting card \(error)")
        }
        
        save()
    }
    
    // MARK: Update
    
    func updateCollection(withName: String, newName: String, icon: String) {
        let request: NSFetchRequest<Collection> = Collection.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", withName)
        
        do {
            guard let collection = try persistentContainer.viewContext.fetch(request).first
            else { return }
            collection.name = newName
            collection.icon = icon
        } catch let error {
            print("Error updating collection \(error)")
        }
        
        save()
    }
    
    func updateTheme(collectionName: String, themeName: String, newName: String) {
        let collectionPredicate = NSPredicate(format: "collection.name == %@", collectionName)
        let namePredicate = NSPredicate(format: "name == %@", themeName)
        let multiplePredicate = NSCompoundPredicate(type: .and, subpredicates: [collectionPredicate, namePredicate])
        
        let request: NSFetchRequest<Theme> = Theme.fetchRequest()
        request.predicate = multiplePredicate
        
        do {
            guard let theme = try persistentContainer.viewContext.fetch(request).first
            else { return }
            theme.name = newName
        } catch let error {
            print("Error updating theme \(error)")
        }
        
        save()
    }
    
    func updateCard(themeName: String, cardDefinition: String, newDefinition: String, newDescription: String) {
        let themePredicate = NSPredicate(format: "theme.name == %@", themeName)
        let namePredicate = NSPredicate(format: "cardDefinition == %@", cardDefinition)
        let multiplePredicate = NSCompoundPredicate(type: .and, subpredicates: [themePredicate, namePredicate])
        
        let request: NSFetchRequest<Card> = Card.fetchRequest()
        request.predicate = multiplePredicate
        
        do {
            guard let card = try persistentContainer.viewContext.fetch(request).first
            else { return }
            card.cardDefinition = newDefinition
            card.cardDescription = newDescription
        } catch let error {
            print("Error updating card \(error)")
        }
        
        save()
    }
    
    // MARK: Repetition
    
    func fetchAllThemesForRepetition() -> [Theme] {
        let request: NSFetchRequest<Theme> = Theme.fetchRequest()
        request.predicate = NSPredicate(format: "isRepeatComplete == %d", false)
        
        var fetchedThemes: [Theme] = []
        do {
            fetchedThemes = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching themes \(error)")
        }
        return fetchedThemes
    }
    
    
    func updateThemeDate(themeName: String, newDate: Date, newRepeats: Int, isRepeatCompleted: Bool) {
        let namePredicate = NSPredicate(format: "name == %@", themeName)
      //  let multiplePredicate = NSCompoundPredicate(type: .and, subpredicates: [collectionPredicate, namePredicate])
        
        let request: NSFetchRequest<Theme> = Theme.fetchRequest()
        request.predicate = namePredicate
        
        do {
            guard let theme = try persistentContainer.viewContext.fetch(request).first
            else { return }
            theme.repeatDate = newDate
            theme.repeats = Int64(newRepeats)
            theme.isRepeatComplete = isRepeatCompleted
        } catch let error {
            print("Error updating theme \(error)")
        }
        
        save()
    }
    
    func updateThemeRepeating(collectionName: String, themeName: String) {
        let namePredicate = NSPredicate(format: "name == %@", themeName)
        //  let multiplePredicate = NSCompoundPredicate(type: .and, subpredicates: [collectionPredicate, namePredicate])
        
        let request: NSFetchRequest<Theme> = Theme.fetchRequest()
        request.predicate = namePredicate
        
        do {
            guard let theme = try persistentContainer.viewContext.fetch(request).first
            else { return }
            theme.isBeingRepeated = true
            theme.repeatDate = Date()
        } catch let error {
            print("Error updating theme \(error)")
        }
        
        save()
    }
}

//
//  StorageService.swift
//  Cofio
//
//  Created by Владислав Сизонов on 02.01.2023.
//

import Foundation

protocol StorageServiceProtocol {
    
    func fetchCollections() -> [Collection]
    func deleteCollection(collectionName: String)
    func getThemesCountForCollection(collectionName: String) -> Int
    func fetchCollection(collectionName: String) -> Collection
    func createCollection(name: String, icon: String)
    func updateCollection(name: String, newName: String, icon: String)
    func startLearningCollection(collectionName: String)
    
    func fetchThemes(collectionName: String) -> [Theme]
    func fetchTheme(themeName: String) -> Theme
    func deleteTheme(collectionName: String, themeName: String)
    func getCardsCount(collectionName: String, themeName: String) -> Int
    func createTheme(collectionName: String, themeName: String, repetitionType: String)
    func updateTheme(collectionName: String, themeName: String, newName: String)
    func updateThemeDate(themeName: String, newDate: Date, newRepeats: Int, isRepeatCompleted: Bool)
    func fetchAllThemesForRepetition() -> [Theme]
    func startLearningTheme(collectionName: String, themeName: String)
    
    func fetchCards(themeName: String) -> [Card]
    func deleteCard(themeName: String, cardName: String)
    func fetchCard(themeName: String, cardName: String?) -> Card
    func createCard(themeName: String, definition: String, description: String)
    func updateCard(themeName: String, cardDefinition: String, newDefinition: String, newDescription: String)
    
    func deleteAllData()
}

final class StorageService: StorageServiceProtocol {
    
    // MARK: Private properties
    
    private let coreDataManager: CoreDataManagerProtocol
    
    // MARK: Lifecycle
    
    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
    
    // MARK: Collection methods
    
    func fetchCollections() -> [Collection] {
        coreDataManager.fetchCollections()
    }
    
    func deleteCollection(collectionName: String) {
        coreDataManager.deleteCollection(collectionName: collectionName)
    }
    
    func getThemesCountForCollection(collectionName: String) -> Int {
        coreDataManager.fetchThemes(collectionName: collectionName).count
    }
    
    func fetchCollection(collectionName: String) -> Collection {
        coreDataManager.fetchCollections().first(where: { $0.name == collectionName })!
    }
    
    func createCollection(name: String, icon: String) {
        coreDataManager.createCollection(name: name, icon: icon)
    }
    
    func updateCollection(name: String, newName: String, icon: String) {
        coreDataManager.updateCollection(withName: name, newName: newName, icon: icon)
    }
    
    func startLearningCollection(collectionName: String) {
        let themes = coreDataManager.fetchThemes(collectionName: collectionName)
        for theme in themes {
            coreDataManager.updateThemeRepeating(collectionName: collectionName, themeName: theme.name ?? "")
        }
    }
    
    // MARK: Theme methods
    
    func fetchThemes(collectionName: String) -> [Theme] {
        coreDataManager.fetchThemes(collectionName: collectionName)
    }
    
    func fetchTheme(themeName: String) -> Theme {
        coreDataManager.fetchTheme(themeName: themeName)
    }
    
    func deleteTheme(collectionName: String, themeName: String) {
        coreDataManager.deleteTheme(collectionName: collectionName, themeName: themeName)
    }
    
    func getCardsCount(collectionName: String, themeName: String) -> Int {
        coreDataManager.fetchCards(themeName: themeName).count
    }
    
    func createTheme(collectionName: String, themeName: String, repetitionType: String) {
        coreDataManager.createTheme(name: themeName, repeats: 0, repeatDate: Date(), isRepeatComplete: false, repetitionType: repetitionType, collectionName: collectionName, isBeingRepeated: false)
    }
    
    func updateTheme(collectionName: String, themeName: String, newName: String) {
        coreDataManager.updateTheme(collectionName: collectionName, themeName: themeName, newName: newName)
    }
    
    func updateThemeDate(themeName: String, newDate: Date, newRepeats: Int, isRepeatCompleted: Bool) {
        coreDataManager.updateThemeDate(themeName: themeName, newDate: newDate, newRepeats: newRepeats, isRepeatCompleted: isRepeatCompleted)
    }
    
    func fetchAllThemesForRepetition() -> [Theme] {
        var returnedThemes: [Theme] = []
        let themes = coreDataManager.fetchAllThemesForRepetition()
        
        // TODO: Подумать над предикатом на это
        for theme in themes {
            if theme.cards?.count ?? 0 > 0 && theme.isBeingRepeated == true {
                returnedThemes.append(theme)
            }
        }
        
        return returnedThemes
    }
    
    func startLearningTheme(collectionName: String, themeName: String) {
        coreDataManager.updateThemeRepeating(collectionName: collectionName, themeName: themeName)
    }
    
    // MARK: Card methods
    
    func fetchCards(themeName: String) -> [Card] {
        coreDataManager.fetchCards(themeName: themeName)
    }
    
    func deleteCard(themeName: String, cardName: String) {
        coreDataManager.deleteCard(themeName: themeName, cardName: cardName)
    }
    
    func fetchCard(themeName: String, cardName: String?) -> Card {
        // TODO: решить что-то с форс анврапом
        coreDataManager.fetchCards(themeName: themeName).first(where: { $0.cardDefinition == cardName })!
    }
    
    func createCard(themeName: String, definition: String, description: String) {
        coreDataManager.createCard(cardDefinition: definition, cardDescription: description, themeName: themeName)
    }
    
    func updateCard(themeName: String, cardDefinition: String, newDefinition: String, newDescription: String) {
        coreDataManager.updateCard(themeName: themeName, cardDefinition: cardDefinition, newDefinition: newDefinition, newDescription: newDescription)
    }
    
    // MARK: Common
    
    func deleteAllData() {
        let collections = coreDataManager.fetchCollections()
        for collection in collections {
            coreDataManager.deleteCollection(collectionName: collection.name ?? "")
        }
    }
}

//
//  ThemesInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

import Foundation

final class ThemesInteractor {
    
    private let coreDataManager: CoreDataManagerProtocol
    private let collectionName: String
    
    // MARK: Properties
    
    weak var output: ThemesInteractorOutput?
    
    init(coreDataManager: CoreDataManagerProtocol,
         collectionName: String) {
        self.coreDataManager = coreDataManager
        self.collectionName = collectionName
    }
}


// MARK: - CollectionsInteractorInput

extension ThemesInteractor: ThemesInteractorInput {
    
    func getCollectionName() -> String {
        collectionName
    }
    
    func createTheme(themeName: String) {
        coreDataManager.createTheme(name: themeName, repeats: 0, repeatDate: Date(), isRepeatComplete: false, collectionName: collectionName)
        coreDataManager.save()
    }
    
    func getThemes() -> [Theme] {
        coreDataManager.fetchThemes(collectionName: collectionName)
    }
    
    func getCardsCount(themeName: String) -> Int {
        coreDataManager.fetchCards(themeName: themeName).count
    }
    
    func deleteTheme(themeName: String) {
        coreDataManager.deleteTheme(collectionName: collectionName, themeName: themeName)
    }
    
    func editTheme(themeName: String, newName: String) {
        coreDataManager.updateTheme(collectionName: collectionName, themeName: themeName, newName: newName)
    }
}

//
//  ThemesInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

import Foundation

final class ThemesInteractor {
    
    private let storageService: StorageServiceProtocol
    private let collectionName: String
    
    // MARK: Properties
    
    weak var output: ThemesInteractorOutput?
    
    init(storageService: StorageServiceProtocol,
         collectionName: String) {
        self.storageService = storageService
        self.collectionName = collectionName
    }
}


// MARK: - CollectionsInteractorInput

extension ThemesInteractor: ThemesInteractorInput {
    
    func getCollectionName() -> String {
        collectionName
    }
    
    func createTheme(themeName: String) {
        storageService.createTheme(collectionName: collectionName, themeName: themeName)
    }
    
    func getThemes() -> [Theme] {
        storageService.fetchThemes(collectionName: collectionName)
    }
    
    func getCardsCount(themeName: String) -> Int {
        storageService.getCardsCount(collectionName: collectionName, themeName: themeName)
    }
    
    func deleteTheme(themeName: String) {
        storageService.deleteTheme(collectionName: collectionName, themeName: themeName)
    }
    
    func editTheme(themeName: String, newName: String) {
        storageService.updateTheme(collectionName: collectionName, themeName: themeName, newName: newName)
    }
}

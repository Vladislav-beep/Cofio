//
//  ThemesInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

import Foundation

final class ThemesInteractor {
    
    // MARK: Private properties
    
    private let storageService: StorageServiceProtocol
    private let collectionName: String
    
    // MARK: Public properties
    
    weak var output: ThemesInteractorOutput?
    
    init(
        storageService: StorageServiceProtocol,
        collectionName: String
    ) {
        self.storageService = storageService
        self.collectionName = collectionName
    }
}

// MARK: - ThemesInteractorInput

extension ThemesInteractor: ThemesInteractorInput {
    
    func getCollectionName() -> String {
        collectionName
    }
    
    func createTheme(themeName: String, repetitionType: String) {
        storageService.createTheme(collectionName: collectionName, themeName: themeName, repetitionType: repetitionType)
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
    
    func startLearningTheme(themeName: String) {
        storageService.startLearningTheme(collectionName: collectionName, themeName: themeName)
    }
}

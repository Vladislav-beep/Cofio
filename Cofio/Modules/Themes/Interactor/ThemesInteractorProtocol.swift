//
//  ThemesInteractorProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

protocol ThemesInteractorInput: AnyObject {
    
    func getThemes() -> [Theme]
    func createTheme(themeName: String, repetitionType: String)
    func getCollectionName() -> String
    func getCardsCount(themeName: String) -> Int
    func deleteTheme(themeName: String)
    func editTheme(themeName: String, newName: String)
    func startLearningTheme(themeName: String)
}

protocol ThemesInteractorOutput: AnyObject {}

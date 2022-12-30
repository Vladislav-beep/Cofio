//
//  ThemesInteractorProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

protocol ThemesInteractorInput: AnyObject {
    
    func getThemes() -> [Theme]
    func createTheme(themeName: String)
    func getCollectionName() -> String
}

protocol ThemesInteractorOutput: AnyObject {}

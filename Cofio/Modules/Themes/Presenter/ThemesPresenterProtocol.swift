//
//  ThemesPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

protocol ThemesPresenterInput: AnyObject {}

protocol ThemesPresenterOutput: AnyObject {
    
    func moduleWantsToOpenCards(_ module: ThemesPresenterInput, themeName: String)
    func moduleWantsToClose(_ module: ThemesPresenterInput)
}

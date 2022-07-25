//
//  LanguagesPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol LanguagesPresenterInput: AnyObject {}

protocol LanguagesPresenterOutput: AnyObject {
    
    func moduleWantsToAddNewLanguage(_ module: LanguagesPresenterInput)
}

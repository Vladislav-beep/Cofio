//
//  LanguagesPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol StartAppPresenterInput: AnyObject {}

protocol StartAppPresenterOutput: AnyObject {
    
    func moduleWantsToAddNewLanguage(_ module: StartAppPresenterInput)
}

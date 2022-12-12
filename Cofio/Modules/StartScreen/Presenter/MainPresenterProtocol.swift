//
//  MainPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol MainPresenterInput: AnyObject {}

protocol MainPresenterOutput: AnyObject {
    
    func moduleWantsToAddNewLanguage(_ module: MainPresenterInput)
    func moduleWantsToOpenTabbar(_ module: MainPresenterInput)
}

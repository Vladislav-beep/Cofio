//
//  MainPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol MainPresenterInput: AnyObject {
    
    func refreshCollections()
}

protocol MainPresenterOutput: AnyObject {
    
    func moduleDidLoad(_ module: MainPresenterInput)
    func moduleWantsToAddNewCollection(_ module: MainPresenterInput)
    func moduleWantsToOpenThemes(_ module: MainPresenterInput, title: String)
}

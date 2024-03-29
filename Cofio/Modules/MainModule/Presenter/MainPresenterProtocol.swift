//
//  MainPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import Foundation

protocol MainPresenterInput: AnyObject {
    
    func refreshCollections()
}

protocol MainPresenterOutput: AnyObject {
    
    func moduleDidLoad(_ module: MainPresenterInput)
    func moduleWantsToAddNewCollection(_ module: MainPresenterInput)
    func moduleWantsToEditCollection(_ module: MainPresenterInput, collectionName: String)
    func moduleWantsToOpenThemes(_ module: MainPresenterInput, collectionName: String, creationDate: Date)
    func moduleWantsToOpenSettingsTab()
}

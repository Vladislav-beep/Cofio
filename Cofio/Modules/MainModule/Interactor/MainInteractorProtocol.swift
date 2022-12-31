//
//  MainInteractorProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol MainInteractorInput: AnyObject {
    
    func getCollectionsFromStorage() -> [Collection]
    func getThemesCountForCollection(collectionName: String) -> Int
    func deleteCollection(collectionName: String)
}

protocol MainInteractorOutput: AnyObject {}

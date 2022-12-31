//
//  NewCollectionInteractorProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol NewCollectionInteractorInput: AnyObject {
    
    func createCollection(name: String, icon: String)
    func getCollection() -> Collection
    func updateCollection(name: String, newName: String, icon: String)
}

protocol NewCollectionInteractorOutput: AnyObject {}

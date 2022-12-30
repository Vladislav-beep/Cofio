//
//  NewCollectionInteractorProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol NewCollectionInteractorInput: AnyObject {
    
    func createCollection(name: String, icon: String)
}

protocol NewCollectionInteractorOutput: AnyObject {}

//
//  MainInteractorProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import Foundation

protocol MainInteractorInput: AnyObject {
    
    func fetchCollections() -> [Collection]
    func getThemesCountForCollection(collectionName: String, creationDate: Date) -> Int
    func allThemesHaveCards(collectionName: String, creationDate: Date) -> Bool
    func deleteCollection(collectionName: String)
    func startLearnCollection(collectionName: String, creationDate: Date)
    func getRepetitionType() -> RepetitionType?
}

protocol MainInteractorOutput: AnyObject {}

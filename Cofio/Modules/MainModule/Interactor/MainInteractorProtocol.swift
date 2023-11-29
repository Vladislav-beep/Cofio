//
//  MainInteractorProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol MainInteractorInput: AnyObject {
    
    func fetchCollections() -> [Collection]
    func getThemesCountForCollection(collectionName: String) -> Int
    func allThemesHaveCards(collectionName: String) -> Bool
    func deleteCollection(collectionName: String)
    func startLearnCollection(collectionName: String)
    func getRepetitionType() -> RepetitionType?
}

protocol MainInteractorOutput: AnyObject {}

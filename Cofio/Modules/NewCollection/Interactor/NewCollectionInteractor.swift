//
//  NewCollectionInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class NewCollectionInteractor {
    
    // MARK: Private properties
    
    private let storageService: StorageServiceProtocol
    private let collectionName: String?
    
    // MARK: Properties
    
    weak var output: NewCollectionInteractorOutput?
    
    // MARK: Lifecycle
    
    init(
        storageService: StorageServiceProtocol,
        collectionName: String?
    ) {
        self.storageService = storageService
        self.collectionName = collectionName
    }
}

// MARK: - NewCollectionInteractorInput

extension NewCollectionInteractor: NewCollectionInteractorInput {
    
    func getCollection() -> Collection {
        storageService.fetchCollection(collectionName: collectionName ?? "")
    }
    
    func createCollection(name: String, icon: String) {
        storageService.createCollection(name: name, icon: icon)
    }
    
    func updateCollection(name: String, newName: String, icon: String) {
        storageService.updateCollection(name: name, newName: newName, icon: icon)
    }
}

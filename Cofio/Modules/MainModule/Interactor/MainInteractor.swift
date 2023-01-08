//
//  MainInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class MainInteractor {
    
    // MARK: Private properties
    
    private let storageService: StorageServiceProtocol
    
    // MARK: Properties
    
    weak var output: MainInteractorOutput?
    
    // MARK: Lifecycle
    
    init(storageService: StorageServiceProtocol) {
        self.storageService = storageService
    }
}

// MARK: - StartAppInteractorInput

extension MainInteractor: MainInteractorInput {
    
    func deleteCollection(collectionName: String) {
        storageService.deleteCollection(collectionName: collectionName)
    }
    
    func fetchCollections() -> [Collection] {
        storageService.fetchCollections()
    }
    
    func getThemesCountForCollection(collectionName: String) -> Int {
        storageService.getThemesCountForCollection(collectionName: collectionName)
    }
}

//
//  NewCollectionInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class NewCollectionInteractor {
    
    // MARK: Private properties
    
    private let coreDataManager: CoreDataManagerProtocol
    private let collectionName: String?
    
    // MARK: Properties
    
    weak var output: NewCollectionInteractorOutput?
    
    // MARK: Lifecycle
    
    init(coreDataManager: CoreDataManagerProtocol,
         collectionName: String?) {
        self.coreDataManager = coreDataManager
        self.collectionName = collectionName
    }
}


// MARK: - NewLanguageInteractorInput

extension NewCollectionInteractor: NewCollectionInteractorInput {
    
    func getCollection() -> Collection {
        coreDataManager.fetchCollections().first(where: { $0.name == collectionName })!
    }
    
    func createCollection(name: String, icon: String) {
        coreDataManager.createCollection(name: name, icon: icon)
        coreDataManager.save()
    }
    
    func updateCollection(name: String, newName: String, icon: String) {
        coreDataManager.updateCollection(withName: name, newName: newName, icon: icon)
        coreDataManager.save()
    }
}

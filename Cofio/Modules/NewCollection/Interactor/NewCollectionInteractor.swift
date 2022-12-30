//
//  NewCollectionInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class NewCollectionInteractor {
    
    // MARK: Private properties
    
    private let coreDataManager: CoreDataManagerProtocol
    
    // MARK: Properties
    
    weak var output: NewCollectionInteractorOutput?
    
    // MARK: Lifecycle
    
    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
}


// MARK: - NewLanguageInteractorInput

extension NewCollectionInteractor: NewCollectionInteractorInput {
    
    func createCollection(name: String, icon: String) {
        coreDataManager.createCollection(name: name, icon: icon)
        coreDataManager.save()
    }
}

//
//  MainInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class MainInteractor {
    
    // MARK: Private properties
    
    private let coreDataManager: CoreDataManagerProtocol
    
    // MARK: Properties
    
    weak var output: MainInteractorOutput?
    
    // MARK: Lifecycle
    
    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
}


// MARK: - StartAppInteractorInput

extension MainInteractor: MainInteractorInput {
    
    func getCollectionsFromStorage() -> [Collection] {
        coreDataManager.collections()
    }
}

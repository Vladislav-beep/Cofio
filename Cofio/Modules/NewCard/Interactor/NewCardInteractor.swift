//
//  NewCardInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

final class NewCardInteractor {
    
    private let coreDataManager: CoreDataManagerProtocol
    private let themeName: String
    
    // MARK: Properties
    
    weak var output: NewCardInteractorOutput?
    
    init(coreDataManager: CoreDataManagerProtocol,
         themeName: String) {
        self.coreDataManager = coreDataManager
        self.themeName = themeName
    }
}


// MARK: - WordInteractorInput

extension NewCardInteractor: NewCardInteractorInput {
    
    func createCard(definition: String, description: String) {
        coreDataManager.createCard(cardDefinition: definition, cardDescription: description, themeName: themeName)
        coreDataManager.save()
    }
}

//
//  NewCardInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

final class NewCardInteractor {
    
    private let coreDataManager: CoreDataManagerProtocol
    private let themeName: String
    private let cardName: String?
    
    // MARK: Properties
    
    weak var output: NewCardInteractorOutput?
    
    init(coreDataManager: CoreDataManagerProtocol,
         themeName: String,
         cardName: String?) {
        self.coreDataManager = coreDataManager
        self.themeName = themeName
        self.cardName = cardName
    }
}


// MARK: - WordInteractorInput

extension NewCardInteractor: NewCardInteractorInput {
    
    func createCard(definition: String, description: String) {
        coreDataManager.createCard(cardDefinition: definition, cardDescription: description, themeName: themeName)
        coreDataManager.save()
    }
    
    func getCard() -> Card {
        coreDataManager.fetchCards(themeName: themeName).first(where: { $0.cardDefinition == cardName })!
    }
    
    func updateCard(cardDefinition: String, newDefinition: String, newDescription: String) {
        coreDataManager.updateCard(themeName: themeName, cardDefinition: cardDefinition, newDefinition: newDefinition, newDescription: newDescription)
    }
}

//
//  NewCardInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

final class NewCardInteractor {
    
    // MARK: Private properties
    
    private let storageService: StorageServiceProtocol
    private let themeName: String
    private let cardName: String?
    
    // MARK: Properties
    
    weak var output: NewCardInteractorOutput?
    
    // MARK: Lifecycle
    
    init(
        storageService: StorageServiceProtocol,
        themeName: String,
        cardName: String?
    ) {
        self.storageService = storageService
        self.themeName = themeName
        self.cardName = cardName
    }
}

// MARK: - NewCardInteractorInput

extension NewCardInteractor: NewCardInteractorInput {
    
    func createCard(definition: String, description: String) {
        storageService.createCard(themeName: themeName, definition: definition, description: description)
    }
    
    func getCard() -> Card {
        storageService.fetchCard(themeName: themeName, cardName: cardName)
    }
    
    func updateCard(cardDefinition: String, newDefinition: String, newDescription: String) {
        storageService.updateCard(themeName: themeName, cardDefinition: cardDefinition, newDefinition: newDefinition, newDescription: newDescription)
    }
}

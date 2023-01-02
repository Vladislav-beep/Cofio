//
//  CardsInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

final class CardsInteractor {
    
    private let storageService: StorageServiceProtocol
    private let themeName: String
    
    // MARK: Properties
    
    weak var output: CardsInteractorOutput?
    
    init(storageService: StorageServiceProtocol,
         themeName: String) {
        self.storageService = storageService
        self.themeName = themeName
    }
}


// MARK: - CardsInteractorInput

extension CardsInteractor: CardsInteractorInput {
    
    func getThemeName() -> String {
        themeName
    }
    
    func getCardsFromStorage() -> [Card] {
        storageService.fetchCards(themeName: themeName)
    }
    
    func deleteCard(cardName: String) {
        storageService.deleteCard(themeName: themeName, cardName: cardName)
    }
}

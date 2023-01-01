//
//  CardsInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

final class CardsInteractor {
    
    private let coreDataManager: CoreDataManagerProtocol
    private let themeName: String
    
    // MARK: Properties
    
    weak var output: CardsInteractorOutput?
    
    init(coreDataManager: CoreDataManagerProtocol,
         themeName: String) {
        self.coreDataManager = coreDataManager
        self.themeName = themeName
    }
}


// MARK: - CardsInteractorInput

extension CardsInteractor: CardsInteractorInput {
    
    func getThemeName() -> String {
        themeName
    }
    
    func getCardsFromStorage() -> [Card] {
        coreDataManager.fetchCards(themeName: themeName)
    }
    
    func deleteCard(cardName: String) {
        coreDataManager.deleteCard(themeName: themeName, cardName: cardName)
    }
}

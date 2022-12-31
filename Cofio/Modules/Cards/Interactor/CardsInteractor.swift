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
    
    func getCardsFromStorage() -> [Card] {
        coreDataManager.fetchCards(themeName: themeName)
    }
}

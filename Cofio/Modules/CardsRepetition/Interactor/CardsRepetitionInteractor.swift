//
//  CardsRepetitionInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

final class CardsRepetitonInteractor {
    
    private let storageService: StorageServiceProtocol
    private let themeName: String
    
    // MARK: Properties
    
    weak var output: CardsRepetitionInteractorOutput?
    
    init(storageService: StorageServiceProtocol,
         themeName: String) {
        self.storageService = storageService
        self.themeName = themeName
    }
}


// MARK: - CardsRepetitionInteractorInput

extension CardsRepetitonInteractor: CardsRepetitionInteractorInput {
    
    func getThemeName() -> String {
        themeName
    }
    
    func fetchCards() -> [Card] {
        storageService.fetchCards(themeName: themeName)
    }
}

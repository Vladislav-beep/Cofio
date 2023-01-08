//
//  CardsRepetitionInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

import Foundation

final class CardsRepetitonInteractor {
    
    // MARK: Private properties
    
    private let storageService: StorageServiceProtocol
    private let repetitionService: RepetitionServiceProtocol
    private let userDefaultsService: UserDefaultsServiceProtocol
    private let themeName: String
    
    // MARK: Public properties
    
    weak var output: CardsRepetitionInteractorOutput?
    
    // MARK: Lifecycle
    
    init(
        storageService: StorageServiceProtocol,
        repetitionService: RepetitionServiceProtocol,
        userDefaultsService: UserDefaultsServiceProtocol,
        themeName: String
    ) {
        self.storageService = storageService
        self.repetitionService = repetitionService
        self.userDefaultsService = userDefaultsService
        self.themeName = themeName
    }
}

// MARK: - CardsRepetitionInteractorInput

extension CardsRepetitonInteractor: CardsRepetitionInteractorInput {
    
    func fetchTheme() -> Theme {
        storageService.fetchTheme(themeName: themeName)
    }
    
    func getThemeName() -> String {
        themeName
    }
    
    func fetchCards() -> [Card] {
        storageService.fetchCards(themeName: themeName)
    }
    
    func updateTheme() {
        let theme = storageService.fetchTheme(themeName: themeName)
        let repeats = theme.repeats
        let newRepeats = repeats + 1
        
        if newRepeats == 7 {
            storageService.updateThemeDate(themeName: themeName, newDate: Date(), newRepeats: 7, isRepeatCompleted: true)
            return
        }
        let repetitionType = userDefaultsService.getRepetitionType()
        let date = repetitionService.getNextRepetDate(repetitionType: repetitionType, repeatsCount: Int(newRepeats))
        storageService.updateThemeDate(
            themeName: themeName,
            newDate: date,
            newRepeats: Int(newRepeats),
            isRepeatCompleted: false
        )
    }
}

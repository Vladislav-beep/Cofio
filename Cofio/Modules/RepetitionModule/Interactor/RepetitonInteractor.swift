//
//  RepetitonInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

final class RepetitonInteractor {
    
    // MARK: Private properties
    
    private let storageService: StorageServiceProtocol
    
    // MARK: Properties
    
    weak var output: RepetitionInteractorOutput?
    
    init(storageService: StorageServiceProtocol) {
        self.storageService = storageService
    }
}


// MARK: - RepetitionInteractorInput

extension RepetitonInteractor: RepetitionInteractorInput {
    
    func fetchAllThemesForRepetition() -> [Theme] {
        storageService.fetchAllThemesForRepetition()
    }
}

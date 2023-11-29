//
//  MainInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class MainInteractor {
    
    // MARK: Private properties
    
    private let storageService: StorageServiceProtocol
    private let userDefaultsService: UserDefaultsServiceProtocol
    
    // MARK: Properties
    
    weak var output: MainInteractorOutput?
    
    // MARK: Lifecycle
    
    init(
        storageService: StorageServiceProtocol,
        userDefaultsService: UserDefaultsServiceProtocol
    ) {
        self.storageService = storageService
        self.userDefaultsService = userDefaultsService
    }
}

// MARK: - StartAppInteractorInput

extension MainInteractor: MainInteractorInput {
    
    func deleteCollection(collectionName: String) {
        storageService.deleteCollection(collectionName: collectionName)
    }
    
    func fetchCollections() -> [Collection] {
        storageService.fetchCollections()
    }
    
    func getThemesCountForCollection(collectionName: String) -> Int {
        storageService.getThemesCountForCollection(collectionName: collectionName)
    }

    func allThemesHaveCards(collectionName: String) -> Bool {
        let themes = storageService.fetchThemes(collectionName: collectionName)
        guard themes.count != 0 else { return false }
        for theme in themes {
            if theme.cards?.count == 0 {
                return false
            }
        }
        return true
    }
    
    func startLearnCollection(collectionName: String) {
        storageService.startLearningCollection(collectionName: collectionName)
    }
    
    func getRepetitionType() -> RepetitionType? {
        userDefaultsService.getRepetitionType()
    }
}

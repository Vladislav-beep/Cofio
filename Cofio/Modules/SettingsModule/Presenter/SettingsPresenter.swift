//
//  SettingsPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 09.01.2023.
//

final class SettingsPresenter {
    
    // MARK: Private properties
    
    private let storageService: StorageServiceProtocol
    
    // MARK: Public properties
    
    weak var view: SettingsViewInput?
    var output: SettingsPresenterOutput?
    
    // MARK: Lifecycle
    
    init(storageService: StorageServiceProtocol) {
        self.storageService = storageService
    }
}

// MARK: - SettingsViewOutput

extension SettingsPresenter: SettingsViewOutput {
    
    func viewDidLoad() {
        let data: [SettingsCellsDataModel] = [
            .learning(.init(title: "settings_module_learning_cell_title"~, isImageShown: true)),
            .onboarding(.init(title: "settings_module_onboarding_cell_title"~, isImageShown: true)),
            .deleteAllData(.init(title: "Удалить все данные", isImageShown: false))
        ]
        
        view?.updateData(with: data)
    }
    
    func viewDidTapLearningCell() {
        output?.moduleWantsToOpenLearningMethod(self)
    }
    
    func viewDidTapOnboardingCell() {
        output?.moduleWantsToOpenOnboarding(self)
    }
    
    func deleteAllData() {
        storageService.deleteAllData()
    }
}

// MARK: - SettingsPresenterInput

extension SettingsPresenter: SettingsPresenterInput {

}

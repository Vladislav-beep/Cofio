//
//  SettingsPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 09.01.2023.
//

final class SettingsPresenter {
    
    // MARK: Public properties
    
    weak var view: SettingsViewInput?
    var output: SettingsPresenterOutput?
}

// MARK: - SettingsViewOutput

extension SettingsPresenter: SettingsViewOutput {
    
    func viewDidLoad() {
        let data: [SettingsCellsDataModel] = [
            .learning(.init(title: "settings_module_learning_cell_title"~)),
            .onboarding(.init(title: "settings_module_onboarding_cell_title"~))
        ]
        
        view?.updateData(with: data)
    }
    
    func viewDidTapLearningCell() {
        output?.moduleWantsToOpenLearningMethod(self)
    }
    
    func viewDidTapOnboardingCell() {
        output?.moduleWantsToOpenOnboarding(self)
    }
}

// MARK: - SettingsPresenterInput

extension SettingsPresenter: SettingsPresenterInput {

}

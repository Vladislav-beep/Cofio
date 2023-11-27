//
//  SettingsPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 09.01.2023.
//

final class SettingsPresenter {
    
    // MARK: Private properties
    
    private let storageService: StorageServiceProtocol
    private let notificationService: NotificationServiceProtocol
    
    // MARK: Public properties
    
    weak var view: SettingsViewInput?
    var output: SettingsPresenterOutput?
    
    // MARK: Lifecycle
    
    init(
        storageService: StorageServiceProtocol,
        notificationService: NotificationServiceProtocol
    ) {
        self.storageService = storageService
        self.notificationService = notificationService
    }
}

// MARK: - SettingsViewOutput

extension SettingsPresenter: SettingsViewOutput {
    
    func viewDidLoad() {
        let data: [SettingsCellsDataModel] = [
            .learning(.init(title: Strings.SettingsModule.LearningCell.title, isImageShown: true)),
            .onboarding(.init(title: Strings.SettingsModule.OnboardingCell.title, isImageShown: true)),
            .deleteAllData(.init(title: Strings.SettingsModule.DeleteCell.title, isImageShown: false))
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
        let handler: () -> Void = { [weak self] in
            self?.storageService.deleteAllData()
        }
        notificationService.showTwoButtonAlert(
            title: Strings.SettingsModule.DeleteAlert.title,
            message: Strings.SettingsModule.DeleteAlert.message,
            actionTitle: Strings.Common.DeleteButton.title,
            completion: handler)
    }
}

// MARK: - SettingsPresenterInput

extension SettingsPresenter: SettingsPresenterInput {

}

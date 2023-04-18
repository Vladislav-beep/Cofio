//
//  SettingsFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 09.01.2023.
//

import UIKit

final class SettingsFlowCoordinator {
    
    // MARK: Private
    
    private let parentViewController: UINavigationController
    private let assembly: ApplicationAssembly
    
    // MARK: Lifecycle
    
    init(
        parentViewController: UINavigationController,
        assembly: ApplicationAssembly
    ) {
        self.parentViewController = parentViewController
        self.assembly = assembly
    }
    
    // MARK: Private

    private func showSettingsModule() {
        let builder = SettingsModuleBuilder(
            output: self,
            storageService: assembly.servicesAssembly.storageService,
            notificationService: assembly.uiAssembly.notificationService
        )
        
        let settingsViewController = builder.build()
        parentViewController.pushViewController(settingsViewController, animated: true)
    }
    
    private func showLearningMethod() {
        let builder = LearningMethodModuleBuilder(userDefaultsService: assembly.servicesAssembly.userDefaultsService)
        let vc = builder.build()
        
        parentViewController.pushViewController(vc, animated: true)
    }
    
    private func showOnboarding() {
        let builder = OnboardingModuleBuilder(
            output: self,
            onboardingService: assembly.uiAssembly.onboardingService
        )
        let vc = builder.build()
        
        parentViewController.present(vc, animated: true)
    }
}

// MARK: - FlowCoordinatorProtocol

extension SettingsFlowCoordinator: FlowCoordinatorProtocol {
    
    func start() {
        showSettingsModule()
    }
    
    func finish(completion: (() -> Void)?) {
        // TODO: финишировать координатор при добавлении контроллера логина
    }
}

// MARK: - SettingsPresenterOutput

extension SettingsFlowCoordinator: SettingsPresenterOutput {
    
    func moduleWantsToOpenLearningMethod(_ module: SettingsPresenterInput) {
        showLearningMethod()
    }
    
    func moduleWantsToOpenOnboarding(_ module: SettingsPresenterInput) {
        showOnboarding()
    }
}

// MARK: - OnboardingPresenterOutput

extension SettingsFlowCoordinator: OnboardingPresenterOutput {
    
    func moduleWantsToClose(_ module: OnboardingPresenterInput) {
        parentViewController.dismiss(animated: true)
    }
}

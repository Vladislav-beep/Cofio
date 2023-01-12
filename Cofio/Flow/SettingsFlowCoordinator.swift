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
    
    // MARK: Lifecycle
    
    init(parentViewController: UINavigationController) {
        self.parentViewController = parentViewController
    }
    
    // MARK: Private

    private func showSettingsModule() {
        let builder = SettingsModuleBuilder(output: self)
        
        let settingsViewController = builder.build()
        parentViewController.pushViewController(settingsViewController, animated: true)
    }
    
    private func showLearningMethod() {
        let builder = LearningMethodModuleBuilder()
        let vc = builder.build()
        
        parentViewController.pushViewController(vc, animated: true)
    }
    
    private func showOnboarding() {
        
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

//
//  OnboardingModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 15.01.2023.
//

import UIKit

final class OnboardingModuleBuilder {
    
    // MARK: Private
    
    private weak var output: OnboardingPresenterOutput?
    
    // MARK: Lifecycle
    
    init(output: OnboardingPresenterOutput) {
        self.output = output
    }
    
    // MARK: Public
    
    func build() -> UIViewController {
        let onboardingService = OnboardingService()
        let dataSource = OnboardingViewDataSource()
        let presenter = OnboardingPresenter(onboardingService: onboardingService)
        let viewController = OnboardingViewController(
            output: presenter,
            dataSource: dataSource
        )
        
        presenter.view = viewController
        presenter.output = output
        
        return viewController
    }
}


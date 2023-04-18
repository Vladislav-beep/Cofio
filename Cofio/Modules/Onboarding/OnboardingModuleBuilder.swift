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
    private let onboardingService: OnboardingServiceProtocol
    
    // MARK: Lifecycle
    
    init(
        output: OnboardingPresenterOutput,
        onboardingService: OnboardingServiceProtocol
    ) {
        self.output = output
        self.onboardingService = onboardingService
    }
    
    // MARK: Public
    
    func build() -> UIViewController {
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


//
//  FinishRepetitionOfferModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 06.01.2023.
//

import UIKit

final class FinishRepetitionOfferModuleBuilder {
    
    // MARK: Private
    
    private weak var output: FinishRepetitionOfferPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(output: FinishRepetitionOfferPresenterOutput) {
        self.output = output
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let presenter = FinishRepetitionOfferPresenter()
        let viewController = FinishRepetitionOfferViewController(output: presenter)
        
        presenter.view = viewController
        presenter.output = output
        
        return viewController
    }
}

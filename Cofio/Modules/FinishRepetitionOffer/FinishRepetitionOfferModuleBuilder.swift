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
    private let themeName: String
    private let repeatDate: String
    
    
    // MARK: Lifecycle
    
    init(output: FinishRepetitionOfferPresenterOutput,
         themeName: String,
         repeatDate: String) {
        self.output = output
        self.themeName = themeName
        self.repeatDate = repeatDate
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let presenter = FinishRepetitionOfferPresenter(themeName: themeName, repeatDate: repeatDate)
        let viewController = FinishRepetitionOfferViewController(output: presenter)
        
        presenter.view = viewController
        presenter.output = output
        
        return viewController
    }
}

//
//  CardDetailsModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 17.12.2022.
//

import UIKit

final class CardDetailsModuleBuilder {
    
    // MARK: Private
    
    private weak var output: CardDetailsPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(output: CardDetailsPresenterOutput) {
        self.output = output
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let presenter = CardDetailsPresenter()
        let viewController = CardDetailsViewController(output: presenter)
        
        presenter.output = output
        
        return viewController
    }
}

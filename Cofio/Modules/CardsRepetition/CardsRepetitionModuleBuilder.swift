//
//  CardsRepetitionModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

import UIKit

final class CardsRepetitionModuleBuilder {
    
    // MARK: Private
    
    private weak var output: CardsRepetitionPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(output: CardsRepetitionPresenterOutput) {
        self.output = output
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let interactor = CardsRepetitonInteractor()
        let presenter = CardsRepetitionPresenter(interactor: interactor)
        let viewController = CardsRepetitionViewController(output: presenter)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

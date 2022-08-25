//
//  CardsRepetitionModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

import UIKit

final class CardsRepetitionModuleBuilder {
    
    private weak var output: CardsRepetitionPresenterOutput?
    
    init(output: CardsRepetitionPresenterOutput) {
        self.output = output
    }
    
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

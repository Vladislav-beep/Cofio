//
//  CardsModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

import UIKit

final class CardsModuleBuilder {
    
    // MARK: Private
    
    private weak var output: CardsPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(output: CardsPresenterOutput) {
        self.output = output
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let dataSource = CardsTableViewDataSource()
        
        let interactor = CardsInteractor()
        let presenter = CardsPresenter(interactor: interactor)
        let viewController = CardsViewController(output: presenter,
                                                 dataSource: dataSource)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

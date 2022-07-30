//
//  CardsModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

import UIKit

final class CardsModuleBuilder {
    
    private weak var output: CardsPresenterOutput?
    
    init(output: CardsPresenterOutput) {
        self.output = output
    }
    
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

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
    private let themeName: String
    
    // MARK: Lifecycle
    
    init(output: CardsPresenterOutput,
         themeName: String) {
        self.output = output
        self.themeName = themeName
    }
    
    // MARK: Public
    
    func build() -> UIViewController {
        let coreDataManager = CoreDataManager()
        let dataSource = CardsTableViewDataSource()
        let cardsDataFactory = CardsDataFactory()
        
        let interactor = CardsInteractor(coreDataManager: coreDataManager,
                                         themeName: themeName)
        let presenter = CardsPresenter(interactor: interactor,
                                       cardsDataFactory: cardsDataFactory)
        let viewController = CardsViewController(output: presenter,
                                                 dataSource: dataSource)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

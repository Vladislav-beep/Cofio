//
//  RepetitionModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

import UIKit

final class RepetitionModuleBuilder {
    
    // MARK: Private
    
    private weak var output: RepetitionPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(output: RepetitionPresenterOutput) {
        self.output = output
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let dataSource = RepetitionTableViewDataSource()
        let interactor = RepetitonInteractor()
        let presenter = RepetitionPresenter(interactor: interactor)
        let viewController = RepetitionViewController(output: presenter,
                                                      dataSource: dataSource)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

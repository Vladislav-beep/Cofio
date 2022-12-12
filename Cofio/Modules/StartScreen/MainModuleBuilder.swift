//
//  MainModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class MainModuleBuilder {
    
    // MARK: Private
    
    private var output: FlowCoordinator1
    
    
    // MARK: Lifecycle
    
    init(output: FlowCoordinator1) {
        self.output = output
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let interactor = MainInteractor()
        let presenter = MainPresenter(interactor: interactor)
        
        let tableViewDataSource = MainTableViewDataSource()
        let viewController = MainViewController(output: presenter,
                                                    coordinater: output,
                                                    dataSource: tableViewDataSource)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

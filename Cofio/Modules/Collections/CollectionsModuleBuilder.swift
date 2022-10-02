//
//  CollectionsModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

import UIKit

final class CollectionsModuleBuilder {
    
    // MARK: Private
    
    private weak var output: CollectionsPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(output: CollectionsPresenterOutput) {
        self.output = output
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let dataSource = CollectionsTableViewDataSource()
        
        let interactor = CollectionsInteractor()
        let presenter = CollectionsPresenter(interactor: interactor)
        let viewController = CollectionsViewController(output: presenter,
                                                 dataSource: dataSource)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

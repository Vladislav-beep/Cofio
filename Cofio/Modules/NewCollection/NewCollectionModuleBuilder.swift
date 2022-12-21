//
//  NewCollectionModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class NewCollectionModuleBuilder {
    
    // MARK: Private
    
    private weak var output: NewCollectionPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(output: NewCollectionPresenterOutput) {
        self.output = output
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let interactor = NewCollectionInteractor()
        let presenter = NewCollectionPresenter(interactor: interactor)
        
        let viewController = NewCollectionViewController(output: presenter)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

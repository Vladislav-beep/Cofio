//
//  WordModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

import UIKit

final class WordModuleBuilder {
    
    // MARK: Private
    
    private weak var output: WordPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(output: WordPresenterOutput) {
        self.output = output
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let interactor = WordInteractor()
        let presenter = WordPresenter(interactor: interactor)
        let viewController = WordViewController(output: presenter)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

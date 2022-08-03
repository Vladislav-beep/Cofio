//
//  WordModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

import UIKit

final class WordModuleBuilder {
    
    private weak var output: WordPresenterOutput?
    
    init(output: WordPresenterOutput) {
        self.output = output
    }
    
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

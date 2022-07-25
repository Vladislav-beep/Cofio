//
//  LanguagesModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class LanguagesModuleBuilder {
    
    private weak var output: LanguagesPresenterOutput?
    
    init(output: LanguagesPresenterOutput) {
        self.output = output
    }
    
    func build() -> UIViewController {
        let interactor = LanguagesInteractor()
        let presenter = LanguagesPresenter(interactor: interactor)
        let viewController = LanguagesViewController(output: presenter)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

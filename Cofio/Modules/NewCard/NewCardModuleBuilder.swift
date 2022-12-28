//
//  NewCardModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

import UIKit

final class NewCardModuleBuilder {
    
    // MARK: Private
    
    private weak var output: NewCardPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(output: NewCardPresenterOutput) {
        self.output = output
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let interactor = NewCardInteractor()
        let presenter = NewCardPresenter(interactor: interactor)
        let viewController = NewCardViewController(output: presenter)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

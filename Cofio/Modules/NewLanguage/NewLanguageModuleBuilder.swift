//
//  NewLanguageModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class NewLanguageModuleBuilder {
    
    // MARK: Private
    
    private weak var output: NewLanguagePresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(output: NewLanguagePresenterOutput) {
        self.output = output
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        
        let imageProvider = ImageProvider()
        
        let interactor = NewLanguageInteractor()
        let presenter = NewLanguagePresenter(interactor: interactor)
        
        let viewController = NewLanguageViewController(output: presenter,
                                                       imageProvider: imageProvider)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

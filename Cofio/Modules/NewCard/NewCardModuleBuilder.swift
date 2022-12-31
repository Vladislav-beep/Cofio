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
    private let themeName: String
    
    
    // MARK: Lifecycle
    
    init(output: NewCardPresenterOutput,
         themeName: String) {
        self.output = output
        self.themeName = themeName
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let coreDataManager = CoreDataManager()
        
        let interactor = NewCardInteractor(coreDataManager: coreDataManager,
                                           themeName: themeName)
        let presenter = NewCardPresenter(interactor: interactor)
        let viewController = NewCardViewController(output: presenter)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

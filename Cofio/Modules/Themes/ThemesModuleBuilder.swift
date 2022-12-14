//
//  ThemesModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

import UIKit

final class ThemesModuleBuilder {
    
    // MARK: Private
    
    private weak var output: ThemesPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(output: ThemesPresenterOutput) {
        self.output = output
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let dataSource = ThemesTableViewDataSource()
        
        let interactor = ThemesInteractor()
        let presenter = ThemesPresenter(interactor: interactor)
        let viewController = ThemesViewController(output: presenter,
                                                 dataSource: dataSource)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

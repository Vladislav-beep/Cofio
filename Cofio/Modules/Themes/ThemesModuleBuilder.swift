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
    private let navigationBarTitle: String
    
    
    // MARK: Lifecycle
    
    init(output: ThemesPresenterOutput, navigationBarTitle: String) {
        self.output = output
        self.navigationBarTitle = navigationBarTitle
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let dataSource = ThemesTableViewDataSource()
        
        let interactor = ThemesInteractor()
        let presenter = ThemesPresenter(interactor: interactor, navigationBarTitle: navigationBarTitle)
        let viewController = ThemesViewController(output: presenter,
                                                 dataSource: dataSource)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

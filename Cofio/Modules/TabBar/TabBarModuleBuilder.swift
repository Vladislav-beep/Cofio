//
//  TabBarModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

import UIKit

final class TabBarModuleBuilder {
    
    // MARK: Private
    
    private weak var output: TabBarModuleOutput?
    
    
    // MARK: Lifecycle
    
    init(output: TabBarModuleOutput?) {
        self.output = output
    }
    
    
    // MARK: Public
    
    func build() -> UITabBarController {

        let presenter = TabBarPresenter()
        let viewController = TabBarViewController(output: presenter)
        
       // viewController.output = presenter
        
        presenter.view = viewController
        presenter.output = output
        
        return viewController
    }
}


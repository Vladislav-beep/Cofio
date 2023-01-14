//
//  LearningMethodModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 12.01.2023.
//

import UIKit

final class LearningMethodModuleBuilder {

    // MARK: Public
    
    func build() -> UIViewController {
        let userDefaultsService = UserDefaultsService()
        let dataSource = LearningTableViewDataSource()
        let presenter = LearningMethodPresenter(userDefaultsService: userDefaultsService)
        
        let viewController = LearningMethodViewController(
            output: presenter,
            dataSource: dataSource
        )
        
        presenter.view = viewController
        
        return viewController
    }
}
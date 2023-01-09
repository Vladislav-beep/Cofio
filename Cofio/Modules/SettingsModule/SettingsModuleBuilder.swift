//
//  SettingsModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 09.01.2023.
//

import UIKit

final class SettingsModuleBuilder {
    
    // MARK: Private
    
    private weak var output: SettingsPresenterOutput?
    
    // MARK: Lifecycle
    
    init(output: SettingsPresenterOutput) {
        self.output = output
    }
    
    // MARK: Public
    
    func build() -> UIViewController {
        let presenter = SettingsPresenter()
        
        let viewController = SettingsViewController(output: presenter)
        
        presenter.view = viewController
        
        presenter.output = output
        
        return viewController
    }
}

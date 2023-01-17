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
    private let storageService: StorageServiceProtocol
    
    // MARK: Lifecycle
    
    init(
        output: SettingsPresenterOutput,
        storageService: StorageServiceProtocol
    ) {
        self.output = output
        self.storageService = storageService
    }
    
    // MARK: Public
    
    func build() -> UIViewController {
        let dataSource = SettingsTableViewDataSource()
        let presenter = SettingsPresenter(storageService: storageService)
        
        let viewController = SettingsViewController(
            output: presenter,
            dataSource: dataSource
        )
        
        presenter.view = viewController
        
        presenter.output = output
        
        return viewController
    }
}

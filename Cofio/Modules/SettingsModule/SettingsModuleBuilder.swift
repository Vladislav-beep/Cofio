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
    private let notificationService: NotificationServiceProtocol
    
    // MARK: Lifecycle
    
    init(
        output: SettingsPresenterOutput,
        storageService: StorageServiceProtocol,
        notificationService: NotificationServiceProtocol
    ) {
        self.output = output
        self.storageService = storageService
        self.notificationService = notificationService
    }
    
    // MARK: Public
    
    func build() -> UIViewController {
        let dataSource = SettingsTableViewDataSource()
        let presenter = SettingsPresenter(
            storageService: storageService,
            notificationService: notificationService
        )
        
        let viewController = SettingsViewController(
            output: presenter,
            dataSource: dataSource
        )
        
        presenter.view = viewController
        
        presenter.output = output
        
        return viewController
    }
}

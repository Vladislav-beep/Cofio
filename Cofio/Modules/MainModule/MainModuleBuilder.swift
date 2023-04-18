//
//  MainModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class MainModuleBuilder {
    
    // MARK: Private
    
    private var output: MainPresenterOutput
    private let storageService: StorageServiceProtocol
    private let notificationService: NotificationServiceProtocol
    private let userDefaultsService: UserDefaultsServiceProtocol
    
    // MARK: Lifecycle
    
    init(
        output: MainPresenterOutput,
        storageService: StorageServiceProtocol,
        notificationService: NotificationServiceProtocol,
        userDefaultsService: UserDefaultsServiceProtocol
    ) {
        self.output = output
        self.storageService = storageService
        self.notificationService = notificationService
        self.userDefaultsService = userDefaultsService
    }
    
    // MARK: Public
    
    func build() -> UIViewController {
        let collectionsDataFactory = CollectionsDataFactory()
        let tableViewDataSource = MainTableViewDataSource()
        
        let interactor = MainInteractor(
            storageService: storageService,
            userDefaultsService: userDefaultsService
        )
        let presenter = MainPresenter(
            interactor: interactor,
            collectionsDataFactory: collectionsDataFactory,
            notificationService: notificationService
        )
        let viewController = MainViewController(
            output: presenter,
            dataSource: tableViewDataSource
        )
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

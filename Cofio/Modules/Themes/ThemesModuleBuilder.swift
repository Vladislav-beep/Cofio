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
    private let collectionName: String
    private let creationDate: Date
    private let storageService: StorageServiceProtocol
    private let userDefaultsService: UserDefaultsServiceProtocol
    private let notificationService: NotificationServiceProtocol
    
    // MARK: Lifecycle
    
    init(
        output: ThemesPresenterOutput,
        collectionName: String,
        creationDate: Date,
        storageService: StorageServiceProtocol,
        userDefaultsService: UserDefaultsServiceProtocol,
        notificationService: NotificationServiceProtocol
    ) {
        self.output = output
        self.collectionName = collectionName
        self.creationDate = creationDate
        self.storageService = storageService
        self.userDefaultsService = userDefaultsService
        self.notificationService = notificationService
    }
    
    // MARK: Public
    
    func build() -> UIViewController {
        let dataSource = ThemesTableViewDataSource()
        let themesDataFactory = ThemesDataFactory()
        
        let interactor = ThemesInteractor(
            storageService: storageService,
            collectionName: collectionName,
            creationDate: creationDate
        )
        let presenter = ThemesPresenter(
            interactor: interactor,
            themesDataFactory: themesDataFactory,
            userDefaultsService: userDefaultsService,
            notificationService: notificationService
        )
        let viewController = ThemesViewController(
            output: presenter,
            dataSource: dataSource
        )
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

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
    private let storageService: StorageServiceProtocol
    private let userDefaultsService: UserDefaultsServiceProtocol
    
    // MARK: Lifecycle
    
    init(
        output: ThemesPresenterOutput,
        collectionName: String,
        storageService: StorageServiceProtocol,
        userDefaultsService: UserDefaultsServiceProtocol
    ) {
        self.output = output
        self.collectionName = collectionName
        self.storageService = storageService
        self.userDefaultsService = userDefaultsService
    }
    
    // MARK: Public
    
    func build() -> UIViewController {
        let dataSource = ThemesTableViewDataSource()
        let themesDataFactory = ThemesDataFactory()
        
        let interactor = ThemesInteractor(
            storageService: storageService,
            collectionName: collectionName
        )
        let presenter = ThemesPresenter(
            interactor: interactor,
            themesDataFactory: themesDataFactory,
            userDefaultsService: userDefaultsService
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

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
    
    // MARK: Lifecycle
    
    init(
        output: ThemesPresenterOutput,
        collectionName: String,
        storageService: StorageServiceProtocol
    ) {
        self.output = output
        self.collectionName = collectionName
        self.storageService = storageService
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
            themesDataFactory: themesDataFactory
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

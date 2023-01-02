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
    
    
    // MARK: Lifecycle
    
    init(output: MainPresenterOutput,
         storageService: StorageServiceProtocol) {
        self.output = output
        self.storageService = storageService
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let collectionsDataFactory = CollectionsDataFactory()
        let interactor = MainInteractor(storageService: storageService)
        let presenter = MainPresenter(interactor: interactor,
                                      collectionsDataFactory: collectionsDataFactory)
        
        let tableViewDataSource = MainTableViewDataSource()
        let viewController = MainViewController(output: presenter,
                                                dataSource: tableViewDataSource)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

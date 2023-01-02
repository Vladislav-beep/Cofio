//
//  RepetitionModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

import UIKit

final class RepetitionModuleBuilder {
    
    // MARK: Private
    
    private weak var output: RepetitionPresenterOutput?
    private let storageService: StorageServiceProtocol
    
    
    // MARK: Lifecycle
    
    init(output: RepetitionPresenterOutput,
         storageService: StorageServiceProtocol) {
        self.output = output
        self.storageService = storageService
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let dataSource = RepetitionTableViewDataSource()
        let repetitionDataFactory = RepetitionDataFactory()
        
        let interactor = RepetitonInteractor(storageService: storageService)
        let presenter = RepetitionPresenter(interactor: interactor,
                                            repetitionDataFactory: repetitionDataFactory)
        let viewController = RepetitionViewController(output: presenter,
                                                      dataSource: dataSource)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

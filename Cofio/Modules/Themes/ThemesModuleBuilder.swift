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
    
    
    // MARK: Lifecycle
    
    init(output: ThemesPresenterOutput, collectionName: String) {
        self.output = output
        self.collectionName = collectionName
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let dataSource = ThemesTableViewDataSource()
        let coreDataManager = CoreDataManager()
        
        let interactor = ThemesInteractor(coreDataManager: coreDataManager, collectionName: collectionName)
        let presenter = ThemesPresenter(interactor: interactor)
        let viewController = ThemesViewController(output: presenter,
                                                 dataSource: dataSource)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

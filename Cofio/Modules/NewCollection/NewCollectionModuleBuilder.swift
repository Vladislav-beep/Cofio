//
//  NewCollectionModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class NewCollectionModuleBuilder {
    
    // MARK: Private
    
    private weak var output: NewCollectionPresenterOutput?
    private let isEditing: Bool
    private let collectionName: String?
    private let storageService: StorageServiceProtocol
    
    
    // MARK: Lifecycle
    
    init(output: NewCollectionPresenterOutput,
         isEditing: Bool,
         collectionName: String?,
         storageService: StorageServiceProtocol) {
        self.output = output
        self.isEditing = isEditing
        self.collectionName = collectionName
        self.storageService = storageService
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let interactor = NewCollectionInteractor(storageService: storageService,
                                                 collectionName: collectionName)
        let presenter = NewCollectionPresenter(interactor: interactor, isEditing: isEditing)
        
        let viewController = NewCollectionViewController(output: presenter)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

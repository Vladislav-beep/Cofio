//
//  NewCardModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

import UIKit

final class NewCardModuleBuilder {
    
    // MARK: Private
    
    private weak var output: NewCardPresenterOutput?
    private let themeName: String
    private let cardName: String?
    private let isEditing: Bool
    private let storageService: StorageServiceProtocol
    
    // MARK: Lifecycle
    
    init(
        output: NewCardPresenterOutput,
        themeName: String,
        cardName: String?,
        isEditing: Bool,
        storageService: StorageServiceProtocol
    ) {
        self.output = output
        self.themeName = themeName
        self.cardName = cardName
        self.isEditing = isEditing
        self.storageService = storageService
    }
    
    // MARK: Public
    
    func build() -> UIViewController {
        let interactor = NewCardInteractor(
            storageService: storageService,
            themeName: themeName,
            cardName: cardName)
        
        let presenter = NewCardPresenter(
            interactor: interactor,
            isEditing: isEditing
        )
        let viewController = NewCardViewController(output: presenter)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

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
    
    
    // MARK: Lifecycle
    
    init(output: NewCardPresenterOutput,
         themeName: String,
         cardName: String?,
         isEditing: Bool) {
        self.output = output
        self.themeName = themeName
        self.cardName = cardName
        self.isEditing = isEditing
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let coreDataManager = CoreDataManager()
        
        let interactor = NewCardInteractor(coreDataManager: coreDataManager,
                                           themeName: themeName,
                                           cardName: cardName)
        let presenter = NewCardPresenter(interactor: interactor, isEditing: isEditing)
        let viewController = NewCardViewController(output: presenter)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

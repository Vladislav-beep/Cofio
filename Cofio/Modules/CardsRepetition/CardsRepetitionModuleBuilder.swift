//
//  CardsRepetitionModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

import UIKit

final class CardsRepetitionModuleBuilder {
    
    // MARK: Private
    
    private weak var output: CardsRepetitionPresenterOutput?
    private let storageService: StorageServiceProtocol
    private let userDefaultsService: UserDefaultsServiceProtocol
    private let themeName: String
    
    // MARK: Lifecycle
    
    init(
        output: CardsRepetitionPresenterOutput,
        storageService: StorageServiceProtocol,
        userDefaultsService: UserDefaultsServiceProtocol,
        themeName: String
    ) {
        self.output = output
        self.storageService = storageService
        self.userDefaultsService = userDefaultsService
        self.themeName = themeName
    }
    
    // MARK: Public
    
    func build() -> UIViewController {
        let dataSource = CardsCollectionViewDataSource()
        let repetitionService = RepetitionService()
        let cardsRepetitionDataFactory = CardsRepetitionDataFactory()
        let dateFormatterService = DateFormatterService()
        
        let interactor = CardsRepetitonInteractor(
            storageService: storageService,
            repetitionService: repetitionService,
            userDefaultsService: userDefaultsService,
            themeName: themeName
        )
        let presenter = CardsRepetitionPresenter(
            interactor: interactor,
            cardsRepetitionDataFactory: cardsRepetitionDataFactory,
            dateFormatterService: dateFormatterService
        )
        let viewController = CardsRepetitionViewController(
            output: presenter,
            dataSource: dataSource
        )
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

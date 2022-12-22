//
//  MainFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class MainFlowCoordinator {
    
    // MARK: Private
    
    private let parentViewController: UINavigationController
    private var mainModuleViewController: UIViewController?
    private var newCollectionViewControllerr: UIViewController?
    private weak var mainModule: MainPresenterInput?
    
    
    // MARK: Lifecycle
    
    init(parentViewController: UINavigationController) {
        self.parentViewController = parentViewController
    }
    
    
    // MARK: Private
    
    private func showMainModule() {
        let builder = MainModuleBuilder(output: self)
        let mainViewController = builder.build()
        
        mainModuleViewController = mainViewController
        parentViewController.pushViewController(mainViewController, animated: true)
    }
    
    private func showNewCollectionModule() {
        let builder = NewCollectionModuleBuilder(output: self)
        let newCollectionViewController = builder.build()
        
        newCollectionViewControllerr = newCollectionViewController
        newCollectionViewController.modalPresentationStyle = .fullScreen
        mainModuleViewController?.present(newCollectionViewController, animated: true)
    }
    
    private func showChooseIconModule() {
        let builder = ChooseIconModuleBuilder(output: self)
        let chooseIconViewController = builder.build()
        
        newCollectionViewControllerr?.present(chooseIconViewController, animated: true)
    }
    
    private func showThemesModule(title: String) {
        let builder = ThemesModuleBuilder(output: self, navigationBarTitle: title)
        let themesViewController = builder.build()
        
        parentViewController.pushViewController(themesViewController, animated: true)
    }
    
    private func showCardsModule() {
        let builder = CardsModuleBuilder(output: self)
        let cardsViewController = builder.build()
        
        parentViewController.pushViewController(cardsViewController, animated: true)
    }
    
    private func showCardDetailsModule() {
        let builder = CardDetailsModuleBuilder(output: self)
        let cardDetailsViewController = builder.build()
        
        parentViewController.present(cardDetailsViewController, animated: true)
    }
    
    private func showNewCardModule() {
        let builder = NewCardModuleBuilder(output: self)
        let newCardViewController = builder.build()
        newCardViewController.modalPresentationStyle = .fullScreen
        parentViewController.present(newCardViewController, animated: true)
    }
}

// MARK: - FlowCoordinatorProtocol

extension MainFlowCoordinator: FlowCoordinatorProtocol {
    func start() {
        showMainModule()
    }
    
    func finish(completion: (() -> Void)?) {
        
    }
}


// MARK: - MainPresenterOutput

extension MainFlowCoordinator: MainPresenterOutput {

    func moduleDidLoad(_ module: MainPresenterInput) {
        mainModule = module
    }
    
    func moduleWantsToAddNewCollection(_ module: MainPresenterInput) {
        showNewCollectionModule()
    }
    
    func moduleWantsToOpenThemes(_ module: MainPresenterInput, title: String) {
        showThemesModule(title: title)
    }
}


// MARK: - NewCollectionPresenterOutput

extension MainFlowCoordinator: NewCollectionPresenterOutput {
    
    func moduleWantsToClose(_ module: NewCollectionPresenterInput) {
        mainModuleViewController?.dismiss(animated: true)
    }
    
    func moduleWantsToChooseIcon(_ module: NewCollectionPresenterInput) {
        showChooseIconModule()
    }
    
    func moduleWantsToAddCollectionAndClose(_ module: NewCollectionPresenterInput) {
        mainModule?.refreshCollections()
        mainModuleViewController?.dismiss(animated: true)
    }
}

// MARK: - ChooseIconPresenterOutput

extension MainFlowCoordinator:  ChooseIconPresenterOutput {
    
    func moduleWantsToClose(_ module: ChooseIconPresenterInput) {
        
    }
    
    func moduleWantsToChooseIcon(_ module: ChooseIconPresenterInput) {
        
    }
    
}


// MARK: - ThemesPresenterOutput

extension MainFlowCoordinator: ThemesPresenterOutput {

    func moduleWantsToOpenCards(_ module: ThemesPresenterInput) {
        showCardsModule()
    }
    
    func moduleWantsToClose(_ module: ThemesPresenterInput) {
        parentViewController.popViewController(animated: true)
    }
}


// MARK: - CardsPresenterOutput

extension MainFlowCoordinator: CardsPresenterOutput {
    
    func moduleWantsToOpenCardDetails(_ module: CardsPresenterInput) {
        showCardDetailsModule()
    }
    
    func moduleWantsToOpenNewCard(_ module: CardsPresenterInput) {
        showNewCardModule()
    }
}


// MARK: - CardDetailsPresenterOutput

extension MainFlowCoordinator: CardDetailsPresenterOutput {
    
    func moduleWantsToClose(_ module: CardsPresenterInput) {
        parentViewController.dismiss(animated: true)
    }
}


// MARK: - NewCardPresenterOutput

extension MainFlowCoordinator: NewCardPresenterOutput {
    
    func moduleWantsToClose(_ module: NewCardPresenterInput) {
        parentViewController.dismiss(animated: true)
        // update UI
    }
}

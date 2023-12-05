//
//  MainFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

protocol MainFlowCoordinatorInput: AnyObject {
    
    func refreshThemesModule()
}

protocol MainFlowCoordinatorOutput: AnyObject {
    
    func setMainFlowCoordinatorInput(input: MainFlowCoordinatorInput)
    func openSettingsTab()
}

final class MainFlowCoordinator {
    
    // MARK: Private
    
    private let output: MainFlowCoordinatorOutput
    private let parentViewController: UINavigationController
    private let assembly: ApplicationAssembly
    private var mainModuleViewController: UIViewController?
    private var newCollectionViewControllerr: UIViewController?
    private weak var mainModule: MainPresenterInput?
    private weak var themesModule: ThemesPresenterInput?
    private weak var newCollectionModule: NewCollectionPresenterInput?
    private weak var cardsModule: CardsPresenterInput?
    
    // MARK: Lifecycle
    
    init(
        output: MainFlowCoordinatorOutput,
        parentViewController: UINavigationController,
        assembly: ApplicationAssembly
    ) {
        self.output = output
        self.parentViewController = parentViewController
        self.assembly = assembly
    }
    
    // MARK: Private
    
    private func showMainModule() {
        let builder = MainModuleBuilder(
            output: self,
            storageService: assembly.servicesAssembly.storageService,
            notificationService: assembly.uiAssembly.notificationService,
            userDefaultsService: assembly.servicesAssembly.userDefaultsService
        )
        let mainViewController = builder.build()
        
        mainModuleViewController = mainViewController
        parentViewController.pushViewController(mainViewController, animated: true)
    }
    
    private func showNewCollectionModule(isEditing: Bool, collectionName: String?) {
        let builder = NewCollectionModuleBuilder(
            output: self,
            isEditing: isEditing,
            collectionName: collectionName,
            storageService: assembly.servicesAssembly.storageService,
            notificationService: assembly.uiAssembly.notificationService
        )
        let newCollectionViewController = builder.build()
        
        newCollectionViewControllerr = newCollectionViewController
        newCollectionViewController.modalPresentationStyle = .fullScreen
        mainModuleViewController?.present(newCollectionViewController, animated: true)
    }
    
    private func showChooseIconModule() {
        let builder = ChooseIconModuleBuilder(
            output: self,
            imageProvider: assembly.uiAssembly.imageProviderService
        )
        let chooseIconViewController = builder.build()
        
        newCollectionViewControllerr?.present(chooseIconViewController, animated: true)
    }
    
    private func showThemesModule(collectionName: String, creationDate: Date) {
        let builder = ThemesModuleBuilder(
            output: self,
            collectionName: collectionName,
            creationDate: creationDate,
            storageService: assembly.servicesAssembly.storageService,
            userDefaultsService: assembly.servicesAssembly.userDefaultsService,
            notificationService: assembly.uiAssembly.notificationService
        )
        let themesViewController = builder.build()
        
        parentViewController.pushViewController(themesViewController, animated: true)
    }
    
    private func showCardsModule(themeName: String) {
        let builder = CardsModuleBuilder(
            output: self,
            themeName: themeName,
            storageService: assembly.servicesAssembly.storageService
        )
        let cardsViewController = builder.build()
        
        parentViewController.pushViewController(cardsViewController, animated: true)
    }
    
    private func showCardDetailsModule(card: CardCellDataModel) {
        let builder = CardDetailsModuleBuilder(
            output: self,
            card: card
        )
        let cardDetailsViewController = builder.build()
        
        parentViewController.present(cardDetailsViewController, animated: true)
    }
    
    private func showNewCardModule(themeName: String, cardName: String?, isEditing: Bool) {
        let builder = NewCardModuleBuilder(
            output: self,
            themeName: themeName,
            cardName: cardName,
            isEditing: isEditing,
            storageService: assembly.servicesAssembly.storageService
        )
        let newCardViewController = builder.build()
        
        newCardViewController.modalPresentationStyle = .fullScreen
        parentViewController.present(newCardViewController, animated: true)
    }
}

// MARK: - FlowCoordinatorProtocol

extension MainFlowCoordinator: FlowCoordinatorProtocol {
    func start() {
        showMainModule()
        output.setMainFlowCoordinatorInput(input: self)
    }
    
    func finish(completion: (() -> Void)?) {
        // TODO: финишировать координатор при добавлении контроллера логина
    }
}

// MARK: - MainFlowCoordinatorInput
extension MainFlowCoordinator: MainFlowCoordinatorInput {

    func refreshThemesModule() {
        themesModule?.refreshModule()
    }
}

// MARK: - MainPresenterOutput

extension MainFlowCoordinator: MainPresenterOutput {
    
    func moduleDidLoad(_ module: MainPresenterInput) {
        mainModule = module
    }
    
    func moduleWantsToAddNewCollection(_ module: MainPresenterInput) {
        showNewCollectionModule(isEditing: false, collectionName: nil)
    }
    
    func moduleWantsToEditCollection(_ module: MainPresenterInput, collectionName: String) {
        showNewCollectionModule(isEditing: true, collectionName: collectionName)
    }
    
    func moduleWantsToOpenThemes(_ module: MainPresenterInput, collectionName: String, creationDate: Date) {
        showThemesModule(collectionName: collectionName, creationDate: creationDate)
    }
    
    func moduleWantsToOpenSettingsTab() {
        output.openSettingsTab()
    }
}

// MARK: - NewCollectionPresenterOutput

extension MainFlowCoordinator: NewCollectionPresenterOutput {
    
    func moduleDidLoad(_ module: NewCollectionPresenterInput) {
        newCollectionModule = module
    }
    
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
    
    func moduleWantsToChooseIconAndClose(_ module: ChooseIconPresenterInput, icon: String) {
        newCollectionModule?.refreshImageView(icon: icon)
        newCollectionViewControllerr?.dismiss(animated: true)
    }
}

// MARK: - ThemesPresenterOutput

extension MainFlowCoordinator: ThemesPresenterOutput {

    func moduleDidLoad(_ module: ThemesPresenterInput) {
        themesModule = module
    }

    func moduleWantsToOpenCards(_ module: ThemesPresenterInput, themeName: String) {
        showCardsModule(themeName: themeName)
    }
    
    func moduleWantsToClose(_ module: ThemesPresenterInput) {
        parentViewController.popViewController(animated: true)
    }
}

// MARK: - CardsPresenterOutput

extension MainFlowCoordinator: CardsPresenterOutput {
    
    func moduleDidLoad(_ module: CardsPresenterInput) {
        cardsModule = module
    }
    
    func moduleWantsToOpenCardDetails(_ module: CardsPresenterInput, card: CardCellDataModel) {
        showCardDetailsModule(card: card)
    }
    
    func moduleWantsToOpenNewCard(_ module: CardsPresenterInput, themeName: String, cardName: String?, isEditing: Bool) {
        showNewCardModule(themeName: themeName, cardName: cardName, isEditing: isEditing)
    }
    
    func moduleDidDeleteCardCard(_ module: CardsPresenterInput) {
        themesModule?.refreshModule()
    }
}

// MARK: - CardDetailsPresenterOutput

// FIXME: выпилить, если не нужно
extension MainFlowCoordinator: CardDetailsPresenterOutput {}

// MARK: - NewCardPresenterOutput

extension MainFlowCoordinator: NewCardPresenterOutput {
    
    func moduleWantsToClose(_ module: NewCardPresenterInput) {
        parentViewController.dismiss(animated: true)
    }
    
    func moduleWantsToAddNewCard(_ module: NewCardPresenterInput) {
        cardsModule?.refreshModule()
        themesModule?.refreshModule()
        parentViewController.dismiss(animated: true)
    }
}

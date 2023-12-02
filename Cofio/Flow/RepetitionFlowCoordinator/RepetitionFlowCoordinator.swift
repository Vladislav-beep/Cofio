//
//  RepetitionFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 13.12.2022.
//

import UIKit

protocol RepetitionFlowCoordinatorOutput: AnyObject {
    
    func repetitionFlowWantsToUpdateModules()
}

final class RepetitionFlowCoordinator {
    
    // MARK: Private
    
    private let output: RepetitionFlowCoordinatorOutput
    private let parentViewController: UINavigationController
    private let assembly: ApplicationAssembly
    private weak var repetitionModule: RepetitionPresenterInput?
    
    // MARK: Lifecycle
    
    init(
        output: RepetitionFlowCoordinatorOutput,
        parentViewController: UINavigationController,
        assembly: ApplicationAssembly
    ) {
        self.output = output
        self.parentViewController = parentViewController
        self.assembly = assembly
    }
    
    // MARK: Private
    
    private func showRepetitionModule() {
        let builder = RepetitionModuleBuilder(
            output: self,
            storageService: assembly.servicesAssembly.storageService
        )
        let repetitionViewController = builder.build()
        
        parentViewController.pushViewController(repetitionViewController, animated: true)
    }
    
    func showCardsRepetitionModule(themeName: String) {
        let builder = CardsRepetitionModuleBuilder(
            output: self,
            storageService: assembly.servicesAssembly.storageService,
            userDefaultsService: assembly.servicesAssembly.userDefaultsService,
            repetitionService: assembly.servicesAssembly.repetitionService,
            dateFormatterService: assembly.servicesAssembly.dateFormatterService,
            themeName: themeName
        )
        let cardsRepetitionViewController = builder.build()
        
        parentViewController.pushViewController(cardsRepetitionViewController, animated: true)
    }
    
    private func showFinishOffer(themeName: String, repeatDate: String, isCompleted: Bool) {
        let builder = FinishRepetitionOfferModuleBuilder(
            output: self,
            themeName: themeName,
            repeatDate: repeatDate,
            isCompleted: isCompleted
        )
        let finishRepetitionOfferViewController = builder.build()
        
        finishRepetitionOfferViewController.modalPresentationStyle = .fullScreen
        parentViewController.present(finishRepetitionOfferViewController, animated: true)
    }
}

// MARK: - FlowCoordinatorProtocol

extension RepetitionFlowCoordinator: FlowCoordinatorProtocol {
    func start() {
        showRepetitionModule()
    }
    
    func finish(completion: (() -> Void)?) {
        // TODO: финишировать координатор при добавлении контроллера логина
    }
}

// MARK: - RepetitionPresenterOutput

extension RepetitionFlowCoordinator: RepetitionPresenterOutput {
    
    func moduleDidLoad(_ module: RepetitionPresenterInput) {
        repetitionModule = module
    }
    
    func moduleWantsToOpenCardsRepetition(_ module: RepetitionPresenterInput, themeName: String) {
        showCardsRepetitionModule(themeName: themeName)
    }
}

// MARK: - CardsRepetitionPresenterOutput

extension RepetitionFlowCoordinator: CardsRepetitionPresenterOutput {

    func moduleWantsToOpenFinishOffer(_ module: CardsRepetitionPresenterInput, themeName: String, repeatDate: String?, isCompleted: Bool) {
        showFinishOffer(themeName: themeName, repeatDate: repeatDate ?? "", isCompleted: isCompleted)
    }
}

// MARK: - FinishRepetitionOfferPresenterOutput

extension RepetitionFlowCoordinator: FinishRepetitionOfferPresenterOutput {
    
    func moduleWantsToClose(_ module: FinishRepetitionOfferPresenterInput) {
        repetitionModule?.refreshView()
        output.repetitionFlowWantsToUpdateModules()
        parentViewController.popToRootViewController(animated: true)
        parentViewController.dismiss(animated: true)
    }
}

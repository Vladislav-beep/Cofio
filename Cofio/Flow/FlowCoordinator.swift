//
//  FlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class FlowCoordinator1 {
    
    // MARK: Private
    
    private let parentVC: UINavigationController
    private var languagesVC: UIViewController?
    private var newLangVC: UIViewController?
    private var navVC: UINavigationController?
    
    
    // MARK: Lifecycle
    
    init(vc: UINavigationController) {
        parentVC = vc
    }
    
    
    // MARK: Public
    
    func showLanguagesModule() {
        let builder = StartAppModuleBuilder(output: self)
        let vc = builder.build()
        
        languagesVC = vc
        //vc.modalPresentationStyle = .fullScreen
        parentVC.pushViewController(vc, animated: true)
    }
    
    func showNewLanguageModule() {
        let builder = NewLanguageModuleBuilder(output: self)
        let vc = builder.build()

        newLangVC = vc
        vc.modalPresentationStyle = .fullScreen
        languagesVC?.present(vc, animated: true)
    }
    
    func showTabbar() {
//        let builder = TabBarModuleBuilder(output: self)
//
//        let vc = builder.build()
//
//        languagesVC?.present(vc, animated: true)

//        let flow = TabBarFlowCoordinator(parentViewController: languagesVC ?? UIViewController(), output: self)
//        flow.start()
        
        let builder = CollectionsModuleBuilder(output: self)
        let vc = builder.build()
        let nav = UINavigationController(rootViewController: vc)
        navVC = nav
        nav.modalPresentationStyle = .fullScreen
        languagesVC?.present(nav, animated: true)
    }
    
    func showCardsModule() {
        let builder = CardsModuleBuilder(output: self)
        let vc = builder.build()
        navVC?.pushViewController(vc, animated: true)
    }
    
    func showWordModule() {
        let builder = WordModuleBuilder(output: self)
        let vc = builder.build()
        vc.modalPresentationStyle = .fullScreen
        navVC?.present(vc, animated: true)
    }
    
    func showRepetitonModule() {
        let builder = RepetitionModuleBuilder(output: self)
        let vc = builder.build()
        let nav1 = UINavigationController(rootViewController: vc)
        nav1.modalPresentationStyle = .fullScreen
        navVC?.present(nav1, animated: true)
    }
}

// MARK: - FlowCoordinatorProtocol

extension FlowCoordinator1: FlowCoordinatorProtocol {
    func start() {
        showLanguagesModule()
    }
    
    func finish() {
        // unused
    }
}


// MARK: - StartAppPresenterOutput

extension FlowCoordinator1: StartAppPresenterOutput {
    
    func moduleWantsToOpenTabbar(_ module: StartAppPresenterInput) {
        showTabbar()
    }
    
    
    func moduleWantsToAddNewLanguage(_ module: StartAppPresenterInput) {
        showNewLanguageModule()
    }
}


// MARK: - NewLanguagePresenterOutput

extension FlowCoordinator1: NewLanguagePresenterOutput {
    
    func moduleWantsToClose(_ module: NewLanguagePresenterInput) {
        languagesVC?.dismiss(animated: true)
    }
}

extension FlowCoordinator1: CollectionsPresenterOutput {
    
    func moduleWantsToOpenRepetition(_ module: CollectionsPresenterInput) {
        showRepetitonModule()
    }
    
    
    func moduleWantsToClose(_ module: CollectionsPresenterInput) {
        languagesVC?.dismiss(animated: true)
    }
    
    
    func moduleWantsToOpenCards(_ module: CollectionsPresenterInput) {
        showCardsModule()
    }
}

extension FlowCoordinator1: CardsPresenterOutput {
    
    func moduleWantsToOpenWord(_ module: CardsPresenterInput) {
        showWordModule()
    }
}

extension FlowCoordinator1: WordPresenterOutput {
    
    func moduleWantsToClose(_ module: WordPresenterInput) {
        navVC?.dismiss(animated: true)
    }
}


extension FlowCoordinator1: RepetitionPresenterOutput {}

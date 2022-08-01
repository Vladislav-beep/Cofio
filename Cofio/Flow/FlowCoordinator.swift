//
//  FlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class FlowCoordinator {
    
    // MARK: Private
    
    private let parentVC: UIViewController
    private var languagesVC: UIViewController?
    private var newLangVC: UIViewController?
    private var navVC: UINavigationController?
    
    
    // MARK: Lifecycle
    
    init(vc: UIViewController) {
        parentVC = vc
    }
    
    
    // MARK: Public
    
    func showLanguagesModule() {
        let builder = StartAppModuleBuilder(output: self)
        
        let vc = builder.build()
        languagesVC = vc
        vc.modalPresentationStyle = .fullScreen
        parentVC.present(vc, animated: false)
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
}

// MARK: - FlowCoordinatorProtocol

extension FlowCoordinator: FlowCoordinatorProtocol {
    func start() {
        showLanguagesModule()
    }
    
    func finish() {
        // unused
    }
}


// MARK: - StartAppPresenterOutput

extension FlowCoordinator: StartAppPresenterOutput {
    
    func moduleWantsToOpenTabbar(_ module: StartAppPresenterInput) {
        showTabbar()
    }
    
    
    func moduleWantsToAddNewLanguage(_ module: StartAppPresenterInput) {
        showNewLanguageModule()
    }
}


// MARK: - NewLanguagePresenterOutput

extension FlowCoordinator: NewLanguagePresenterOutput {
    
    func moduleWantsToClose(_ module: NewLanguagePresenterInput) {
        languagesVC?.dismiss(animated: true)
    }
}

extension FlowCoordinator: TabBarModuleOutput {
    
    func moduleWantsToAddTab(_ module: TabBarModuleInput) {
        
    }
}

extension FlowCoordinator: TabBarModuleFlowOutput {}

extension FlowCoordinator: CollectionsPresenterOutput {
    
    func moduleWantsToClose(_ module: CollectionsPresenterInput) {
        languagesVC?.dismiss(animated: true)
    }
    
    
    func moduleWantsToOpenCards(_ module: CollectionsPresenterInput) {
        showCardsModule()
    }
}

extension FlowCoordinator: CardsPresenterOutput {}

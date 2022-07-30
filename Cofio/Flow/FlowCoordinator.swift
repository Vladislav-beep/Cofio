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
  //      let builder = CardsModuleBuilder(output: self)
        
    //    let vc = builder.build()
        
        let vc = UITabBarController()
        languagesVC?.present(vc, animated: true)
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

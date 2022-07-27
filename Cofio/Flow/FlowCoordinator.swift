//
//  FlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class FlowCoordinator {
    
    private let parentVC: UIViewController
    private var languagesVC: UIViewController?
    private var newLangVC: UIViewController?
    
    init(vc: UIViewController) {
        parentVC = vc
    }
    
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
    
    func showNext() {
        let builder = CardsModuleBuilder(output: self)
        
        let vc = builder.build()
        newLangVC?.present(vc, animated: true)
    }
}

extension FlowCoordinator: FlowCoordinatorProtocol {
    func start() {
        showLanguagesModule()
    }
    
    func finish() {
        // unused
    }
}

extension FlowCoordinator: StartAppPresenterOutput {
    
    func moduleWantsToAddNewLanguage(_ module: StartAppPresenterInput) {
        showNewLanguageModule()
    }
}

extension FlowCoordinator: NewLanguagePresenterOutput {
    
    func moduleWantsToGoNext(_ module: NewLanguagePresenterInput) {
        showNext()
    }
    
    
    func moduleWantsToClose(_ module: NewLanguagePresenterInput) {
        languagesVC?.dismiss(animated: true)
    }
}

extension FlowCoordinator: CardsPresenterOutput {}

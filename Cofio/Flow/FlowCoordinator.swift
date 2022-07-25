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
    
    init(vc: UIViewController) {
        parentVC = vc
    }
    
    func showLanguagesModule() {
        let builder = LanguagesModuleBuilder(output: self)
        
        let vc = builder.build()
        languagesVC = vc
        vc.modalPresentationStyle = .fullScreen
        parentVC.present(vc, animated: false)
    }
    
    func showNewLanguageModule() {
        let builder = NewLanguageModuleBuilder(output: self)
        
        let vc = builder.build()
        
        languagesVC?.present(vc, animated: true)
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

extension FlowCoordinator: LanguagesPresenterOutput {
    
    func moduleWantsToAddNewLanguage(_ module: LanguagesPresenterInput) {
        showNewLanguageModule()
    }
}

extension FlowCoordinator: NewLanguagePresenterOutput {
    
}

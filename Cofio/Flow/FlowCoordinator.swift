//
//  FlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class FlowCoordinator {
    
    private let parentVC: UIViewController
    
    init(vc: UIViewController) {
        parentVC = vc
    }
    
    func showLanguagesModule() {
        let builder = LanguagesModuleBuilder(output: self)
        
        let vc = builder.build()
        vc.modalPresentationStyle = .fullScreen
        parentVC.present(vc, animated: false)
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

extension FlowCoordinator: LanguagesPresenterOutput {}

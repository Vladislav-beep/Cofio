//
//  LanguagesModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class StartAppModuleBuilder {
    
    private var output: FlowCoordinator
    
    init(output: FlowCoordinator) {
        self.output = output
    }
    
    func build() -> UIViewController {
        let interactor = StartAppInteractor()
        let presenter = StartAppPresenter(interactor: interactor)
        let viewController = StartAppViewController(output: presenter, coordinater: output)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

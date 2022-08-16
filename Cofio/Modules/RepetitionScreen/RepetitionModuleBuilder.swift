//
//  RepetitionModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

import UIKit

final class RepetitionModuleBuilder {
    
    private weak var output: RepetitionPresenterOutput?
    
    init(output: RepetitionPresenterOutput) {
        self.output = output
    }
    
    func build() -> UIViewController {
        let interactor = RepetitonInteractor()
        let presenter = RepetitionPresenter(interactor: interactor)
        let viewController = RepetitionViewController(output: presenter)
        
        presenter.view = viewController
        interactor.output = presenter
        
        presenter.output = output
        
        return viewController
    }
}

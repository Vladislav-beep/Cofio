//
//  ChooseIconModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 22.12.2022.
//

import UIKit

final class ChooseIconModuleBuilder {
    
    // MARK: Private
    
    private weak var output: ChooseIconPresenterOutput?
    
    // MARK: Lifecycle
    
    init(output: ChooseIconPresenterOutput) {
        self.output = output
    }
    
    // MARK: Public
    
    func build() -> UIViewController {
        let imageProvider = ImageProvider()
        let presenter = ChooseIconPresenter(imageProvider: imageProvider)
        
        let viewController = ChooseIconViewController(output: presenter)
        
        presenter.view = viewController
        
        presenter.output = output
        
        return viewController
    }
}

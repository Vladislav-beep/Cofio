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
    private let imageProvider: ImageProviderProtocol
    
    // MARK: Lifecycle
    
    init(
        output: ChooseIconPresenterOutput,
        imageProvider: ImageProviderProtocol
    ) {
        self.output = output
        self.imageProvider = imageProvider
    }
    
    // MARK: Public
    
    func build() -> UIViewController {
        let presenter = ChooseIconPresenter(imageProvider: imageProvider)
        
        let viewController = ChooseIconViewController(output: presenter)
        
        presenter.view = viewController
        
        presenter.output = output
        
        return viewController
    }
}

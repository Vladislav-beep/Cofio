//
//  CardDetailsModuleBuilder.swift
//  Cofio
//
//  Created by Владислав Сизонов on 17.12.2022.
//

import UIKit

final class CardDetailsModuleBuilder {
    
    // MARK: Private
    
    private weak var output: CardDetailsPresenterOutput?
    private let card: CardCellDataModel
    
    
    // MARK: Lifecycle
    
    init(output: CardDetailsPresenterOutput,
         card: CardCellDataModel) {
        self.output = output
        self.card = card
    }
    
    
    // MARK: Public
    
    func build() -> UIViewController {
        let dataSource = CardDetailsDataSource()
        let presenter = CardDetailsPresenter(card: card)
        let viewController = CardDetailsViewController(output: presenter, dataSource: dataSource)
        
        presenter.view = viewController
        presenter.output = output
        
        return viewController
    }
}

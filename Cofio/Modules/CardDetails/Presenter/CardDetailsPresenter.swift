//
//  CardDetailsPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 17.12.2022.
//

final class CardDetailsPresenter {
    
    // MARK: Private properties
    
    private let card: CardCellDataModel
        
    // MARK: Public properties
    
    weak var output: CardDetailsPresenterOutput?
    weak var view: CardDetailsViewInput?
    
    // MARK: Lifecycle
    
    init(card: CardCellDataModel) {
        self.card = card
    }
}

// MARK: - CardsViewOutput

extension CardDetailsPresenter: CardDetailsViewOutput {
    
    func viewDidLoad() {
        view?.updateView(model: card)
    }
}

// MARK: - CardsPresenterInput

extension CardDetailsPresenter: CardDetailsPresenterInput {}

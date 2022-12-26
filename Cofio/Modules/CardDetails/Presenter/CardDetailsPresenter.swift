//
//  CardDetailsPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 17.12.2022.
//

final class CardDetailsPresenter {
        
    // MARK: Public properties
    
    weak var output: CardDetailsPresenterOutput?
    weak var view: CardDetailsViewInput?
    private let card: CardCellDataModel
    
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

extension CardDetailsPresenter: CardsPresenterInput {}

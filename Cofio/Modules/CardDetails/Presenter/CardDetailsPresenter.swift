//
//  CardDetailsPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 17.12.2022.
//

final class CardDetailsPresenter {
        
    // MARK: Public properties
    
    weak var output: CardDetailsPresenterOutput?

}


// MARK: - CardsViewOutput

extension CardDetailsPresenter: CardDetailsViewOutput {
    func close() {
        output?.moduleWantsToClose(self)
    }
}


// MARK: - CardsPresenterInput

extension CardDetailsPresenter: CardsPresenterInput {}

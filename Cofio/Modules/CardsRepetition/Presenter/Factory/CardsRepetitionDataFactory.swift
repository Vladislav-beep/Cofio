//
//  CardsRepetitionDataFactory.swift
//  Cofio
//
//  Created by Владислав Сизонов on 04.01.2023.
//

import Foundation

protocol CardsRepetitionDataFactoryProtocol {
    
    func dataFromRepetitionCards(cards: [Card]) -> [RepetitionCardCellDataModel]
}

final class CardsRepetitionDataFactory: CardsRepetitionDataFactoryProtocol {
    
    // MARK: Public
    
    func dataFromRepetitionCards(cards: [Card]) -> [RepetitionCardCellDataModel] {
        var cardCellModels: [RepetitionCardCellDataModel] = []
        
        for card in cards {
            let cardCell = RepetitionCardCellDataModel(id: UUID(), definition: card.cardDefinition ?? "", description: card.cardDescription ?? "", descriptionShown: false)
            cardCellModels.append(cardCell)
        }
        
        return cardCellModels
    }
}

//
//  CardsDataFactory.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.12.2022.
//

protocol CardsDataFactoryProtocol {
    
    func dataFromCards(cards: [Card]) -> [CardCellDataModel]
}

final class CardsDataFactory: CardsDataFactoryProtocol {
    
    // MARK: Public
    
    func dataFromCards(cards: [Card]) -> [CardCellDataModel] {
        var cardCellModels: [CardCellDataModel] = []
        
        for card in cards {
            let cardCell = CardCellDataModel(definition: card.cardDefinition ?? "", description: card.cardDescription ?? "")
            cardCellModels.append(cardCell)
        }
        
        return cardCellModels
    }
}

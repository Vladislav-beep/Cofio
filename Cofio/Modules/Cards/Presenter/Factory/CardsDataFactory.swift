//
//  CardsDataFactory.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.12.2022.
//

import Foundation

protocol CardsDataFactoryProtocol {
    
    func dataFromCards(cards: [Card]) -> [CardCellsDataModel]
}

final class CardsDataFactory: CardsDataFactoryProtocol {
    
    // MARK: Public
    
    func dataFromCards(cards: [Card]) -> [CardCellsDataModel] {
        var cardCellModels: [CardCellsDataModel] = []
        
        if cards.isEmpty {
            let emptyCell = CardCellsDataModel.empty(.init(title: "cards_module_empty_cell_title"~))
            cardCellModels.append(emptyCell)
            return cardCellModels
        }
        
        let sortedCards = cards.sorted { $0.creationDate ?? Date() > $1.creationDate ?? Date() }
        for card in sortedCards {
            let cardCell = CardCellsDataModel.card(.init(
                definition: card.cardDefinition ?? "",
                description: card.cardDescription ?? "",
                creationDate: card.creationDate ?? Date())
            )
            cardCellModels.append(cardCell)
        }
        
        return cardCellModels
    }
}

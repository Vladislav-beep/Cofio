//
//  CardsDataFactory.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.12.2022.
//

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
        
        for card in cards {
            let cardCell = CardCellsDataModel.card(.init(definition: card.cardDefinition ?? "", description: card.cardDescription ?? ""))
            cardCellModels.append(cardCell)
        }
        
        return cardCellModels
    }
}

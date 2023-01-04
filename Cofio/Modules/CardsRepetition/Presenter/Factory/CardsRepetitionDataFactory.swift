//
//  CardsRepetitionDataFactory.swift
//  Cofio
//
//  Created by Владислав Сизонов on 04.01.2023.
//

protocol CardsRepetitionDataFactoryProtocol {
    
    func dataFromRepetitionCards(cards: [Card]) -> [CardCellsDataModel]
}

final class CardsRepetitionDataFactory: CardsRepetitionDataFactoryProtocol {
    
    // MARK: Public
    
    func dataFromRepetitionCards(cards: [Card]) -> [CardCellsDataModel] {
        var cardCellModels: [CardCellsDataModel] = []
        
        if cards.isEmpty {
            let emptyCell = CardCellsDataModel.empty(.init(title: "cards_repetition_module_empty_cell_title"~))
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

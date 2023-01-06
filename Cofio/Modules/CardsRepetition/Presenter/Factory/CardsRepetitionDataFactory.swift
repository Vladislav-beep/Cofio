//
//  CardsRepetitionDataFactory.swift
//  Cofio
//
//  Created by Владислав Сизонов on 04.01.2023.
//

protocol CardsRepetitionDataFactoryProtocol {
    
    func dataFromRepetitionCards(cards: [Card]) -> [RepetitionCardCellsDataModel]
}

final class CardsRepetitionDataFactory: CardsRepetitionDataFactoryProtocol {
    
    // MARK: Public
    
    func dataFromRepetitionCards(cards: [Card]) -> [RepetitionCardCellsDataModel] {
        var cardCellModels: [RepetitionCardCellsDataModel] = []
        
        if cards.isEmpty {
            let emptyCell = RepetitionCardCellsDataModel.empty(.init(title: "cards_repetition_module_empty_cell_title"~))
            cardCellModels.append(emptyCell)
            return cardCellModels
        }
        
        for card in cards {
            let cardCell = RepetitionCardCellsDataModel.card(.init(definition: card.cardDefinition ?? "", description: card.cardDescription ?? "", descriptionShown: false))
            cardCellModels.append(cardCell)
        }
        
        return cardCellModels
    }
}

//
//  CardsInteractorProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

protocol CardsInteractorInput: AnyObject {
    
    func getThemeName() -> String
    func getCardsFromStorage() -> [Card]
    func deleteCard(cardName: String)
}

protocol CardsInteractorOutput: AnyObject {}


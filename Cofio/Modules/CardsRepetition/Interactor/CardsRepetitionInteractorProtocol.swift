//
//  CardsRepetitionProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

protocol CardsRepetitionInteractorInput: AnyObject {
    
    func getThemeName() -> String
    func fetchCards() -> [Card]
}

protocol CardsRepetitionInteractorOutput: AnyObject {}

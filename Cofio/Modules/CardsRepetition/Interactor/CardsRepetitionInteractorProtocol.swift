//
//  CardsRepetitionProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

protocol CardsRepetitionInteractorInput: AnyObject {
    
    func getThemeName() -> String
    func fetchCards() -> [Card]
    func updateTheme()
    func fetchTheme() -> Theme
}

protocol CardsRepetitionInteractorOutput: AnyObject {}

//
//  NewCardInteractorProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

protocol NewCardInteractorInput: AnyObject {
    
    func createCard(definition: String, description: String)
    func getCard() -> Card
    func updateCard(cardDefinition: String, newDefinition: String, newDescription: String)
}

protocol NewCardInteractorOutput: AnyObject {}

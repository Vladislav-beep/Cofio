//
//  CardsPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

protocol CardsPresenterInput: AnyObject {
    
    func refreshModule()
}

protocol CardsPresenterOutput: AnyObject {
    
    func moduleDidLoad(_ module: CardsPresenterInput)
    func moduleWantsToOpenCardDetails(_ module: CardsPresenterInput, card: CardCellDataModel)
    func moduleWantsToOpenNewCard(_ module: CardsPresenterInput, themeName: String, cardName: String?, isEditing: Bool)
}

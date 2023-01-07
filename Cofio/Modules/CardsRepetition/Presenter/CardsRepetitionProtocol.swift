//
//  CardsRepetitionProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

protocol CardsRepetitionPresenterInput: AnyObject {}

protocol CardsRepetitionPresenterOutput: AnyObject {
    
    func moduleWantsToOpenFinishOffer(_ module: CardsRepetitionPresenterInput, themeName: String, repeatDate: String?, isCompleted: Bool)
}

//
//  CardDetailsPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 17.12.2022.
//

protocol CardDetailsPresenterInput: AnyObject {}

protocol CardDetailsPresenterOutput: AnyObject {
    
    func moduleWantsToClose(_ module: CardsPresenterInput)
}


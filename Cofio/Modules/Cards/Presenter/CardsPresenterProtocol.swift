//
//  CardsPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

protocol CardsPresenterInput: AnyObject {}

protocol CardsPresenterOutput: AnyObject {
    
    func moduleWantsToOpenCardDetails(_ module: CardsPresenterInput)
}

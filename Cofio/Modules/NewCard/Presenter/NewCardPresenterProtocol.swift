//
//  NewCardPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

protocol NewCardPresenterInput: AnyObject {}

protocol NewCardPresenterOutput: AnyObject {
    
    func moduleWantsToClose(_ module: NewCardPresenterInput)
    func moduleWantsToAddNewCard(_ module: NewCardPresenterInput)
}
